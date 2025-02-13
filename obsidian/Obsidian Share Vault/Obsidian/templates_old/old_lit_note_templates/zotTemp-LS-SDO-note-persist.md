---
created date: 2024-12-17T08:51:31-08:00
modified date: 2024-12-17T08:51:31-08:00
---
{#- TODO: failed on images but is mostly nice otherwise.  Fix by copying what zotTemp-4-images.md did for images -#}

Aliases:: {{citekey}}
Created/Modified: {{importDate|format("YYYY-MM-DD")}} / {{importDate|format("YYYY-MM-DD")}}
## {{title}}

> [!info]- Info - [**Zotero**]({{desktopURI}}) {% if DOI %}| [**DOI**](https://doi.org/{{DOI}}){% endif %}  | Local {% for attachment in attachments | filterby("path", "endswith", ".pdf") %}[**PDF**](file:///{{attachment.path | replace(" ", "%20")}}){%- endfor %}

> [!ABSTRACT]- Abstract
> {% if abstractNote %} 
> {{abstractNote|replace("\n"," ")}}
> {% endif %}

> [!meta]- Metadata 
> **Title**:: {{title}}  
> **Authors**:: {%- for creator in creators %} {%- if creator.name == null %} {{creator.firstName}} {{creator.lastName}}, {%- endif -%} {%- if creator.name %}**{{creator.creatorType | capitalize}}**:: {{creator.name}}{%- endif -%}{%- endfor %}
> **Year**:: {{date | format("YYYY")}} 
> {%- if itemType %}**ItemType**:: {{itemType}}{%- endif %}
> {%- if itemType == "journalArticle" %}**Journal**:: *{{publicationTitle}}* {%- endif %} 
> {%- if itemType == "bookSection" %}**Book**:: {{publicationTitle}} {%- endif %}
> {% if allTags %}**Keywords**:: {{allTags}}{% endif %}
> {%- if bibliography %}**Bibliography:** {{bibliography}}{%- endif %}
{#- TAGS PRINTER: handle space characters in zotero tags -#}
{%- set space = joiner(' ') -%} 
{%- macro printTags(rawTags) -%}
	{%- if rawTags.length > 0 -%}
		{%- for tag in rawTags -%}
			#{{ tag.tag | lower | replace(" ","_") }} {{ space() }} 
		{%- endfor -%}
	{%- endif -%}
{%- endmacro %}
{#- handle | characters in zotero strings used in MD -#}
{% macro formatCell(cellText) -%}
{{ cellText | replace("|","❕")}}
{%- endmacro %}
{# Ugly. Can delete Obsidian markdown after copying the info into the note #} 
{%- if relations.length > 0 %}
{{ "" }}
> [!abstract] Related Zotero items ({{ relations.length}}):  
>
> | title | proxy note | desktopURI |
> | --- | --- | --- |
{%- for r in relations %}
> | {{formatCell(r.title)}} | [[@{{r.citekey}}]] | [Zotero Link]({{r.desktopURI}}) | {% if rel.DOI %}> DOI: {{rel.DOI}}{% endif %} |
{%- endfor -%}
{{ "" }}
{%- endif %}
{# Ugly. Can delete Obsidian markdown after copying the info into the note #} 
# Notes
{% persist "Notes" %}
> {%- if markdownNotes %}
>{{markdownNotes}}{%- endif -%}.
{% endpersist %}
