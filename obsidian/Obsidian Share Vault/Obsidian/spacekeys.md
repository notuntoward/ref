---
created date: 2025-02-26T19:43:33-08:00
modified date: 2025-04-04T11:22:23-07:00
---
```yaml
# Root command group
items:

  # Command mapped to the single key combination "Ctrl+Enter"
  c-enter:
    command: global-search:open
    description: Search in all files

  0:
    command: workspace:close-tab-group
    description: Close tab group

  1:
    command: obsidian-focus-mode:toggle-super-focus-mode
    description: Toggle Super Focus

  2:
    command: workspace:split-horizontal
    description: Split Horizontal

  3:
    command: workspace:split-vertical
    description: Split Vertical
    
  o:
    command: workspace:next-tab
    description: Next Tab 

  O:
    command: outline:open
    description: Open Outline
    
  ']':
    command: app:toggle-right-sidebar
    description: Toggle right pane

  '[':
    command: app:toggle-left-sidebar
    description: Toggle left pane

  t:
    command: table-editor-obsidian:table-control-bar
    description: Tables Pane

  b:
    command: bookmarks:open
    description: Bookmark open

  B:
    command: bookmarks:bookmark-current-view 
    description: Bookmark current view

  pagedown:
    command: obsidian-focus-mode:toggle-focus-mode 
    description: Bookmark current view

  pageup:
    command: obsidian-focus-mode:toggle-super-focus-mode 
    description: Bookmark current view

  'c-f':
    command: darlal-switcher-plus:switcher-plus:open
    description: Quick Switcher++

  s:
    command: editor:toggle-source
    description: Toggle Preview Source

  f:
    command: editor:fold-all
    description: Fold all
    
  F:
    command: editor:unfold-all
    description: Unfold All

  m:
    command: editor:fold-more
    description: Fold More
    
  l:
    command: editor:fold-less
    description: Fold Less
    
  h:
    command: editor:fold-all
    description: Fold All
    
  H:
    command: editor:unfold-all
    description: Unfold All    
    
```