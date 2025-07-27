---
created date: 2025-07-26T18:20:43-07:00
modified date: 2025-07-27T11:13:01-07:00
tags:
  - refwrangle
new property: 
---
# Requirements

## Relevant Existing Obsidian Commands

| Command               | From                 | Comment                                                                                                                                                                                                                                                      |
| --------------------- | -------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Add file property     | Base                 | interface is good.  Good way to select property type, good handling of both single value properties with a list of existing values and of a list value property, each value comes from a completion list (==could be narrowed to properties in note group==) |
| Show all properties   | Properties view core | search for all files that have a certain property, makes a list. (not property value(s) but just existence of that property) ==Borrow the hamburger menu, which has a DELETE option?==                                                                       |
| Show file properties  | Properties view core | good completion lists for both property names and property values (if list shows them w/ simple way to add or delete for single document).  Not too applicable here, I think.                                                                                |
| Clear file properties | Base                 | too nuke                                                                                                                                                                                                                                                     |
## Relevant Plugins
- [[2024-04-08#Properties View Cor
- 
- 
- 
- 
- 
- 
- 
- 
- e Plugin]]: fantastic for single notes
- [[2024-04-08#Multi Properties plugin]]: not changing, my PR doesn't extend easily
- [[2025-07-26#Better Properties Plugin|Better Properties Plugin]]: a dead-end
- [[2025-07-26#Metadata Menu Plugin|Metadata Menu Plugin]]: obsolete?
- [[2024-04-08#Tags View Core Plugin]]: nice, hierarchical, searchable (notes and tags)
- [[2025-07-26#Tags Overview Plugin]]: a better tag searching, panel example, but a bit ugly, doesn't get `/` tag hierarchy, unlike [[2024-04-08#Tags View Core Plugin]]
	- see ["Pane" query in Perplexity](https://www.perplexity.ai/search/i-like-the-pane-views-that-obs-3Nl.sT19QpG2JwRi6xnhRA)
	- and [prettying advice](https://www.perplexity.ai/search/i-like-the-pane-views-that-obs-3Nl.sT19QpG2JwRi6xnhRA#1)
- [[2024-04-08#Tag Wrangler plugin|Tag Wrangler plugin]]: it's a [[2024-04-08#Tags View Core Plugin]] enhancer (nice?)
- [[2025-07-26#Tags and Properties Plugins|Tags and Properties Plugins]]

## Commands
### Initial Commands
#### Current bodge
- with [[2024-04-08#Multi Properties plugin|Multi Properties plugin]]
- commands
	- Add props to current note
	- Remove props from current note
	- Add props to tabs in active tab group
	- Remove props from tabs in active tab group
	- Add value to a property on the current note
	- Remove a value from a property on the current note
	- Remove a value from a property on all notes in the active tab group
#### Simplification in prototype

- Add props to current note
- Remove props from current note
- Add props to active tab group
- Remove props from active tab group

In the first prototype, the set of notes to operate on are.  Note that modifying properties for the current document is not necessary as existing obsidian commands `Add Property` and 

1. all notes in the same tab group
2. all open notes in any window or tab group

The operations are:

1. add a property and value(s)
   - the property name should be selected from a completion list of all property names in all notes, or a blank place to type a new property name
   - there should be a simple way select the property type
2. set value
   - if it's not a list type
      - there should be a completion list of all values for the property in all notes, with simple way to type in a non-existing value
   - if it's a list type, there should be a similar completion list, and it should be easy to 
   - if it'
# AI general prompts
## color the tabs

# My original attempts, starting from the fork

Write an obsidian plugin that turns tabs a certain when I click on them.  The color is controlled by a side panel selector which has options for red, green and blue

There are three coloring modes:

1. a normal click: just colors that tab if it is not already colored, or otherwise, uncolors it.
2. shift+click: allows me to select multiple tabs with a mouse (like in a browser), so that a contiguous range of tabs is colored
3. ctrl+click: select and color several non-contiguous tabs.  
   
You must keep track of which tabs are currently colored, if the user changes to color in the side pane selector, the plugin must change all the previously colored tabs.

## My prompt to gemini cli
I want to create an obsidian plugin that allows me to select multiple tabs with a mouse:  shift+click (like in a browser), so that a contiguous range of tabs is selected or ctrl+click to select several non-contiguous tabs.  Figuring out how to do this selection and show it in the Obsidian UI is the first job.  Next, is to do operations on the selected tabs: 1. move tabs to new window (happens when I drag the tabs to a place outside of obsidian that is not another window) 2. move tabs to existing window (when I drag the selected tabs to an existing obsidian window)  3. add/remove properties to/from the selected tabs 3. add/remove/rename tags in selected tabs, first  adding a tags property to a tab if one doesn't exist.  4.I would also like to do these things for all tabs in a window or 5. for all open tabs in all windows.  For an example of how to add/remove properties to all tabs in window, see my plugin here: https://github.com/notuntoward/obsidian-multi-properties.git

Set up a repo and write the code.
## Tab colorizer: a first step
- [AI studio dialog](https://aistudio.google.com/app/prompts?state=%7B%22ids%22:%5B%22165lArEVq5D5MOaEBV-EyKv902Ma378C3%22%5D,%22action%22:%22open%22,%22userId%22:%22106663353829707201139%22,%22resourceKeys%22:%7B%7D%7D&usp=sharing)


# Programming in Obsidian
- Perplexity Space: [obsidian plugin dev](https://www.perplexity.ai/spaces/obsidian-plugin-dev-FyXq3js9SXKlaZG_OpjxGA)

