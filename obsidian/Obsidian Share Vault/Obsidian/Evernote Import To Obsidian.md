---
created date: 2024-12-17T08:51:31-08:00
modified date: 2025-07-19T14:01:06-07:00
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