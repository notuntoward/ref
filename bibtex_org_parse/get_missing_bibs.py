# Puts a copy of each paper that's not referenced in energy.bib into a tmp dir
# Zotero can import these pdfs to find their bibliographic info -- be sure to
# avoid copying pdfs into Zotero storage by Ctrl-Shift-draging them to a Zotero
# collection.  This collection can then be exported as a .bib to be merged 
# back into energy.bib

from pathlib import Path 
import shutil

outDir = Path("C:/Users/scott/tmp/tmp_orphan_papers")
if not outDir.exists():
    outDir.mkdir()

# list of pdfs w/o links to them in energy.bib came from:
# This of unlinked local files came from JabRef-->Lookup-->"search for unlinked local files"
with open(Path("C:/Users/scott/OneDrive - Clean Power Research/ref/tmp_unrefed_pdfs.txt")) as fp:
    for cnt, line in enumerate(fp):
        # print("Line {}: {}".format(cnt, line.strip()))
        inFNm = Path(line.strip())
        outFNm = outDir / inFNm.name
        
        print(f"{inFNm}\n\t{outFNm}")
        if inFNm.exists():
            shutil.copy(inFNm, outFNm)
        else:
            # happens for Koenker13DistributionalvsQuantile.pdf
            # which DOES exist.  WHY?
            print(f"\nDOESN'T EXIST: {inFNm}\n")
