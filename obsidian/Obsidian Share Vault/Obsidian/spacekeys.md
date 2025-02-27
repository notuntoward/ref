---
created date: 2025-02-26T19:43:33-08:00
modified date: 2025-02-26T19:45:00-08:00
---
```yaml
# Root command group
items:

  # Command mapped to the single key combination "Ctrl+Enter"
  c-enter:
    command: global-search:open
    description: Search in all files

  # A group of commands with common prefix key "f"
  f:
    description: File
    items:

      # Command mapped to the key sequence "f d"
      # Description determined automatically from command
      d:
        command: app:delete-file

      # Command mapped to "f m"
      # This uses the short form
      m: file-explorer:move-file Move file
      # (equivalent to long form:)
      # m:
      #  command: file-explorer:move-file
      #  description: Move file
      
  2:
	  command: workspace:split-horizontal
	  description: split pane horizontally
	
	3:
	  command: workspace:split-vertical
	  description: split pane horizontally
	
```