---
created date: 2025-07-29T17:36:42-07:00
modified date: 2025-07-29T20:18:51-07:00
---
How to get my Evernotes into Obsidian.

# Evernote Export Requirements
- for each evernote note
	- a `citekey` like name is created, in a format similar to the zotero bibtex citekeys I make by hand
	- The following files are generated
		- any attachments associated with that note
			- name them `citekey`.X, where X
		- `citekey`.html
	- an html file 
		- in which complex html pages are preserved as best as possible
		- has links to its attachments
	- an .md file 
		- with the best markdown rendering of that note possible
		- has all evernote meta info in the properties
		- a link to the corresponding .html file
		- links to any attachments in the evernote file
	- the html and m

- evernote tags become evernote tags
- filenames have 
- Exports 
# Obsidian Importer Plugin
From: [GitHub - obsidianmd/obsidian-i...](https://github.com/obsidianmd/obsidian-importer)

i.e. ENEX --> Obsidian importer ---> Obsidian Markdown

- My Feature Request (it does kinda handle internal evernote links): [Feature Request: Handle Everno...](https://github.com/obsidianmd/obsidian-importer/issues/279)
## Importer Plugin Test results 3/23/25

==This wasn't great.==

- Imported 1st 100 notes (max allowed) for each of "extinction", "exercise" tags
- **Good**
	- cross-note links work
	- "created date" property is imported
	- "modified date" property is date imported into Obsidian. OK, but not ideal
	- Good?  Evernote tags directly imported into obsidian's tag property
	- my highlights in Evernote web pages seem to have survived
	- link back to web page page is in source property
- **Meh**
	- Tables seem to survive, but not the colored cells
	- some web page pictures survive but not all
	- ? Some inter-evernote links go to note imported to evernote; some to Evernote's web page of the note (maybe client with some config).  How fix.
- **Bad**
	- web pages are markdown
	- pictures and most everything else graphic are gone.  I *really* don't like this
	- [ ] ? can only import 100 notes at a time.  How automate this?
	- No link back to original evernote page, yet some inter-evernote links do go to original web page (note really good if have an imported version of the same)
	- still has giant icon 
- **Also**
	- [[Evernote to Obsidian and Zotero]]
# Evernote html export to Obsidian
- Evernote allows you to import each note as an individual file, or as 1 big file
- **Good**
	- web pages look as good as in Evernote
	- highlight perfect
- **Meh**
	- my own notes are embedded in html, even if I'd run the magic wand on them
- **Bad**
	- all note meta information is gone: tags, URL, dates...
# Hybrid Importer / Exported Html Approach?
- markdown with some metadata from Importer plugin
- add link to original html article imported and stored in obsidian too
- replace inter-note links with links to new, imported obsidian note
- make sure there's source property back to the web page Evernote imported from
- [ ] ? but how keep track of 100 note export at a time limit?
- [ ] ? can more valuable note metainfo be found in the [[Yarle]] export?
- [ ] ? Policy for what web pages are in Obsidian vs. Zotero
	- could actually make a zotero entry for each page in evernote
		- that would be a big zotero, though
		- would the [[#Obsidian Importer Plugin]] markdown be like a "literaturenote" and go into `lit/lit_notes`?
		- would the original Evernote html go into `lit/lit_sources`?
	- [ ] # ask perplexity what people do about Zotero / Obsidian / Evernote imports
- [ ] Need consistent [[lit/refwrangle/Zotero to Obsidian to RAG.md#Obsidian, Zotero and Evernote Tag Management |Obsidian, Zotero and Evernote Tag Management]]
# Yarle
From: [GitHub - akosbalasko/yarle: Ya...](https://github.com/akosbalasko/yarle/tree/master)

- Docs say it it can convert internal links ([Yarle can Convert](https://github.com/akosbalasko/yarle/tree/master?tab=readme-ov-file#features))
- But I don't understand how to use the template to do this
- GitHub commentor to me: [just use Yarle](https://github.com/obsidianmd/obsidian-importer/issues/48#issuecomment-2654574795)
- Yarle author plans to [improve evernote icon importing](https://github.com/obsidianmd/obsidian-importer/issues/49#issuecomment-1924669625)
- [ ] ? Is the endpoint always markdown (which would be limiting)
# evernote2obsidian
From: [GitHub - AltoRetrato/evernote2...](https://github.com/AltoRetrato/evernote2obsidian)

A python script that's [said](https://github.com/AltoRetrato/evernote2obsidian) to be better than yarle
- [detailed comparison with other Evernote exporters](https://github.com/AltoRetrato/evernote2obsidian/blob/main/comparison.md)).  
- Must first run [evernote-backup](https://github.com/vzhd1701/evernote-backup/) to download the evernote data
- can export both  markdown and html
	- markdown: said to be better conversion than with yarle
	- html: "original HTML data. This should preserve essentially _all_ of your data"
- BUT, done separately, not a nice markdown-link-to-html like with yarle option
	- [ ] @ look into hacking the python to do this, could submit a PR, but first try it out.
- last update was 3 days ago (on 7/29/25)
## Install evernote-backup
- [ ] I've [requested](https://help.evernote.com/hc/en-us/requests/new?ticket_form_id=38709470427923) an Evernote API key for this
- I installed evernote-backup to as a standard windows command line tool with :
```bash
uv tool install evernote-backup
```

How to use: [evernote-backup usage](https://github.com/vzhd1701/evernote-backup/?tab=readme-ov-file#usage)
## Install evernote2obsidan

### Fork it and clone it to local dir

- By default, this will `git push` will go to my fork (origin). For more details see [this](https://www.perplexity.ai/search/write-the-commands-to-fork-thi-.j8_TA3_QFmDiQETiprvig#1).
- [ ] ? add this to [[uv package manager]] and [[Git Source Code Control]]

```bash
# Install GitHub CLI if not already installed (varies by OS)
# For macOS: brew install gh
# For Ubuntu/Debian: sudo apt install gh
# For Windows: See GitHub CLI installation guide

# Login to GitHub
gh auth login --web

# Fork and clone the repository in one command
gh repo fork https://github.com/AltoRetrato/evernote2obsidian --clone
```

```bash
# Navigate into the cloned repository
cd evernote2obsidian

# ACTUALLY, the fork above seems to have already set up the upstream remote
# 
# Add the original repository as upstream remote (important for keeping your fork updated)
# git remote add upstream https://github.com/AltoRetrato/evernote2obsidian.git

# Verify your remotes are set up correctly
# (looks good)
git remote -v
```
### Set up uv around it
```bash
# Initialize UV project (this will create pyproject.toml and other files)

# run this in the cloned repo root directory
uv init --no-readme --no-package

# Create and activate virtual environment
uv venv

# Install any existing dependencies from requirements files
# (Check if the repository has requirements.txt, pyproject.toml, or similar)
# If there's a requirements.txt file:
uv pip install -r requirements.txt

# If there's a pyproject.toml with dependencies:
uv sync

# Alternatively, if the project has a setup.py:
# I DIDN'T DO THIS, didn't want to use pip
uv pip install -e .
```

Check
```bash
# Check UV environment status
uv python list

# Verify you're in the correct directory and environment
pwd
uv run which python
```

Make a branch, in case I want to make a PR.  Could branch later, or not at all, since [GitHub PR's make their own branch](https://www.perplexity.ai/search/write-the-commands-to-fork-thi-.j8_TA3_QFmDiQETiprvig#4), but explicitly branching now is probably good practice. 
```bash
cd evernote2obsidian

# Make sure you're on the main branch with latest changes
git checkout main
git pull upstream main

# Create and switch to a new feature branch
git checkout -b fix-some-import-issues

# Start making changes...
```

 Can rename the branch later with:
```
# rename current branch
git branch -m new-branch-name

# or rename some other branch
git branch -m old-branch-name new-branch-name
```
How to do it later (DON'T WANT TO, THOUGH)
```bash
# If you've already made commits on main, you can create a branch from those commits
git checkout -b my-feature-branch

# Then reset main back to where it should be
git checkout main
git reset --hard upstream/main
```

## Do the export

See [this](https://www.perplexity.ai/search/when-people-use-yarle-to-expor-c98liLYXT_CRpUu34yVnCg#9)