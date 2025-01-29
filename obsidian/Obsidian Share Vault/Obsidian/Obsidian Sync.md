---
modified date: 2024-07-23T12:02:46-07:00
created date: 2024-12-17T08:51:31-08:00
---
# Windows/MacOS hotkey conflict and overwrite

When using [[2024-06-18#Emacs Text Editor Plugin|Emacs Text Editor Plugin]], and have mapped, say `alt + f` (`opt + f` on the Mac laptop keyboard) to `word forward` on the Mac, then what gets synced back to windows is to use `ctrl + f` for `word forward`. 

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