---
created date: 2024-12-07T12:36:53-08:00
modified date: 2025-02-07T13:24:15-08:00
---

I'd like to use [[NotebookLM]](NLM) to do [[Martineau23whatIsRAG.html|RAG]] on info captured in [[Zotero 6 to 7|Zotero]] and noted in Obsidian. I especially like that NLM can point to exact chunk of pdf text that supports a conclusion it has made. Besides pdfs, it also supports htmls, and YouTube links. But there are difficulties.

I'm putting this code in `ref/refwrangle`.  Also see [[Zotero 6 to 7]].
# Zotero to NotebookLM
## Problems to solve before using NotebookLM

### YouTube: can't point to a specific point in a video
It can cite an entire YT video as a source, but it can't highlight a specific passage in the transcript: it just highlights the whole thing.
### Manual entry
Every single source must be entered manually. I have hundreds of articles, so this is not tenable.
### Total data limit
There's a limit on the total bytes of data uploaded, as well as a size limit for each file.
### Some web sites files can't be imported
For example, [WA shifted (slightly) right in...](https://www.seattletimes.com/seattle-news/data/wa-shifted-slightly-right-in-2024-though-many-counties-moved-left/) can't be imported. It seems that NLM can read the website but, due to "source restrictions" it can't point you to the line where some point is made. This does work for some web pages, for example [Election 2024: How and why you...](https://apnews.com/article/young-black-latino-men-trump-economy-jobs-9184ca85b1651f06fd555ab2df7982b5).
## Tasks

### Avoid manual entry by lumping all sources into giant files
- [ ] # consider pdf merging using PyMuPDF ([see perplexity](https://www.perplexity.ai/search/can-pymupdf4llm-preserve-meta-5ToaZGOvRVedgdXwjDlOig#2)). Help with metadata, somehow with PyMuPDF4LLM?
- [ ] # Consider using google docs: [[lit/lit_notes/NotebookLM.md#Data Required, Best practices |Data Required, Best practices]]. Help with metadata?
- [x] can NLM distinguish sources in lumped together pdfs? Must do by hand
- [x] test if multiple web sites can be distinguished of lumped together: doesn't seem possible, must do by hand
- [x] same for YT videos: by hand
### Convert web pages to pdfs
- NLM is good at simplifying and cleaning web pages when given URLs; 
- [ ] ? is it equally good at cleaning pdfs made from web pages?
- if so, it doesn't seem necessary to clean them, unless the extra content runs over the data limit
- Possible levels of cleaning
	- fairly literal copy of html in pdf
		- **playwright**: maintained code, near-literal pdf copy of html
			- a [recommended](<lit/refwrangle/Zotero to Obsidian to RAG.md#^8cyi >)  alternative to pyppeteer
			- won't run in Jupyterlab on Windows
				- [must hack source to get working in Jupyter on Windows](https://stackoverflow.com/questions/71228742/how-to-use-the-playwright-library-in-a-jupyter-notebook-instead-of-using-a-regul) (works as is on Mac)
				- or maybe [hack Jupyterlab source](https://stackoverflow.com/a/75223003/2591097)?
					- [this Jupyter example (Aug 27, 2024)](https://scrapfly.io/blog/playwright-in-ipython/) gets the "Not Implemented" error discussed above
				- so must run a .py 
					- ? would that vscode .py as notebook thing work here?
			- [x] Can I run it in vscode? **Yes**
			- [x] Can I run it in vscode interactive window: **No** *Not without more work*
				- error I see: 
					`Error: It looks like you are using Playwright Sync API inside the asyncio loop.`
					`Please use the Async API instead.`
				- I fumbled around with it, trying to use the async API but I don't know what I'm doing, and since there is a lot on the net about Jupyterlab problems, maybe this just isn't possible.
			- by default, quite a bit of web page junk in the pdf
				- does it matter?  
					- See what makes it to an .md file made from the pdf by RAG file maker [[lit/refwrangle/Zotero to Obsidian to RAG.md#^xslw|pymupdf4llm]]
					- still see junk, so is junk OK?
			- but works on Yan24berkeleyFuncCallLeaderBrd, where some other libs have problems
		- **pyppeteer**: by itself, does well at converting to pdf, removing some messy footers, headers and active sidebars on e.g. WA post articles.  
			- But it leaves in comments, pictures and the annoying "look here" things interlaced with the main article text. 
			- Also has an overlap problem with the html in Yan24berkeleyFuncCallLeaderBrd. I thought this library could be a preprocessing cleaner for `pymupdf4llm` but this overlap problem is a deal killer, as there are probably many more like it.
			- # is [unmaintained](<lit/refwrangle/Zotero to Obsidian to RAG.md#^8cyi >)
	- leaves a little structure
		- **weasyprint + beautifulsoup**: BS extracts html structure, making varying levels of cleaning possible; weasyprint makes the pdf from some html.
			- a **pain**: weasyprint constantly has library problems (GTK+ and fonts config to avoid error messages) on Windows 11, without me apparently changing anything.
	- barebones text: 
		- **trafilatura** lib strips everything but bare text from a web page. It seems quite robust, although with defaults (I forgot which), sometimes, there is a lot of junk.  Unfortunately, not great at getting all content on modestly complex web pages, in comparison to obsidian web clipper
			- [With Python &#8212; Trafilatura 2.0.0 documentation](https://trafilatura.readthedocs.io/en/latest/usage-python.html)
			- [can output hierarchy-saving markdown](https://www.perplexity.ai/search/i-am-using-the-function-below-5S58SxSxTUaIiBl.WeyN1A#3) 
			- with metadata
			- interesting precision/recall tradeoff variables, with a heuristic choice in baseline method, which I think only gets text, though, and loses hierarchy
			- can output tables
			- is up to date in 2024
			- # but not great at getting all content, even with prefer_recall=True
				- entirely fails (success=False) on Tumulty24FrischLearnedDemsShould (WA Post)
				- missies a lot on Yan24berkeleyFuncCallLeaderBrd
				- see trafilatura_to_md_test.ipynb
		- **wkhtmltopdf** was [said by perplexity](https://www.perplexity.ai/search/i-need-to-clean-html-files-for-ThQ.d9oYQ9afNgwAm8nzOw#0) to be one of two standalone executables that were robust.  It doesn't clean, but does a good job with html->pdf, although where BS and trafilatura crash, it produces a blank page, which actually was more robust, as that html file on this page was corrupted.  A binary must be installed, but it requires less config that beautiful soup or `weaspyprint`.
			- however, it <u>failed again and again to make clickable margin links</u> in the header
			- seems to be years-known bug
			- project is poorly maintained and almost undocumented!
			- ? but can at least get a header with a non-clickable html basename. Good enough, since NLM might strip it anyway?
	- [ ] ? use the successful **beautiful soup** part to `weasyprint` tests to clean the html, then `wkhtmltopdf` to make the pdf?
### PDFs to markdown
- **Don't need to do** this as long as I'm using NLM
- But for the record, `pymupdf4llm` seems to work ^xslw
	- [The PDF Extraction Revolution: Why PymuPDF4llm is Your New Best Friend (and LlamaParse is Crying)](https://ai.gopubby.com/the-pdf-extraction-revolution-why-pymupdf4llm-is-your-new-best-friend-and-llamaparse-is-crying-e57882dee7f8)
	- does a good job with pdf output by `wkhtmltopdf`
- for NLM would need to convert the .md back to .pdf again
### Easier Obsidian Lit Notes from Zotero Entries

- [[2024-02-25#Bulk Obsidian Literature Note Creation From Zotero|Bulk Obsidian Literature Note Creation From Zotero]]
- A [script](https://forum.obsidian.md/t/automatically-import-new-papers-from-zotero-to-obsidian/79057/2?u=scotto) which uses BetterBibtex Zotero Plugin and [[2024-02-25#Zotero Integration Plugin|Zotero Integration Plugin]].  
	- Supposedly can be made to every time your synced bibtex file is updated or something like that
	- [ ] ? But but would this make endless additions onto existing zotero notes?
- Make it frictionless to make a quick note in zotero turn it into an obsidian obsidian note.  
	- Is this satisfied by above?
	- [[Obsidian/Zotero 6 to 7.md#MarkDB-Connect Zotero Plugin|MarkDB-Connect Zotero Plugin]] will show the new notes automatically in zotero
## Can either download and strip from a URL, or can strip an already downloaded html file
- convert youtube transcripts to pdfs

# Zotero entries to Obsidian Literature Notes

# Zotero <--> Obsidian Links

Zotero _Better Notes Add-on has a way of two-way syncing Obsidian Markdown_ notes.  It worked but then it broke (Oct. 2023).  Would be nice to get 2-way syncing working, but in the meantime, here are simpler ways.

- [[Dailies/2024-02-25.md#Zotero Integration Plugin |Zotero Integration Plugin]]
	- I'm using it
	- Is very good at converting zotero entry data into data structures usable by obsidian
	- plugin templates handle much formatting of obsidian stuff, but nunjucks is a PITA
	- But it's clunky because getting a lit note into obsidian is a >1 step process
	-  [[Zotero 6 to 7#MarkDB-Connect Zotero Plugin|MarkDB-Connect]] helps find which entries you've hooked up
	- 

**Related and similar**:  [[2023-10-08#OneNote <--> Obsidian Links|OneNote <--> Obsidian Links]]
### Plugins: Zotero <--> Obsidian Links
#### Zotero Plugins

##### MarkDB-Connect Plugin
- see [[Zotero 6 to 7#MarkDB-Connect Zotero Plugin|MarkDB-Connect]]
##### Better Notes Plugin
- [zotero-better-notes](https://github.com/windingwind/zotero-better-notes)
- 2-way markdown sync?  Fragile?  Lots of other stuff I'm not sure I care about
#### Obsidian Plugins
* **Roll your own**: [Linking from Obsidian to Zotero](https://forum.obsidian.md/t/linking-from-obsidian-to-zotero/29128)
* [[2024-02-25#Zotero Integration Plugin|Zotero Integration Plugin]]: seemed best to me in 2023
* [obsidian-citation-plugin](https://github.com/hans/obsidian-citation-plugin): was this was broken in 2023
* [[2024-03-06#Zotero Link|Zotero Link]] is the easiest
### Manual (not using e.g. Zotero Integration Plugin)

#### Links to Obsidian inside of a Zotero Note

1. Put cursor on Obsidian page or block you want to jump to (e.g. from inside Zotero)
	- If Page
		- right click on page
		- select: "Copy Advanced URI" OR "Copy Obsidian URL" (either works)
	- Else if Block
		- In command pallet: type "URI"
		- Select the command that _Advanced URI: copy URI for current block_
		- <u>This only works if page is in a writeable mode</u>
2. Paste into a Zotero note, by highlight some text in the zotero note and either:
	1. _Ctrl+K_ (finicky)
	2. clicking zotero's link icon

#### Links to Zotero inside of Obsidian

1. Put cursor on Zotero item/note/...you want to jump to (e.g. from inside Obsidian)
2. Right click and select "copy select item links"
3. Paste into a Zotero note e.g. by highlighting some link text and typing _Ctrl+K_

**MORE**: [[Manual Links to Zotero]]

# Direct zotero/obsidan DB-to-DB connection?

Could use the to reduce the steps and friction between getting a note into zotero and the **immediately making an Obsidian literature note properly linked to Zotero**, so that I actually get this done, instead of letting the unlinked zotero entries pile up, or even skipping making the zotero note at all.

I think what I need is a way to add a button to Zotero that makes an obsidian note(s) on the current or selected group of notes.

## SQL SQL Zotero/Obsidian connection
- [[Dailies/2025-02-06.md#SQLSeal plugin |SQLSeal plugin]]  
	- Obsidian --> SQL --> Obsidian (automatically, I think)
	- [ ] ? but can it make a page?
	- **No SQL DB inside obsidian**, as notes are the only DB, it is [said](https://www.reddit.com/r/ObsidianMD/comments/ze8b7d/database_long_term/).  
- [pyzotero](https://github.com/urschrei/pyzotero) connects directly to zoter SQLite DB ^xy71
	- not direct to SQL but using Zotero's official API
		- does that insulate the user from internal Zotero SQLite changes?
	- could output a csv or json? for SQLSeal, somehow
- [methods for querying Zotero SQLite](https://www.perplexity.ai/search/what-are-all-the-ways-of-direc-W7LoFkYaTsCx57vd4EGVuA)
- [python methods for directly querying Zotero SQLite + Tips](https://www.perplexity.ai/search/what-are-all-the-ways-of-direc-PK5MaMzPQiSG2PCPrwX2rw)
	- [sqlite3](https://docs.python.org/3/library/sqlite3.html): a built-in libary
	- Tips link above has several examples
	- [zoteroutils](https://github.com/piyueh/zoteroutils): no commits in five years (from Feb, 2025)
	- [pyzottk](https://github.com/sbrisard/pyzottk/commits/master/):  no commits in six years (from Feb, 2025)
# Programming interfaces to Obsidian and Zotero
- [Obsidian plugs are written in Typescript, ](https://forum.obsidian.md/t/which-programming-language-to-create-plugins-for-obsidian/11261/4)
	- [TypeScript: JavaScript With Syntax For Types.](https://www.typescriptlang.org/)
	- [Should You Learn TypeScript? A Coder&#039;s Guide for 2025](https://careerfoundry.com/en/blog/web-development/learn-typescript/)
- [Zotero Plugins are written in Javascript](https://www.zotero.org/support/dev/client_coding/plugin_development)
	- and they advise that using an external tool might be easier than learning how to make a plugin
- Python interfaces
	- [pyzotero](<lit/refwrangle/Zotero to Obsidian to RAG.md#^xy71 >) seems best for zotero
		- or maybe one of the direct SQL python libs?
	- [ways to interface with python to obsidian (perplexity)](https://www.perplexity.ai/search/what-are-all-the-ways-python-c-FHKyuIXRQfS75w9b0e35kA)
- [Remotely running an obsidian command  (perplexity)](https://www.perplexity.ai/search/is-there-an-obsidian-api-that-K9k8PCB6QuaOZxdbziW8qw)
	- could use this to run the [[2024-02-25#Zotero Integration Plugin|Zotero Integration Plugin]]
		- would still have that annoying zotero popup though
			- unless you could make it start the "classic" interface first
		- @ OR unless you used an API, which accepts keys ([can do with zotero integration and zotero bridge plugins](https://www.perplexity.ai/search/is-there-an-api-that-would-all-.O2.uzPHS.KixPqwqKvkrw) 
- [[Dailies/2025-02-07.md#Obsidian Zotero Sync Client Plugin |Obsidian Zotero Sync Client Plugin]]
	- directly accesses the zotero DB, and you can add javascript make an obsidian literature note title and contents
	- from here, I think you can write a snippet of Javascript to call the [[2024-02-25#Zotero Integration Plugin|Zotero Integration Plugin]] via its API to actually make the notes
	- it can also get collections, and this keys, I think
	- But how give Zotero sync the collection zotero keys?  Can it accept a list via the Obsidian API?
		- Just always get the keys from a fixed collection e.g. "export to obsidian"
			- that would be a drag-to-collection in obsidian and a button click in obsidian.
			- any better than just using the "classic" [[2024-02-25#Zotero Integration Plugin|Zotero Integration Plugin]] interface?
	- [can't currently do the zotero local API](https://github.com/frthjf/obsidian-zotero-sync-client/issues/15)
		- the [resulting BBT bug](https://github.com/retorquere/zotero-sync/issues/19) (which ZS uses)
- [[Dailies/2025-02-07.md#Zotero Bridge Plugin |Zotero Bridge Plugin]]
	- Provides an API access Obsidian and Obsidian Templater
	- Better than the [[Dailies/2025-02-07.md#Obsidian Zotero Sync Client Plugin |Obsidian Zotero Sync Client Plugin]] ?
	- 

# Zotero DB Facts

- It's [directly accessible SQLite](https://www.zotero.org/support/dev/client_coding/direct_sqlite_database_access)
- [kb:item\_types\_and\_fields \[...](https://www.zotero.org/support/kb/item_types_and_fields)
# Web Scraping
- see [[Politics/Political Causality/US Elections 2024.md#Political Data Sources |Political Data Sources]]