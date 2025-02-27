---
created date: 2025-02-26T19:43:33-08:00
modified date: 2025-02-26T23:24:14-08:00
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
    command: workspace:close-others-tab-group
    description: Close other tab groups

  2:
    command: workspace:split-horizontal
    description: Split Horizontal

  3:
    command: workspace:split-vertical
    description: Split Vertical

  o:
    command: workspace:next-tab
    description: Next Tab 

  r:
    command: app:toggle-right-sidebar
    description: Toggle right pane

  # might want to use this for all the links commands
  # maybe use L for that?
  l:
    command: app:toggle-left-sidebar
    description: Toggle left pane

  b:
    command: app:workspace:previous-tab Previous Tab

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