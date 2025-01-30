# %% [markdown]
# ### Convert energytop.org standard bib links to cite: links
# This works fine, but it slows down ivy search and file opening b/c there were
# so many plain bib links that are replaced with slower cite: links.
# So, do this when break up energytop.org.  In individual .org files, this won't matter, 
# Except for when the org-roam DB is updated.

# %%
from pathlib import Path
import re

# %%
orgDirBase = Path("C:/Users/scott/OneDrive - Clean Power Research/ref")

orgInNm = "energytop"
orgInFNm = orgDirBase / f"{orgInNm}.org"
orgOutDir = orgDirBase
orgOutFNm = orgOutDir / f"tmp_{orgInNm}_citelinks.org"

# %%
with open(orgInFNm, encoding="utf8") as fp:
    orgtxt = fp.read()

# %%
orgtxt = re.sub(r"\[\[file:.*?.bib::(.*?)\]\[(.*?)\]\]",
                r"[[cite:\1][\2]]",
                orgtxt)

# %%
print(f"Writing to {orgOutFNm} ...")
# keep UTF8 b/c of the German and whatever, force unix newlines to avoid emacs ^M @ line ends
with open(orgOutFNm, 'w', encoding="utf8", newline='\n') as fp:
    fp.write(orgtxt)
