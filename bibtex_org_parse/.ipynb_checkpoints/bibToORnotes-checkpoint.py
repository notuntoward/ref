# -*- coding: utf-8 -*-
# %% [markdown]
# ### TODO: can all that #+ tag crap be at the bottom of the org note?
# Partial answer:  If I move this stuff to the end of an org-roam note and delete the db, OR is still able to find it correctly, so it apparently reads #+ anywhere.
# The only problem so far is that if there are not roam_tags, and I run M-x org-roam-tag-add, it puts the new #+ thing at the top of the file, even if all the other #+ stuff is at the bottom.
#
# Create a feature request??
#
# ### TODO: different formatting for title and author/date at top:  all italics?
# ### TODO: stem keywords with NLTK?

# %%
from pathlib import Path
import re
from bibtexparser.bparser import BibTexParser
from dateutil.parser import parse
import string
from collections import defaultdict

# %%
refDir = Path("C:/Users/scott/OneDrive - Clean Power Research/ref")
bibDirBase = refDir

bibInNm = "deepSolarDOE"
bibInNm = "newTechAdopt"
bibInNm = "energy"

bibInFNm = bibDirBase / f"{bibInNm}.bib"
noteOutDir = Path("C:/Users/scott/tmp/bibNotesOR")

matchWhiteSpace_regexp = re.compile(r"\s+") # for colapsing/replacing whitespace
matchLeadStars_regexp = re.compile(r"\s+") # for de-orgifying orig .bib comments

# %%
# Read source .bib as string so can handle parsing in a separate step, avoiding
# error throwing on unquoted .bib fields to right of '='.
# (If bibtexparser were to write them out, they would be restored as in the
# original bib file).

with open(bibInFNm, encoding="utf8") as bibtex_file:
    bibtex_str = bibtex_file.read()

bp = BibTexParser(interpolate_strings=False)
bib_database = bp.parse(bibtex_str)

# %% [markdown]
# ### Write bib fields to org-roam notes

# %%
# Collect all bibtex keys in the .bib file, and make roam_tags strings
bibkeysAll = set()
keywordsCntAll = defaultdict(lambda: 0)
keywordsItem = defaultdict(lambda: [])
remPunctTable = str.maketrans('', '', string.punctuation)

# Collect all bibkeys and the keywords for each item
for bibitem in bib_database.entries:
    bibkey = bibitem['ID']
    bibkeysAll.add(bibkey)

    if "keywords" in bibitem:
        # convert various .bib keyword lists to OR format
        kws_full_list = []
        for kw in re.split(', |; |,|;', bibitem['keywords']):
            if len(kw) > 0:
                kw = kw.translate(remPunctTable)
                kw = matchWhiteSpace_regexp.sub("_", kw).strip("_").lower()
                keywordsCntAll[kw] += 1
                keywordsItem[bibkey] += [kw]

# Remove rare keywords and then make roam_tags string for each bibkey
nOccurMin = 3
keepKeywordsDict = {kw: count for kw, count in keywordsCntAll.items() if count >= nOccurMin}
keepKeywords = set(keepKeywordsDict.keys())

roam_tags_str = dict()
for bibkey, kws in keywordsItem.items():
    kwsItemKeep = keepKeywords.intersection(kws)

    if len(kwsItemKeep) > 0:
        roam_tags_str[bibkey] = f'#+roam_tags: {" ".join(kwsItemKeep)}'

print(f"keeping {len(keepKeywords)} of {len(keywordsCntAll)} unique keywords")


# %%
# Translate selected .bib entries to org-roam note syntax, and write notes

def replace_leading(source, char="o"):
    """A leading string of '*' is replaced w/ o's, avoiding org-mode trouble"""
    stripped = source.lstrip('*')
    return char * (len(source) - len(stripped)) + stripped


def fix_comment_stars(commentstr):
    """.bib entries weren't org-aware, messy use of '*': replace w/ 'o' """
    outlns = []
    for ln in commentstr.split('\n'):
        outlns += [replace_leading(ln, 'o')]

    return "\n".join(outlns)


def bibitem_to_ORnote(bibitem):
    """Makes org-roam note text from a .bib file item"""
    bibkey = bibitem['ID']
    noteLns = [f"#+title:{bibkey}"]
    if "timestamp" in bibitem:
        try:
            dt = parse(bibitem['timestamp'])
            timeStr = dt.strftime('%Y-%m-%d %a')
        except:
            timeStr = "?"

        noteLns.append(f"#+created: [{timeStr}]")

    noteLns.append(f"#+roam_key: cite:{bibkey}")

    if bibkey in roam_tags_str:
        noteLns += [roam_tags_str[bibkey]]

    noteLns += [""]
    if "title" in bibitem:
        noteLns += [f"*{bibitem['title']}*"]

    tmpline = []
    if "author" in bibitem:
        tmpline += [bibitem['author']]

    if "year" in bibitem:
        tmpline += [f"({bibitem['year']})"]

    if len(tmpline) > 0:
        noteLns += [" ".join(tmpline)]

    if "comment" in bibitem:
        commentTxt = bibitem['comment']
        words = re.findall(r'\w+', commentTxt)
        words = set([w.translate(remPunctTable) for w in words])

        for citedKey in words.intersection(bibkeysAll):
            didReplace = True
            linkStr = f"[[file:{citedKey}.org][{citedKey}]]"
            commentTxt = commentTxt.replace(citedKey, linkStr)

        noteLns += ["", fix_comment_stars(commentTxt)]

    if "abstract" in bibitem:
        noteLns += ["", "* Abstract", bibitem['abstract']]

    return noteLns


# Write a separate org-roam note file for each .bib entry
for bibitem in bib_database.entries:
    noteLns = bibitem_to_ORnote(bibitem)

    noteOutFNm = noteOutDir / f"{bibitem['ID']}.org"
    with open(noteOutFNm, 'w', encoding="utf8") as fh:
        for ln in noteLns:
            fh.write('%s\n' % ln)

print("\nDone.")

# %% [markdown]
# ### Prototype code below.  Don't run.

# %%
# s = "energy_source, nuclear_power; nuclear_power;"

# kws_underscore=[]
# for kw in re.split(',|;|, |; ',s):
#     if len(kw) > 0:
#         kws_underscore += [matchWhiteSpace_regexp.sub("_", kw).strip("_")]

# kws_underscore

# %% [markdown]
# #### pybtex parser string examples

# %%
#from pybtex.database.input import bibtex
# bibitem['keywords']="CRPS, Diagnostic tools  , Evaluation framework, Ignorance Score, Probabilistic solar forecasting, Scoring rules"
# bibkws = bibitem['keywords'].split(", ")
# bibkws

# s = 'Probabilistic    solar forecasting'
# kws_underscore = []
# for kw in bibitem['keywords'].split(", "):
#     kws_underscore += [matchWhiteSpace_regexp.sub("_", kw.strip())]

# keywords = " ".join(kws_underscore)
# keywords


# %%
# bibtex = """@STRING{ jean = "Jean"}

# @ARTICLE{Cesar2013,
#   author = jean # { César},
#   title = {An amazing title},
#   year = {2013},
#   month = jan,
#   volume = {12},
#   pages = {12--23},
#   journal = {Nice Journal},
# }
# """

# bp = BibTexParser(interpolate_strings=False)
# bib_database = bp.parse(bibtex)
# bib_database.entries[0]
# as_text(bib_database.entries[0]['author'])

# %% [markdown]
# ### BibTeX::Parser
# I wasn't able to get this to not collapse whitespace so below is the hack to get around that.  Turns out that bibtexparser could do the job w/o the hacks.

# %%
# bibIn = bibtex.Parser().parse_file(bibInFNm)

# # get keys and whether or not it has a comment
# bibkeyFields = dict()
# for bibkey, bibitem in bibIn.entries.items():
#     if 'comment' in bibitem.fields:
#         bibkeyFields[bibkey] = True 
# %%
# keysWithComments = list(bibkeyFields.keys())
# nextKey = keysWithComments.pop(0)
# p = re.compile(f"^@.*{nextKey},")
# lnum=1
# with open(bibInFNm, encoding="utf8") as fileHandler:
#     try:
#         for ln in fileHandler:
#             ln = ln.rstrip()
#             if p.match((ln)):
#                 print(lnum, ln)
#                 nextKey = keysWithComments.pop(0)
#                 p = re.compile(f"^@.*{nextKey},")
#             lnum += 1
#     except:
#         print(f"trouble with line: {ln}")
