# -*- coding: utf-8 -*-
# %% [markdown]
# ### TODO: British spelling to American?
# I only found one example where this split a tag: "optimization".
# quick hack:
# https://stackoverflow.com/questions/42329766/python-nlp-british-english-vs-american-english
# https://stackoverflow.com/questions/18840640/python-2-7-find-and-replace-from-text-file-using-dictionary-to-new-text-file

# %%
from pathlib import Path
import re
from bibtexparser.bparser import BibTexParser
from dateutil.parser import parse
import string
from collections import defaultdict
from nltk.corpus import wordnet

# %%
refDir = Path("C:/Users/scott/OneDrive - Clean Power Research/ref")
bibDirBase = refDir

bibInNm = "deepSolarDOE"
bibInNm = "newTechAdopt"
bibInNm = "energy"

bibInFNm = bibDirBase / f"{bibInNm}.bib"
noteOutDir = Path("C:/Users/scott/tmp/bibNotesOR")

# for colapsing/replacing whitespace
matchWhiteSpace_regexp = re.compile(r"\s+")
# for de-orgifying orig .bib comments
matchLeadStars_regexp = re.compile(r"\s+")

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

# Collect all bibkeys and (normalized) keywords for each item
for bibitem in bib_database.entries:
    bibkey = bibitem['ID']
    bibkeysAll.add(bibkey)

    if "keywords" in bibitem:
        # convert various .bib keyword list formats to OR format
        for kw_phrase in re.split(', |; |,|;', bibitem['keywords']):
            if len(kw_phrase) > 0:
                # normalize to lowercase, no punctuation, singular, no spaces
                kw_phrase = kw_phrase.translate(remPunctTable).lower().split()
                for idx, word in enumerate(kw_phrase):
                    if (word_singular := wordnet.morphy(word)) is not None:
                        kw_phrase[idx] = word_singular

                kw_phrase = "_".join(kw_phrase)
                keywordsItem[bibkey] += [kw_phrase]
                keywordsCntAll[kw_phrase] += 1

# Remove rare keywords and then make a roam_tags string for each bibkey
nOccurMin = 3
keepKeywords = set({kw: count for kw, count in keywordsCntAll.items()
                    if count >= nOccurMin}.keys())

roam_tags_str = dict()
for bibkey in bibkeysAll:
    kws = keywordsItem[bibkey]
    kwsItemKeep = keepKeywords.intersection(kws)
    roam_tags_str[bibkey] = f'#+roam_tags: {" ".join(kwsItemKeep)}'

print(f"keeping {len(keepKeywords)} of {len(keywordsCntAll)} unique keywords")


# %%
# Translate selected .bib entries to org-roam note syntax, and write notes

def fix_comment_stars(commentStr):
    """Replace leading stars with 'o's.  Bib used '*'s which may
    result in inadvertently collapsed .org headlines"""

    outlns = []
    for ln in commentStr.split('\n'):
        noLstars = ln.lstrip('*')
        outlns += ["o" * (len(ln) - len(noLstars)) + noLstars]

    return "\n".join(outlns)


def bibitem_to_OR_note(bibitem):
    """Makes org-roam note text from a .bib file item.  The note contains 
    the .bib comment, abstract and metadata.  The filename, OR title and key
    are the .bib citekey."""

    bibkey = bibitem['ID']

    noteLns = []
    if "title" in bibitem:
        noteLns += [f"={bibitem['title']}="]

    authChunks = []
    if "author" in bibitem:
        authChunks += [bibitem['author']]

    if "year" in bibitem:
        authChunks += [f"({bibitem['year']})"]

    if len(authChunks) > 0:
        authStr = " ".join(authChunks)
        noteLns += [f"/{authStr}/"]

    if "comment" in bibitem:
        commentTxt = bibitem['comment']
        words = re.findall(r'\w+', commentTxt)
        words = set([w.translate(remPunctTable) for w in words])

        for citedKey in words.intersection(bibkeysAll):
            linkStr = f"[[file:{citedKey}.org][{citedKey}]]"
            commentTxt = commentTxt.replace(citedKey, linkStr)

        noteLns += ["", fix_comment_stars(commentTxt)]

    if "abstract" in bibitem:
        noteLns += ["", "* Abstract", bibitem['abstract']]

    noteLns += ["", "* Org-Roam Metadata", f"#+title:{bibkey}"]

    if "timestamp" in bibitem:
        try:
            dt = parse(bibitem['timestamp'])
            timeStr = dt.strftime('%Y-%m-%d %a')
        except:
            timeStr = "?"

        noteLns.append(f"#+created: [{timeStr}]")

    noteLns += [f"#+roam_key: cite:{bibkey}",
                roam_tags_str[bibkey]]

    return noteLns


# Write a separate org-roam note file for each .bib entry
for bibitem in bib_database.entries:
    noteLns = bibitem_to_OR_note(bibitem)

    noteOutFNm = noteOutDir / f"{bibitem['ID']}.org"
    with open(noteOutFNm, 'w', encoding="utf8") as fh:
        for ln in noteLns:
            fh.write('%s\n' % ln)

print("\nDone.")

# %% [markdown]
# ### Prototype code below.  Don't run.

# %% [markdown]
# #### pybtex parser string examples

# %%
# from pybtex.database.input import bibtex
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
# #### BibTeX::Parser
# I wasn't able to get this to not collapse whitespace, so below is the hack to get around that.  But it turned out that bibtexparser could do the job w/o the hack.

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
