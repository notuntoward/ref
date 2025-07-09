---
created date: 2024-08-20T17:36:57-07:00
modified date: 2025-03-26T10:49:13-07:00
---
Stuff about updating zotero 6zo to zotero 7.  Also see [[Zotero to Obsidian to RAG]].
# New Zotero 7 Features

- [Zotero 7: Zotero, redesigned](https://www.zotero.org/blog/zotero-7/ "Permanent Link: Zotero 7: Zotero, redesigned")
- [Raftis: Unveiling Zotero 7: Major Update](https://ricraftis.au/zotero/unveiling-zotero-7-major-updates-and-enhancements/)
	- his [email](https://mail.google.com/mail/u/0/#search/raftis/FMfcgzQVzFTShwblJkTMVHNDxPgDmnvh)
# Immediate TODOs needed to get zotero+obsidian working again
- [x] Make Zotero attachment titles equal filename ^ue8c
	- easier to read 
	- makes fixing template easier
	- I *think* this is supposed to work if you set a hidden preference
		- [tim820's tip on Zotero forum. Works for him.](https://mail.google.com/mail/u/0/?pli=1#inbox/FMfcgzQXJssBPrgxshNMthvRRwnHJDGd)
		- but it doesn't work for me or others on 11/20/24: [How to automatically rename at...](https://forums.zotero.org/discussion/116925/how-to-automatically-rename-attached-html-files)
		- [Changing a hidden preference (Perplexity)](https://www.perplexity.ai/search/in-zotero-7-how-do-i-change-hi-Trnxr0MVS.y5CLwDYCFyoA)
	- [x] Obsidian bug
		- this went away. 
			- Part of it was that [[2024-08-06#Consistent Attachments and Links Plugin]] was set to delete files when their sole parent was deleted.  I unset it
			- I was probably making test obs notes that pointed to attachments, which were deleted when I deleted the test note
			- Might have been some additional thing which I never IDed but whatever, the problem is now gone.
		- I make a literature note with a link to .html file that was added by zotero
			- [x] I click on the like and it opens.  Then one of these things happen, not sure which. Which?
				- I'm not sure any of these happened...
					- this deletes the htnl  immediately?
					- this deletes html when I close the note?
					- this delets the html when I delete the note
- [ ] [[#ZotMoov Zotero Plugin]]
	- [ ] Test the setting that deletes attachments when delete parent. Could be useful, but dangerous.
	- [x] Does [[Obsidian/Zotero 6 to 7.md#ZotMoov Zotero Plugin|ZotMoov]] use the right template for html titles? 
		- **No. It only changes the filenames, not the titles**
		- But, the [File Utility plugin](<Obsidian/Zotero 6 to 7.md#^r1z9 >) does it, an dworks
	- also see [[#File renaming in Zotero 7]]
- [x] File Utility plugin: keeps attachment title and file name in sync ^r1z9
- [x] Zotero Integration Literature Note fixed
	- Find a base template that works
	- slowly restore my template changes
- [x] Make Zotero html snapshots accessible/highlightable outside of Zotero, still visible in Zotero
	- SingleFile does the job
	- Zotero html snapshot status when I started with this idea
		- when I highlight with SingleFile, I do see its highlights in zotero
		- but I can't link to them inside of either Zotero (like you can when you annotate html inside of zotero) or obsidian
		- can't save zotero highlights to file at all, much less in a for that SingleFile can see them.
	- [x] **Goal**: annotate Zotero html snapshots with SingleFile: 
	      This works after solving the stuff below
		- [x] Problem: can't open zotero snapshots directly in SingleFile annotation editor
			- smoothest zotero/obsidian-literature-note interface would be to use zotero's html snapshots directly
			- *This does work*
				- make zotero to open a browser so SingleFile can be called
					- In zotero general prefs, I configured "default application" for opening snapshots
					- This is a workaround since extension for Zoter `Open External File` only works on pdfs
						- [ ] My feature request: [Also open html · Issue #16 · r...](https://github.com/retorquere/zotero-open-pdf/issues/16)
				- Then clicking on the brings up a browser with SingleFile running, assuming it's installed.
					- I was wrong that SingleFile wouldn't open snapshots: [Annotate any html file with Si...](https://github.com/gildas-lormeau/SingleFile/issues/1622)
		- [x] Problem: Saving from SingleFile is a pain: 
			- only goes to Downloads, constantly messing with paths
			- [x] *solution*: symlink to obsidian's lit_sources dir, where both zotero and obsidian lit notes look.
			  
			  In Admin DOS CMD command: 
			      cd ~/Downloads
			      mklink /D lit_sources "C:\Users\scott\OneDrive\share\ref\obsidian\Obsidian Share Vault\lit\lit_sources"
		- [x] *Problem*: SingleFile annotation editor doesn't show up after opening the file in a browser (from either zotero or obsidian), so can't reannotate
			- this was even if I'd already annotated the html with SingleFile
			- [x] My SingleFile bug report: [Annotation editor doesn't appe...](https://github.com/gildas-lormeau/SingleFile/issues/1621)
				- **[solution](https://github.com/gildas-lormeau/SingleFile/issues/1621)**: You have to enable the option `Allow access to file URLs` in the extension page,
				- See this setting in: `brave://extensions?id=mpiodijhokgodhhofbcjdecpffjipkle`
- [ ] # Make it possible to link SingleFile html highlights to Obsidian notes
	- [ ] How to programmatically detect SingleFile highlights in the html file
	- [ ] ask pdf++ author to use this to make clickable links that go the location of the highlight, as with pdfs.
		- If I remember, if I convert a SingleFile-highlighted .html to .pdf, then pdf++ can link to those previously html highlights.
# Bugs (Zotero 7)
- [ ] [negative tag search doesn't work - Zotero Forums](https://forums.zotero.org/discussion/117229/negative-tag-search-doesnt-work?new=1)
- [x] zotero integration plugin takes uses pdf name visible in zotero instead of true file name, which doesn't exist.
	- Fixed in a few ways: 
		- Zotero [File Utility Plugin](<Obsidian/Zotero 6 to 7.md#^r1z9 >) keeps titles matching file names
		- [[2024-03-09#Zotero Integration Plugin]]: I changed literature_nmote.md template to look at .path instead of .title, and made .path the file basename, which allows obsidian to find the attachment by itself, in its usual way
		- My [[Zotero to Obsidian to RAG#Less tedious Zotero --> Obsidian Lit Note process]] jinja2 (not nunjucks) / javascript / python contraption doesn't use either .path or .title
	- Options
		- make zotero visible and actual attachment filenames always the same (I saw official zotero docs showing how to do that)
		- in the [[2024-02-25#Zotero Integration Plugin]] template file, figure out how to get the true filename.  
			- template file: [[literature_note]]
- [x] does my [[literature_note]] template now overwrite notes? Or is this just a consequence of the "modified date" bug in the timestamp plugin thing?
	- it was a modified date thing, I think, which also clobbered literature_note.md itself, until I set it to stay away from my obsidian templates dir.
# Zotero Lookup Engines
Locate icon on the RHS margin looks up metainfo for the current entry. Can add new "lookup engines" to search more places. I tried to customize it by adding crossref and SPL, but didn't work after five minutes. I sent back to the default, which is google scholar.

- must manually edit c:/Users/scott/Zotero/locate/engines.json
- I copied [this one](https://egh.github.io/zotero-lookup-engines/us.wa.seattle_public.html) (started with "seattle"): had spl, google scholar, crossref
	- there are a bunch more [here](https://egh.github.io/zotero-lookup-engines/)
# Zotero 7 Plugins
## Pushing zotero items to Obsidian notes
- Also: [[Zotero to Obsidian to RAG#Less tedious Zotero --> Obsidian Lit Note process]]
- Also: [[Zotero to Obsidian to RAG#Push from Zotero to Obsidian]]
### Actions and Tags Zotero Plugin
From: [GitHub - windingwind/zotero-actions-tags: Customize your Zotero workflow.](https://github.com/windingwind/zotero-actions-tags)

 - Used here [[lit/refwrangle/Zotero to Obsidian to RAG.md#Push with Zotero "Actions and Tags" plugin|Push from Zotero with Zotero "Actions and Tags" plugin ]]
 - Examples of custom scripts (actions)
	 - [What is This?](https://github.com/windingwind/zotero-actions-tags/tree/master?tab=readme-ov-file#-what-is-this)
	 - Many user contributions: [Discussions · GitHub](https://github.com/windingwind/zotero-actions-tags/discussions)
	 - My documentation request: [Feature Document what func...](https://github.com/windingwind/zotero-actions-tags/issues/474)
### Plugins related to zotfile (zotero 7)
In Z6, I used `zotfile` to "manage attachments," which renamed attachments to the citation key, and moved them to a specified, single directory.  But it's not been updated for Z7, as of 8/20/24.
#### retorquere/zotero-file Zotero Plugin
  From: [GitHub - retorquere/zotero-fil...](https://github.com/retorquere/zotero-file?tab=readme-ov-file)

 It says:
>  Zotero 7 Meet ZotFile: Zotero plugin to manage your attachments: automatically rename, move, and attach PDFs (or other files) to Zotero items.

which makes it sound like a zotfile replacement, but
- all docs are in Chinese (Japanese?)
- last update was "last year" (on 8/24/24)
- no way to post an issue, in order to ask a question
**uninstalled**
#### attanger Zotero Plugin
From: https://github.com/MuiseDestiny/zotero-attanger

- last commit 2 months ago (on 8/24/24)
- all docs in Chinese 
**not installed**
#### ZotMoov Zotero Plugin
From: [GitHub - wileyyugioh/zotmoov: ...](https://github.com/wileyyugioh/zotmoov)

It says:
> A _simple_ plugin for managing attachments in Zotero 7
> 
> ZotMoov can:
> 
> - Automatically move/copy imported attachments into a custom directory
> - Manually move/copy imported attachments into a custom directory via right-clicking
> - Automatically delete linked attachments from your computer when you delete them in Zotero

- does not rename files, [ZotMoov recommends](https://github.com/wileyyugioh/zotmoov?tab=readme-ov-file#file-renaming) using [[Obsidian/Zotero 6 to 7.md#File renaming in Zotero 7 |File renaming in Zotero 7]]
- last update 5 days ago (on 8/24/24)
- has the .xpi files, etc.
- good docs
- setup
	- Directory to Move Files To: `C:\Users\scott\OneDrive\share\ref\obsidian\Obsidian Share Vault\lit\lit_sources`
	- Allowed File Extension: `txt, html`
	- Untick Automatically Delete External Linked Files in the ZotMoov Directory (I think I don't want this but I'm not sure)
- 
**Installed**
### Useful Plugins for Zotero 7 (in addition to zotfile replacements)
#### zoplicate Zotero Plugin
From [GitHub - ChenglongMa/zoplicate...](https://github.com/ChenglongMa/zoplicate)

Detects duplicate entries, lets you merge them

- my feature request:[Request: Show which date is wh...](https://github.com/ChenglongMa/zoplicate/issues/85)

**installed**
#### MarkDB-Connect Zotero Plugin
From [GitHub - daeh/zotero-markdb-co...](https://github.com/daeh/zotero-markdb-connect?tab=readme-ov-file)

Adds a custom zotero tag to zotero entries that have matching markdown notes. Then you can open the markdown note by right clicking on the zotero entry.

Match can be by betterbibtex `citekey` (in .md filename or in metadata), or by Zotero key. Originally written for Obsidian, but can also work for logseq, Zettlr, etc.

Match is synced at startup (slow the first time), can be refreshed with a tools menu item.

- Summary
  - Links your Markdown database to Zotero. 
  - Jump directly from Zotero Items to connected Markdown files. 
  - Automatically tags Zotero Items so you can easily see which papers you've made notes for.
  - [ ] My feature request:[Command to create the md note ...](https://github.com/daeh/zotero-markdb-connect/issues/144#issue-2751893032)
##### Setup is not bad: In its settings:
- **Location of Markdown Reading Notes**: `C:\Users\scott\OneDrive\share\ref\obsidian\Obsidian Share Vault\lit\lit_notes`
- **Custom File Filter** 
	- clicked
	- RegExp: `^(\S+).*\.md$`  (file name is BBTcitekey.md)
- **BetterBibTeX citekey - captured with custom RegExp** `clicked bot RegExp left blank`
- **Open Markdown Files using**: `obsidian` (clicked, nothing else filled in)
- **Specify a Custom Tag Name?** `obsLitNote` (default)
	- the name of the zotero tag inserted for matching notes
- **Remove tags from unmatched Zotero items?** `keep Zotero tags synced`
	- [ ] ? default. Do I want that?
	- [ ] ? should/can I use/sync zotero tags seamlessly with obsidian tags
	- [ ] ? what tags are being synced?
##### Questions & Bugs
- [ ] popup when I open obsidian note bug: [site permission requested ever...](https://github.com/daeh/zotero-markdb-connect/issues/136)
- [x] find out why I get a 59 citekeys not matched error popup at zotero boot.
- [x] can I make a shortcut 
	- not yet, author waiting for PR: [enable keyboard shortcut to op...](https://github.com/daeh/zotero-markdb-connect/issues/9)
	- people have [asked for Zutilo support](https://forums.zotero.org/discussion/94322/is-there-any-way-to-link-to-an-obsidian-note-from-zotero), but I don't see that this has happened, and also, Zutilo doesn't work for me on Zotero 7, as of 8/17/24 
	- **Solved**: I wrote a [[#Actions and Tags Zotero Plugin]] script to open it with a shortcut
- [ ] ? a way to make [[2024-02-25#Zotero Integration Plugin|Zotero Integration Plugin]] rerun sync whenever new imports made?
###### Markdown DB connect References:
- Github instructions for [matching BetterBibTeX citekeys](https://github.com/daeh/zotero-markdb-connect?tab=readme-ov-file#option-1-using-betterbibtex-citekeys)
- obsolete (but still referenced in GitHub) tutorial: [Link from a Zotero it...](https://publish.obsidian.md/history-notes/Option+-+Link+from+a+Zotero+item+back+to+related+notes+in+Obsidian)
**installed**
#### Better BibTex Zotero Plugin
From: https://github.com/retorquere/zotero-better-bibtex

- settings
	- citation key formula: `auth.capitalize+shortyear+shorttitle(3,3)`
	- [ ] ! Automatic Export Output file: `"C:\Users\scott\OneDrive\share\ref\Zotero_Synced.bib"`  MISSING ON SURFACE TABLET, even if import settings exported from Surface Laptop Studio, which did have this setting:**BUG REPORT**
		- On Surface Pro (v 6.7.222)
		  ![[Zotero 6 to 7-20240820182240537.webp]]
		- On Surface Laptop Studio (v 6.7.222)
		  ![[Zotero 6 to 7-20240820182428378.webp]]
 **installed**
#### Zotero-OCR Zotero Plugin
From: [GitHub - UB-Mannheim/zotero-oc...](https://github.com/UB-Mannheim/zotero-ocr)

Seems like it could write the OCR'ed text back onto a pdf, but I'm not sure if it's aligned with the pdf text or is on separate pages.  Or, if it can be the same file, instead of the annoying `Copy` thing that PdfXchange does when it does OCR.  Also, you have to install tesseract, or something like that, so I skipped this plugin for now.

**not installed**
#### Zotlit
This obsidian plugin now works for Zotero 7, I guess, but maybe I don't care.  See [[2024-02-25#ZotLit plugin|ZotLit plugin]].

**Not installed**

## File renaming in Zotero 7
From: [file\_renaming \[Zotero Docume...](https://www.zotero.org/support/file_renaming)

**This is now mostly fixed.**  See [[#Immediate TODOs needed to get zotero+obsidian working again]]

- [My urging to restore zotero 6 behavior](https://forums.zotero.org/discussion/comment/477039#Comment_477039) on the zotero forum
- **My Question**: [[2024-02-25#Zotero Integration Plugin|Zotero Integration Plugin]]: how do I get a [File basename from attachment.path](https://github.com/mgmeyers/obsidian-zotero-integration/issues/404)?
- My zotero request: [rename .html too - Zotero Forums](https://forums.zotero.org/discussion/119126/rename-html-too?new=1)
- My zotmoov request: [.html attachments not renamed ...](https://github.com/wileyyugioh/zotmoov/issues/61)

- make the visible attachment name match the true filename
	- see javascript in "Attachment Title Handling in Zotero 7"
- making the real filename == citekey
	- setup in "Customizing the Filename Format"
		- Settings -> General -> File Renaming
			- Click "rename linked files" (can also define which filetypes are renamed)
			- In "Customize Format"
				- Set the "Filename Format" to: `{{citationKey`}}`
				- documentation link shows name variables you can use in name
	- bulk rename: must ctrl-click each attachment individually, then run "rename item from parent metadata"
