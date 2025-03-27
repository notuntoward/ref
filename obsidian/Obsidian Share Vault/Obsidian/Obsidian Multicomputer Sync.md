---
modified date: 2025-03-26T23:04:30-07:00
created date: 2024-12-17T08:51:31-08:00
---

This is about syncing Obsidian across computers, and is related to backup with the [[2024-07-30#Git Plugin]], and [[Obsidian and GIT Repo]].  Here's a [good overview](https://blog.kirillov.cc/posts/obsidian-livesync/).  Note that obsidian itself [says](https://help.obsidian.md/data-storage):

>You can create a vault anywhere your operating system allows. Obsidian syncs with Obsidian Sync, Dropbox, iCloud, OneDrive, Git, and many other third-party services.

So maybe you don't need Obsidian sync afterall, unless phone, Linux or MacOS is important.  Therefore, now that I've finished [[Obsidian/Obsidian and GIT Repo.md#Separating Obsidian and refwrangle code checkins |Separating Obsidian and refwrangle code checkins]], maybe I don't need Obsidian sync.  That is, unless [[Obsidian/Obsidian Multicomputer Sync.md#Disruptive Obsidian popup: "has been modified externally, merging changes automatically" |Disruptive Obsidian popup: "has been modified externally, merging changes automatically"]] are still there, or if I re-experience [[Obsidian/Obsidian Multicomputer Sync.md#Synced Windows/MacOS hotkeys conflict and overwrite |Synced Windows/MacOS hotkeys conflict and overwrite]].
# Official Obsidian Sync
Low cost makes sense once I figure out [[Evernote Import To Obsidian]], easily justifying this small extra expense.  But what problems does this solve or cause?  (Evernote is $[10.83/mo](https://evernote.com/compare-plans))
## What's available in Obsidian sync
From: [Obsidian Sync](https://obsidian.md/sync)
- price
	- $4/mo (1 GB storage)
	- $8/mo (10 GB storage)
	- $20/mo ([100 GB](https://www.linkedin.com/posts/obsidianmd_were-excited-to-share-some-big-improvements-activity-7132806879063244800-k0fh/), but I don't see that on official Obsidian page)
- features
	- encryption
	- version history, can see difference between versions, has file recovery
	- cross-platform
	- works offline
- external programs writing to vault
	- synced vault is just another OS directory
	- seems that external progs can write to it
## Switching to Obsidian Sync
- official advice: [Switch to Obsidian Sync - Obsi...](https://help.obsidian.md/sync/switch)
## Compatibility and Obsidian Sync
All things that might get better or worse with official Obsidian Sync.
### Git Plugin Compatibility with Obsidian Sync
- [claim](<Obsidian/Obsidian Multicomputer Sync.md#^kmij >) that git will eventually cause conflicts
- for sure, I need to work out my problem with [[Obsidian and GIT Repo]]
### Zotero <--> Obsidian Note integration compatibility with Obsidian Sync
I've written code that does [[Zotero 6 to 7#Pushing zotero items to Obsidian notes]], stuff that does [[Zotero to Obsidian to RAG]], and [[Perplexity Parsing]], with the goal of [[lit/refwrangle/Zotero to Obsidian to RAG.md#Less tedious Zotero --> Obsidian Lit Note process |Less tedious Zotero --> Obsidian Lit Note process]].  All of these insert notes into Obsidian.  How do these work with official Obsidian Sync? 
- pushing notes means that Obsidian has to be surprised which *might* be risking [[#Disruptive Obsidian popup "has been modified externally, merging changes automatically"]] problems.
- Note that the [[2024-03-09#Zotero Integration Plugin]] can avoid syncing probs b/c it's a plugin that adds notes in a formal way.
- [ ] ? I need a way to store all my **pdfs and web pages** where both Obsidian and Zotero can find them.  How?
- [ ] ? Official way to add a note to Obsidian without causing problems, or are all my problems only because of OneDrive?
### Multi-OS and Settings compatibility with Obsidian Sync
- [ ] ? Does Obsidian Sync solve the [[#Synced Windows/MacOS hotkeys conflict and overwrite]] problems I had with OneDrive and whole-obsidian directory syncing?
- How handle different root directories on different computers?
# Disruptive Obsidian popup: "has been modified externally, merging changes automatically"
Example:

"Obsidian/Obsidian and GIT Repo.md" has
been modified externally, merging changes
automatically.

## Popup from Obsidian, probably from external mods
Is said to be caused by external programs modifying obsidian vault, and I think, that this message comes from obsidian.  Many point to iCloud specifically, others theorize that OneDrive or Google Drive could cause the problem.

- [Intermittent data loss for cur...](https://forum.obsidian.md/t/intermittent-data-loss-for-current-document/90170)
- [\[Bug\] “modified externally” ...](https://forum.obsidian.md/t/bug-modified-externally-message-constantly-appears-erasing-my-text/26090/4)

- [Allow to Disable Pop-up Notifi...](https://forum.obsidian.md/t/allow-to-disable-pop-up-notifications/90310/4)
	- Can brute force remove all popups with CSS snippet
	  
```
.notice-container {
  display: none !important;
}
```

  - [How to Disable Frequent Pop-up...](https://forum.obsidian.md/t/how-to-disable-frequent-pop-up-notifications-in-obsidian/89243)
  - A homegrown solution avoid all problems, even obscure ones with Git ^kmij
	  - [Obsidian with LiveSync: your v...](https://blog.kirillov.cc/posts/obsidian-livesync/)
	  - says Obsidian [[2025-03-26#Git Plugin]] will have eventually have conflicts
	  - official Obsidian Sync "not an option", you don't control where files are stored, 
	  - so they make a home compuer CouchDB server of some kind.  
# Synced Windows/MacOS hotkeys conflict and overwrite
This is partly because I was syncing the whole obsidian directory with OneDrive.  When using [[2024-06-18#Emacs Text Editor Plugin|Emacs Text Editor Plugin]], and have mapped, say `alt + f` (`opt + f` on the Mac laptop keyboard) to `word forward` on the Mac, then what gets synced back to windows is to use `ctrl + f` for `word forward`. 

==Does that agree w/ the table below?==

- I'm seeing MacOS Opt (Alt on my big keyboard) getting turned into Ctrl on my Windows machine, after the settings are synced
- In Karabiner, could I
	- swap Opt and Win? ==NAH, FIGURETHISOUT==
	- only for Obsidian, so non-buggy stuff still works, like emacs and vscode
	- then remap the MacOS "alt" keys by typing
	- Then, "alt+x" would be seen as cmd+x, and this would get synced to windows as ctrl?

- Related: [Platform specific hotkeys - #1...](https://forum.obsidian.md/t/platform-specific-hotkeys/56050/15)
## Summary of the problem
From [Platform specific hotkeys - #1...](https://forum.obsidian.md/t/platform-specific-hotkeys/56050/11?u=scotto)
[doutwhirr](https://forum.obsidian.md/u/doutwhirr)  [Aug 2023](https://forum.obsidian.md/t/platform-specific-hotkeys/56050/11?u=scotto "Post date")

Okay, looping back to this –

I think I have figured out what is going on. Cross-platform keybinds work for two of the keys, but is broken for the third. This this is the mapping in Obsidian right now:

|Code in hotkeys.json|Windows|Mac|
|---|---|---|
|Alt|Alt|Opt|
|Ctrl|-|Ctrl|
|Meta|Win|-|
|Mod|Ctrl|Cmd|

If you do the standard thing on Mac for cross-platform keyboard sanity, you swap Cmd and Ctrl. Therefore, the Mod and Alt codes work perfectly as expected.

The trouble comes with the Ctrl and Meta codes

- Ctrl is never stored in Windows when you are setting hotkeys in the UI, but is interpreted as “Ctrl” in windows when it’s in the hotkeys.json file.
- Meta is never stored in Mac when you are setting hotkeys in the UI, but is interpreted as “Cmd” on mac when it’s in the hotkeys.json file.

These interpretations match how the browser interprets these codes. But, Obsidian uses a code to swap two keys used (Mod), and no code to swap them back. Therefore,

- If you hit all three on Windows, you store “Alt, Mod, Meta” in the hotkeys.json file. This is interpreted as “Opt, Cmd, Cmd” on Mac, breaking the hotkey
- If you hit all three on Mac, you store “Alt, Mod, Ctrl” in the hotkeys.json file. This is interpreted as “Alt, Ctrl, Ctrl” on Windows, breaking the hotkey.

While I believe this is a bug and will file a bug ticket for it, there is a solution for the time being that doesn’t involve using the .obsidian folder.

**SOLUTION**: Never use the Windows key (which is Ctrl on Mac) to map a hotkey.
# Obsidian Syncing Plugins
## Git Plugin for Syncing
- [[2024-07-30#Git Plugin]]
- has some problems
## LiveSync Plugin
From: [GitHub - vrtmrz/obsidian-lives...](https://github.com/vrtmrz/obsidian-livesync)
## Remotely Save Plugin
From: [GitHub - remotely-save/remotel...](https://github.com/remotely-save/remotely-save)
- Guy [says](https://www.reddit.com/r/ObsidianMD/comments/1bp7cw4/review_remotely_save_plugin_sync_seamlessly/) he's tried them all, this is best



