# %% [markdown]
# ### Convert energytop.org standard bib links to cite: links

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
with open(orgOutFNm, 'w', encoding="utf8") as fp:
    fp.write(orgtxt)
