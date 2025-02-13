---
created date: 2024-12-17T08:51:31-08:00
modified date: 2024-12-17T08:51:31-08:00
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
citekey: {{citekey}}
status: unread
dateread:
ZoteroTags: "{{allTags}}"
aliases: 
- "{{title}}"
- "{{truncateTitle(title, 5)}}"
publisher: "{{publicationTitle}}"
citation key: "{{citekey}}"
DOI: "{{DOI}}"
created date: {{exportDate | format(“YYYY-MM-DD”)}}
modified date: 
---
{%- macro printTags(rawTags) -%}
	{%- if rawTags.length > 0 -%}
		{%- for tag in rawTags -%}
			#{{ tag.tag | lower | replace(" ","_") }} {{ space() }} 
		{%- endfor -%}
	{%- endif -%}
{%- endmacro %}


{% for attachment in attachments | filterby("path", "endswith", ".pdf") %} | [[basename({{attachment.path}})|PDF]]{%- endfor %}

> [!info]- : [**Zotero**]({{desktopURI}}) {% if DOI %} | [**DOI**](https://doi.org/{{DOI}}){% endif %} {% if url %} | [**URL**]({{url}}){% endif %}{% for attachment in attachments | filterby("path", "endswith", ".pdf") %} | [[attachment.path|PDF]]{%- endfor %}{% for attachment in attachments | filterby("path", "endswith", ".html") %} | [[{{basename(attachment.path)}}|HTM]]{%- endfor %}{% for attachment in attachments | filterby("path", "endswith", ".docx") %} | [[{{attachment.title}}|DOC]]{%- endfor %}{% for attachment in attachments | filterby("path", "endswith", ".pptx") %} | [[{{attachment.title}}|PPT]]{%- endfor %}{% for attachment in attachments | filterby("path", "endswith", ".txt") %} | [[{{attachment.title}}|TXT]]{%- endfor %}
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

> {{bibliography}}
{% persist "Obsidian Notes" %}
___
==Delete this and write here.==
==Don't delete the `persist` directives above and below.==
___
{% endpersist %}
{% if notes.length > 0 %}
> [!note]- Zotero Note ({{notes.length}})
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

{% if annotations.length > 0 %}
## Annotations
{%- macro calloutHeader(type, color) -%}  
{%- if type == "highlight" -%}  
<mark style="background-color: {{color}}">Quote</mark>  
{%- endif -%}

{%- if type == "text" -%}  
Note  
{%- endif -%}  
{%- endmacro -%}

{% persist "annotations" %}
{% set newAnnotations = annotations | filterby("date", "dateafter", lastImportDate) %}
{% if newAnnotations.length > 0 %}

### Imported: {{importDate | format("YYYY-MM-DD h:mm a")}}


{% for a in newAnnotations %}
{{calloutHeader(a.type, a.color)}}
> {{a.annotatedText}}
{% endfor %}
{% endif %}
{% endpersist %}
{% endif %}
