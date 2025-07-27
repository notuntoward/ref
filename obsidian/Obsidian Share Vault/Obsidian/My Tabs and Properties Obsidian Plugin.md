---
created date: 2025-07-26T18:20:43-07:00
modified date: 2025-07-26T22:13:10-07:00
tags:
  - 2Hop
  - AI
  - anger
new property:
  - bob
  - fred
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
- [[2024-04-08#Properties View Core Plugin]]: fantastic for single notes
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
1. set value
   - if it's not a list type
      - there should be a completion list of all values for the property in all notes, with simple way to type in a non-existing value
   - if it's a list type, there should be a similar completion list, and it should be easy to 
   - if it'


# Programming in Obsidian
- Perplexity Space: [obsidian plugin dev](https://www.perplexity.ai/spaces/obsidian-plugin-dev-FyXq3js9SXKlaZG_OpjxGA)

