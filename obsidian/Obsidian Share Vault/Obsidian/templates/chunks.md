---
created date: 2024-12-17T08:51:31-08:00
modified date: 2024-12-17T08:51:31-08:00
---

https://forum.obsidian.md/t/zotero-integration-import-templates/36310/2

{%- for attachment in attachments | filterby("path", "endswith", ".pdf") %}
> - **Link:** [{{attachment.title}}](file://{{attachment.path | replace(" ", "%20")}})
{%- endfor -%}


{#- Example Windows path -#}
{%- set filePath = 'C:\\Users\\YourName\\Documents\\myFile.txt' -%} 
{%- set filePath = filePath | replace('\\', '/') -%} {# Normalize path separators #}
{%- set lastSlashIndex = filePath | lastIndexOf('/') -%} {# Find the last slash #}
{%- set basename = filePath | slice(lastSlashIndex + 1) -%} {# Extract the basename #}
Basename: {{ basename }} 


-------------------------------
{% for attachment in attachments | filterby("path", "endswith", ".html") %} | [[{{basename(attachment.path)}}|HTM]]{%- endfor %}{% for attachment in attachments | filterby("path", "endswith", ".docx") %} | [[{{attachment.title}}|DOC]]{%- endfor %}{% for attachment in attachments | filterby("path", "endswith", ".pptx") %} | [[{{attachment.title}}|PPT]]{%- endfor %}{% for attachment in attachments | filterby("path", "endswith", ".txt") %} | [[{{attachment.title}}|TXT]]{%- endfor %}
