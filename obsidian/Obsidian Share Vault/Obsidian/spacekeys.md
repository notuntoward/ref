---
created date: 2025-02-26T19:43:33-08:00
modified date: 2025-03-01T13:47:39-08:00
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
    description: Super Focus

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

# 
  # A group of commands with common prefix key "f"
  f:
    description: File
    items:
    
      d: daily-notes Daily Notes

      # Command mapped to the key sequence "f d"
      # Description determined automatically from command
      # d:
      #  command: app:delete-file

      # Command mapped to "f m"
      # This uses the short form
      m: file-explorer:move-file Move file
      # (equivalent to long form:)
      # m:
      #  command: file-explorer:move-file
      #  description: Move file

```