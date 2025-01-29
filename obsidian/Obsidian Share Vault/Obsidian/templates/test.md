---
created date: 2025-01-25T16:19:54-08:00
modified date: 2025-01-25T16:19:54-08:00
---
{#- Heavily modified from:  https://medium.com/@alexandraphelan/an-updated-academic-workflow-zotero-obsidian-cffef080addd -#}
{%- macro truncateTitle(title, n) -%}
    {%- set words = title.split(' ') -%}
    {%- set truncatedTitle = words.slice(0, n).join(' ') -%}
    {{ truncatedTitle }}
{%- endmacro -%}

{%- macro basename(filePath) -%}
  {%- set normalizedPath = filePath | replace("\\", "/") -%}
  {%- set fileParts = normalizedPath.split("/") -%}
  {%- set endpath = fileParts | last -%}
  {{- endpath -}}
{%- endmacro -%}

---
category: literaturenote
tags:
read: false
aliases: 
- "{{title}}"
- "{{truncateTitle(title, 5)}}"
created date: {{exportDate | format(“YYYY-MM-DD”)}}
modified date: 
citekey: {{citekey}}
ZoteroTags: "{{allTags}}"
ZoteroImportDate: {{importDate | format("YYYY-MM-DD h:mm a")}}
publisher: "{{publicationTitle}}"
DOI: "{{DOI}}"
created date: 2025-01-25T13:59:16-08:00
modified date: 2025-01-25T13:59:16-08:00

---
{%- macro printTags(rawTags) -%}
	{%- if rawTags.length > 0 -%}
		{%- for tag in rawTags -%}
			#{{ tag.tag | lower | replace(" ","_") }} {{ space() }} 
		{%- endfor -%}
	{%- endif -%}
{%- endmacro %}

> [!info]- &nbsp;[**Zotero**]({{desktopURI}}) {% if DOI %} | [**DOI**](https://doi.org/{{DOI}}){% endif %} {% if url %} | [**URL**]({{url}}){% endif %}{% for attachment in attachments | filterby("path", "endswith", ".pdf") %} | **[[{{basename(attachment.path)}}|PDF]]**{%- endfor %}{% for attachment in attachments | filterby("path", "endswith", ".html") %} | **[[{{basename(attachment.path)}}|HTM]]**{%- endfor %}{% for attachment in attachments | filterby("path", "endswith", ".docx") %} | **[[{{basename(attachment.path)}}|DOC]]**{%- endfor %}{% for attachment in attachments | filterby("path", "endswith", ".pptx") %} | **[[{{basename(attachment.path)}}|PPT]]**{%- endfor %}{% for attachment in attachments | filterby("path", "endswith", ".txt") %} | **[[{{basename(attachment.path)}}|TXT]]**{%- endfor %}
>
> {% if abstractNote %}
> **Abstract**
> {{abstractNote|replace("\n"," ")}}
> {% endif %}
> {{ "" }}
{% for type, creators in creators | groupby("creatorType") -%}
{%- for creator in creators -%}
> **{{"First" if loop.first}}{{type | capitalize}}**::
{%- if creator.name %} {{creator.name}}  
{%- else %} {{creator.lastName}}, {{creator.firstName}}  
{%- endif %}  
{% endfor %}~ 
{%- endfor %}    
> **Title**:: "{{title}}"  
> **Date**:: {{date | format("YYYY-MM-DD")}}  
> **Citekey**:: {{citekey}}  
> **ZoteroItemKey**:: {{itemKey}}  
> **itemType**:: {{itemType}}  
> **DOI**:: {{DOI}}  
> **URL**:: {{url}}  
> **Journal**:: {{publicationTitle}}  
> **Volume**:: {{volume}}  
> **Issue**:: {{issue}}  
> **Book**:: {{publicationTitle}}  
> **Publisher**:: {{publisher}}  
> **Location**:: {{place}}   
> **Pages**:: {{pages}}  
> **ISBN**:: {{ISBN}}  
> **ZoteroTags**:: {{allTags}}
> **Related**:: {% for relation in relations | selectattr("citekey") %} [[@{{relation.citekey}}]]{% if not loop.last %}, {% endif%} {% endfor %}

> {%- if bibliography %} {{bibliography}}{%- endif %}
{% persist "Obsidian Notes" %}
___
==Delete this and write here.==
==Don't delete the `persist` directives above and below.==
___
{% endpersist %}
{% if notes.length > 0 %}
> [!note]- &nbsp;Zotero Note ({{notes.length}})
{{ "" }}
{%- for note in notes -%}
{#- Clean up note, change heading level, just in case -#}
> {{ note.note | replace ("# ","### ") | replace(r/\n/g, '\n> ')}}
> {{printTags(note.tags)}}
> <small>📝️ (modified: {{ note.dateModified | format("YYYY-MM-DD") }}) [link](zotero://select/library/items/{{note.key}}) - [web]({{note.uri}})</small>
>  {{ "" }}
> ---
{% endfor %}
{% endif -%}
