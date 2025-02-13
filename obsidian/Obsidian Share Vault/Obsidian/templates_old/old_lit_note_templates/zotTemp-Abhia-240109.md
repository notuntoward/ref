---
created date: 2024-12-17T08:51:31-08:00
modified date: 2024-12-17T08:51:31-08:00
---
{#- The absolute minimum! Maybe too min, as it doesn't link back to zotero entry -#}
{#- From: https://forum.obsidian.md/t/my-zotero-annotation-template-that-works/51662/32?u=scotto -#}
---
year: {{date | format ("YYYY")}}
tags: research, {{allTags}}
authors: {{authors}}

Abstract:  {{abstractNote}}
---

### {{title}}
{{pdfZoteroLink}}

### Notes
{% for annotation in annotations -%}{%- if annotation.annotatedText -%}{% if 'Red' in annotation.colorCategory %} 
##### {{annotation.annotatedText | escape }}{% else %}
<mark class="customZot-{% if annotation.color %}{{annotation.colorCategory}} {% endif %}">{{annotation.annotatedText | escape }}</mark> ([{{annotation.page}}](zotero://open-pdf/library/items/{{annotation.attachment.itemKey}}?page={{annotation.page}}&annotation={{annotation.id}}))

{% endif %}{%- endif %} {% if annotation.imageRelativePath %} ![[{{annotation.imageRelativePath}}]]{% endif %}{% if annotation.comment %} 
>{{annotation.comment}}
{% endif %}{% endfor -%}
