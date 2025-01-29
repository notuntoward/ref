---
created date: 2024-12-17T08:51:31-08:00
modified date: 2024-12-17T08:51:31-08:00
---

```
import os
import json

# Path to your Obsidian vault
vault_path = 'path/to/your/vault'

# Path to the plugins directory
plugins_dir = os.path.join(vault_path, '.obsidian', 'plugins')

# List to hold the names of installed plugins
installed_plugins = []

# Iterate over each folder in the plugins directory
for plugin_folder in os.listdir(plugins_dir):
    folder_path = os.path.join(plugins_dir, plugin_folder)
    if os.path.isdir(folder_path):
        # Path to the manifest.json file for the plugin
        manifest_path = os.path.join(folder_path, 'manifest.json')
        if os.path.isfile(manifest_path):
            with open(manifest_path, 'r') as manifest_file:
                manifest_data = json.load(manifest_file)
                # Add the plugin name to the list
                installed_plugins.append(manifest_data['name'])

# Write the list of installed plugins to a file
with open('installed_plugins.txt', 'w') as file:
    for plugin_name in installed_plugins:
        file.write(f"{plugin_name}\n")

print("List of installed plugins has been saved to installed_plugins.txt")

```