"""Makes a zotero bibtex export more useable:
    1. renames attached .pdfs to the bibtex key
    2. moves them to a single directory
    3. writes out the corresponding .bib export file""" 

import os
from pathlib import Path
from shutil import copyfile
from pybtex.database.input import bibtex

bibDirBase = Path("C:/Users/scott/OneDrive - Clean Power Research/ref/papers_zotero")

bibInNm = "Solar Power Forecast Deep" # usually a zotero category name
bibOutNm="exportFromZotfile"
papersDir = "papers" # relative to output bibfile

bibInDir = bibDirBase / bibInNm
bibInFNm = bibInDir / f"{bibInNm}.bib"

bibOutDir = bibDirBase / bibOutNm
bibOutFNm = bibOutDir / f"{bibOutNm}.bib"
bibOutPapersDir = bibOutDir / papersDir

bib_data = bibtex.Parser().parse_file(bibInFNm)

for bibkey,bibdat in bib_data.entries.items():
    if 'file' in bibdat.fields: 
        fldParts = bibdat.fields['file'].split(":")
        print(f"{bibkey}: {len(fldParts)} sections:")
        for p in fldParts:
            if p[0:5] == 'files':
                _, fnExt =os.path.splitext(p)
                if fnExt == ".pdf":
                    fNmOld = bibInDir / os.path.normpath(p)
                    fNmNewBase = f"{bibkey}{fnExt}"
                    fNmNew = bibOutPapersDir / fNmNewBase
                    print(f"COPYING {fnExt}:\n\tFROM: {fNmOld}\n\tTO: {fNmNew}")
                    copyfile(fNmOld, fNmNew)
                    # PDF description field is just its filename
                    # WARNING: ONLY the LAST pdf is saved; all else is deleted
                    bibdat.fields['file'] = ":".join([fNmNewBase,fNmNewBase,
                                                      "PDF"])
                else:
                    print("Skipping copy of {p}")
    else:
        print(f"{bibkey}: No file field.")
        
print(f"\nWriting to {bibOutFNm}")
bib_data.to_file(bibOutFNm)

# Append JabRef-style comments, locating papers dir, type
metadata = [ "@Comment{jabref-meta: databaseType:bibtex;}",
            f"@Comment\{{jabref-meta: fileDirectory:{papersDir};}}" ]
open(bibOutFNm, 'a').write('\n'.join(metadata) + '\n')
