# -*- coding: utf-8 -*-
# %% [markdown]
# There were many papers in ref/papers that had no entry in energy.bib.  Most
# likely, the reason was that JabRef problems wiped out their bib entries.
# To fix this, I've already dragged those pdfs into Zotero; it found most
# most corresoonding bib entry data; and I've exported that to a tempoarary
# bib file.
#
# This script makes a new bibkey for each entry, which is the same as the
# associated pdf file basename, and saves it to a new temporary .bib file, 
# which I'll manually merge into energy.bib.
# 
# The list of unlinked local files came from:
#   JabRef-->Lookup-->"search for unlinked local files"

# %%
from pathlib import Path
from bibtexparser.bparser import BibTexParser
from bibtexparser.bwriter import BibTexWriter
import re

# %%

bibDir = Path("C:/Users/scott/tmp")
bibInFNm = bibDir / "tmp_orphan_papers.bib"
bibOutFNm = bibDir / "tmp_bibkeyfixed_orphan_papers.bib"
orgOutFNm = bibDir / "tmp_orphan_papers.org"


# %%
# Read source .bib as string so can handle parsing in a separate step, avoiding
# error throwing on unquoted .bib fields to right of '='.
# (If bibtexparser were to write them out, they would be restored as in the
# original bib file).

with open(bibInFNm, encoding="utf8") as bibtex_file:
    bibtex_str = bibtex_file.read()

bp = BibTexParser(interpolate_strings=False)
bib_database = bp.parse(bibtex_str)

# %%
# Make new bibkeys for each item, and make pdf file non-rooted.
# Also make an org-file with cite:link headlines referencing these entries.

regenDate = "1/1/21"  # date that these new bibtex entries were regenerated

org_outlns = ["* Regenerated bib entries"]
org_outlns += [f"\nThese papers were missing from energy.bin on {regenDate}"]
org_outlns += [f" and were regenerated.\nMaybe they are still referenced in energytop.org\n"]
for bibitem in bib_database.entries:
    # bibkey = bibitem['ID']
    # bibkeysAll.add(bibkey)
    
    print(f"{bibitem['ID']}")
    
    pdfFNmOrig = Path(bibitem['file'])
    pdfFNmNew = pdfFNmOrig.name # basename
    bibKeyNew = pdfFNmOrig.stem #  basename, no ext
    fNmExt = pdfFNmOrig.suffix.strip(".")
    print(f"\t{pdfFNmNew}, {bibKeyNew}, {fNmExt}")
    
    bibitem['ID'] = bibKeyNew
    bibitem['file'] = f":{pdfFNmNew}:{fNmExt.upper()}"
    bibitem['comment'] = f"Comments may have been lost.  This entry was missing from energy.bib but pdf (or whatever) was still there on {regenDate}.  Bib entry was regenerated.  Maybe entry is still in git?"
    
    if 'author' in bibitem:
        auth1lastNm = bibitem['author'].split(' and')[0].split(', ')[0]
    else:
        auth1lastNm = bibKeyNew
    
    words = re.findall(r'\w+', bibitem['title']) # removes punct, latex, etc.
    clean_title = " ".join(words)
    
    if 'year' in bibitem:
        safe_year = bibitem['year']
    else:
        safe_year = '?'
        
    org_outlns += [f"*** [[cite:{bibKeyNew}][{auth1lastNm} {safe_year}: {clean_title}]]"]
  
    
writer = BibTexWriter()
with open(bibOutFNm, 'w', encoding="utf8") as bibfile:
    bibfile.write(writer.write(bib_database))
    
with open(orgOutFNm, 'w', encoding="utf8") as fp:
    fp.write("\n".join(org_outlns))

print("\nDone.")
