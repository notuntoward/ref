---
created date: 2025-01-24T20:23:52-08:00
modified date: 2025-01-24T20:23:52-08:00
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

{#- TODO: failed on images but is mostly nice otherwise.  Fix by copying what zotTemp-4-images.md did for images -#}

{#- Persitence code from: https://github.com/mgmeyers/obsidian-zotero-integration/blob/main/docs/Templating.md#how-do-i-prevent-sections-of-my-templates-from-being-overwritten -#}

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
DOI: "{{DOI}}"
created date: {{exportDate | format(“YYYY-MM-DD”)}}
modified date: 
---

> [!info]- [**Zotero**]({{desktopURI}}) {% if DOI %}| [**DOI**](https://doi.org/{{DOI}}){% endif %}  | Local {% for attachment in attachments | filterby("path", "endswith", ".pdf") %}[**PDF**](file:///{{attachment.path | replace(" ", "%20")}}){%- endfor %}

> [!ABSTRACT]- Abstract
> {% if abstractNote %} 
> {{abstractNote|replace("\n"," ")}}
> {% endif %}

> [!meta]- Metadata 
> **Title**:: {{title}}  
> **First Author**:: {%- for creator in creators %} {%- if creator.name == null %} {{creator.firstName}} {{creator.lastName}}, {%- endif -%} {%- if creator.name %}**{{creator.creatorType | capitalize}}**:: {{creator.name}}{%- endif -%}{%- endfor %}
> **Year**:: {{date | format("YYYY")}} 
> {%- if bibliography %}**Bibliography:** {{bibliography}}{%- endif %}

{# ==== Start region that written once, never updated after that =========== #} 
{% persist "Obsidian Notes" %}
___
==Delete this and write here.==
==Don't delete the `persist` directives above and below.==
___
{% endpersist %}
