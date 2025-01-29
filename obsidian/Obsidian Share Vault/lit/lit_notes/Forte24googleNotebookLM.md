---
category: literaturenote
tags: ml/genAI
citekey: Forte24googleNotebookLM
status: unread
dateread: 
ZoteroTags: ""
aliases:
  - How to Use NotebookLM (Google's New AI Tool)
  - How to Use NotebookLM (Google's
publisher: ""
citation key: Forte24googleNotebookLM
DOI: ""
created date: 2024-04-04T07:56:28-07:00
modified date: 2024-12-17T08:51:31-08:00
---

> [!info]- : [**Zotero**](zotero://select/library/items/NIBMJYP8)   | [**URL**](https://www.youtube.com/watch?v=iWPjBwXy_Io)
>
> 
> **Abstract**
> Google's NotebookLM is way more than notetaking, writing, or organizational tool. It's an AI collaborator, grounded in your data with your unique view of the world.   In this tutorial, I'll give you a tour of the main functionalities, demonstrate concrete use cases such as making sense of meeting notes or writing an article, and cover the current limitations.   Visit https://notebooklm.google.com to sign up for a free NotebookLM account using your Google login (You must be at least 18 years of age, based in the U.S., and Workspace users must have “Experimental apps enabled” by an administrator)  😎 Get 60 days of Readwise for free: https://readwise.io/basb/ 📖 Watch my full Readwise tutorial:    • How I remember everything I read with...     TECHNICAL NOTES [08:37]: NotebookLM isn’t actually “trained” on your data. The model is pre-trained, and the software just shuttles your inputs into its context window temporarily so it can answer factually based on that information. Once you end your session, the information you entered is wiped from the model's memory so your data is secure.  [13:30]: NotebookLM can answer specific questions, but holistic questions (such as "Give me an outline of the entire book, in order") are harder, because the model can’t take in the entire document at once; it can only see the most relevant passages for a given query.   CHAPTERS 00:00 - 01:20 Intro 01:21 - 09:04 Getting started 09:06 - 14:52 Use cases for understanding  14:53 - 21:12 Use cases for writing 21:13 - 23:12 Using Readwise with NotebookLM  23:13 - 24:23 Limitations 24:24 - 25:23 Conclusion 25:24 - 25:47 Blooper  ——————————-  Building a Second Brain is the proven method to organize your digital life and unlock your creative potential.   We're on a mission to help you increase your productivity, and ​​lead a more fulfilling life with more ease and less stress.   🤓  TEST YOUR PRODUCTIVITY POTENTIAL If you had a Second Brain, how much more organized, effective, calm, and creative could you be?  Take our quiz & find out: https://fortelabs.com/productivity-po...  🧠  HOW YOU CAN BUILD YOUR SECOND BRAIN Order the book: https://www.buildingasecondbrain.com/... Take the course: https://www.buildingasecondbrain.com/...  📬  JOIN THE FORTE LABS NEWSLETTER Level up your productivity and life with new essays, videos, event invites, and other resources every Tuesday. Join 125k subscribers exploring the frontier of modern work, experimenting with new ways of doing more with less, and discovering what it means to fulfill our human potential. Subscribe here: https://fortelabs.com/subscribe  🐥  FOLLOW US ON SOCIALS  Always get the latest updates and insights around Building a Second Brain. Twitter:   / fortelabs   LinkedIn:   / tiagoforte   Facebook:   / fortelabs   Instagram:   / fortelabsco
> 
> 
> **FirstDirector**:: Forte, Tiago  
~    
> **Title**:: "How to Use NotebookLM (Google's New AI Tool)"  
> **Date**:: 2024-02-15  
> **Citekey**:: Forte24googleNotebookLM  
> **ZoteroItemKey**:: NIBMJYP8  
> **itemType**:: videoRecording  
> **DOI**::   
> **URL**:: https://www.youtube.com/watch?v=iWPjBwXy_Io  
> **Journal**::   
> **Volume**::   
> **Issue**::   
> **Book**::   
> **Publisher**::   
> **Location**::    
> **Pages**::   
> **ISBN**::   
> **ZoteroTags**:: 
>**Related**:: 

> _How to Use NotebookLM (Google’s New AI Tool)_. Directed by Tiago Forte, 2024. _YouTube_, [https://www.youtube.com/watch?v=iWPjBwXy_Io](https://www.youtube.com/watch?v=iWPjBwXy_Io).
%% begin Obsidian Notes %%
___

A demo of an early version of Google's new chatGPT-like thing,  [[NotebookLM]].  Does "source grounded AI," meaning it gets info from only your own docs that you load up (confidentially).  Has 4M "word" context, "much larger than any other tool out there."  Demo'ed uses are meeting summarization w/ auto letter writing using response from the guy's own book; getting writing tips and regen based on a "how to write book"; multi-document source assimilation for idea generation...

Explains how get sign up (notebooklm.google.com), and ways to get your data into the system.  

For now, it's free!
## Setup, getting docs into LLM context
- [00:00:23](https://www.youtube.com/watch?v=iWPjBwXy_Io&t=24#t=23.78) NotebookLM: google's new product
- [00:01:24](https://www.youtube.com/watch?v=iWPjBwXy_Io&t=84#t=01:24.41) Where: notebooklm.google.com
- [00:02:30](https://www.youtube.com/watch?v=iWPjBwXy_Io&t=151#t=02:30.89) inputs: drive docs, pdfs text
- [00:02:46](https://www.youtube.com/watch?v=iWPjBwXy_Io&t=167#t=02:46.75) 20 docs, 200Kwords/each, 4M word context ("larger context window than any other AI tool out there")
	- [ ] # Verify this statement, maybe make a comparison.
	- [ ] ? Is [[Reid24GeminiMultimodalMlnsContext|this]] why context is so long?
## Chat w/ uploaded documents (source grounded AI)
- [00:05:02](https://www.youtube.com/watch?v=iWPjBwXy_Io&t=302#t=05:02.03) prompt something about these docs loaded up (his example is a summarization)
- [00:05:42](https://www.youtube.com/watch?v=iWPjBwXy_Io&t=342#t=05:42.37) can ask questions suggested by google
- [00:06:50](https://www.youtube.com/watch?v=iWPjBwXy_Io&t=411#t=06:50.59) can save responses by pinning them
- [00:07:24](https://www.youtube.com/watch?v=iWPjBwXy_Io&t=444#t=07:24.12) can type your own notes to some collection, and it will get incorporated too, if you click it
- [00:08:54](https://www.youtube.com/watch?v=iWPjBwXy_Io&t=534#t=08:54.02) This is ==source grounded AI==: its info comes from known documents (the ones you uploaded)
	- [x] # I should try this on a bunch of genAI pdfs
		- I did: [[Gen AI Talk Demo - GoogleNotebookLM#AEMO Price Curves and GoogleNotebookLM]]
	- [ ] ? How is LLM response limited to these docs?  Doesn't its  vocabulary and sequence probability come from an internet's worth of training data?
## Summarizing meeting notes
- [00:11:32](https://www.youtube.com/watch?v=iWPjBwXy_Io&t=692#t=11:32.39) example of transcribing meeting notes (long, timestamped, speaker-labeled, seems like it was auto-transcribed from audio recording. Not clear how he got it)
- [00:12:33](https://www.youtube.com/watch?v=iWPjBwXy_Io&t=754#t=12:33.98) meeting transcription has 12K words (much bigger than what can fit in chatGPT, for example)
- [00:12:23](https://www.youtube.com/watch?v=iWPjBwXy_Io&t=743#t=12:23.28) can load this up, doesn't seem to require that you delete the big bunch of pdfs he uploaded before
- [00:12:42](https://www.youtube.com/watch?v=iWPjBwXy_Io&t=762#t=12:42.09) he asks it to summarize main points of "conversation with Doug"
- [00:13:27](https://www.youtube.com/watch?v=iWPjBwXy_Io&t=808#t=13:27.72) he adds his total book, and AI extracts things Doug would like to see from it.  Asks it to create curriculum for a full day workshop.  Seems to work.
- [x] # try this for my own genAI talk
	- I did: [[Gen AI Talk Demo - GoogleNotebookLM]]
- [x] ? what can it save?  DO you need to copy out notes you write too?
	- I checked this in [[Gen AI Talk Demo - GoogleNotebookLM]]
	- you can pin responses but it then deletes all the others (a bug?)
	- can't save the prompts, as far as I can tell
	- whole conversation is lost except the pins, I think
## Writing creativity aid / Editor
- [ ] # I should do a search on creativity of LLMs + people.  I had one paper but I don't think I saved it
- [00:15:26](https://www.youtube.com/watch?v=iWPjBwXy_Io&t=926#t=15:26.43) use as editor: 
- [00:15:51](https://www.youtube.com/watch?v=iWPjBwXy_Io&t=952#t=15:51.79) source guide shows you summary, etc of a doc you've written
- [00:16:16](https://www.youtube.com/watch?v=iWPjBwXy_Io&t=977#t=16:16.58) you ask it to rewrite it, suggest how to improve
- [00:16:26](https://www.youtube.com/watch?v=iWPjBwXy_Io&t=987#t=16:26.55) can then add a source, on how to write
- [00:16:50](https://www.youtube.com/watch?v=iWPjBwXy_Io&t=1011#t=16:50.57) then ask to rewrite based on advice from that source (on how to rewwrite).  It give him specific tips to follow.  Not sure if it could also rewrite the whole thing
- @ earlier: structure messy notes you've made
- [00:17:48](https://www.youtube.com/watch?v=iWPjBwXy_Io&t=1069#t=17:48.55) asks it to suggest related ideas from a book he uploads and research ideas derived from it
- [00:18:19](https://www.youtube.com/watch?v=iWPjBwXy_Io&t=1100#t=18:19.81) suggestion reminds him of another book he's read.  He adds that to the source list
- [00:18:29](https://www.youtube.com/watch?v=iWPjBwXy_Io&t=1110#t=18:29.73) asks to find connections between the two sources
- [00:19:04](https://www.youtube.com/watch?v=iWPjBwXy_Io&t=1144#t=19:04.25) asks it to suggest ideas based on this synthesis
- [00:19:31](https://www.youtube.com/watch?v=iWPjBwXy_Io&t=1172#t=19:31.51) adds yet another book that this reminds him of and asks to suggest a title using an example from that book, and expand an outline on that
- [00:20:10](https://www.youtube.com/watch?v=iWPjBwXy_Io&t=1210#t=20:10.32) somehow, you can look at sources it found
- [x] $ how does it show the sources?
	- **answer** from [[Gen AI Talk Demo - GoogleNotebookLM|here]] is that you click on numbered buttons, and it highlights where it got the info in the source.
- [00:20:23](https://www.youtube.com/watch?v=iWPjBwXy_Io&t=1223#t=20:23.41) generates an exciting opening paragraph.  I think it's a bit standard.
## Getting data into google drive
- [00:21:18](https://www.youtube.com/watch?v=iWPjBwXy_Io&t=1278#t=21:18.30) pivots to saying only possible if have all your books in google drive. 
	- That's not quite correct: you can just upload pdfs and other forms from your computer 
- [00:21:49](https://www.youtube.com/watch?v=iWPjBwXy_Io&t=1310#t=21:49.54) He uses readwise, kindle: exports it to google docs.  Shows how to do it w/ exact steps.  He imports highlights, not whole text.  Takes 1 or 2 hours
## Limitations, etc.
- [00:23:43](https://www.youtube.com/watch?v=iWPjBwXy_Io&t=1423#t=23:43.45) only google docs or pdfs as source.  Need readwise as intermediary or something
- [00:24:12](https://www.youtube.com/watch?v=iWPjBwXy_Io&t=1452#t=24:12.45) can't do math, messy pdfs, only 20 docs.  Some of this will be fixed, according to google
- has some bugs, he said either here or at the beginning.
## Also
- [[Novis23ObsidianChatGPT|Obsidian plus ChatGPT Webinar]]: spanish lessons!
- [[2024-03-23#Obsidian Kindle Plugin]]: could use readwise, like this guy does.
___
%% end Obsidian Notes %%



%% Import Date: 2024-04-04T07:56:46.455-07:00 %%
