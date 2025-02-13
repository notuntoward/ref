---
type: Zotero Import
parent: 
child: 
siblings: []
tags: 
Keywords: "{{allTags}}"
aliases: 
publisher: "{{publicationTitle}}"
citation key: "{{citekey}}"
DOI: "{{DOI}}"
"created date:": "{{exportDate | format(“YYYY-MM-DD”)}}"
"modified date:": 
created date: 2024-12-17T08:51:31-08:00
modified date: 2024-12-17T08:51:31-08:00
---

**{{title}}.** {%- for creator in creators %} {%- if creator.name == null %} {{creator.firstName}} {{creator.lastName}}, {%- endif -%} {%- if creator.name %}**{{creator.creatorType | capitalize}}**:: *{{creator.name}}*{%- endif -%}{%- endfor %} *{{date | format("YYYY-MM-DD")}}*

> [!meta]- Details – [**Zotero**]({{desktopURI}}) {% if DOI %}| [**DOI**](https://doi.org/{{DOI}}){% endif %}  | {% for attachment in attachments | filterby("path", "endswith", ".pdf") %} [[{{attachment.title}}|PDF]]{%- endfor %}{% for attachment in attachments | filterby("path", "endswith", ".html") %} | [[{{attachment.title}}|HTML]]{%- endfor %}
> **Title**:: {{title}}  
> **Authors**:: {% for type, creators in creators | groupby("creatorType") -%}{%- for creator in creators -%} **{{"First" if loop.first}}{{type | capitalize}}**::
{%- if creator.name %} {{creator.name}}  
{%- else %} {{creator.lastName}}, {{creator.firstName}}  
{%- endif %}  
{% endfor %}~ 
{%- endfor %}    
> **Date**:: {{date | format("YYYY-MM-DD")}} 
> **Citekey**:: {{citekey}} {%- if itemType %}  
> **url** {{url}}
> **itemType**:: {{itemType}}{%- endif %}{%- if itemType == "journalArticle" %}  
> **Journal**:: *{{publicationTitle}}* {%- endif %}{%- if volume %}  
> **Volume**:: {{volume}} {%- endif %}{%- if issue %}  
> **Issue**:: {{issue}} {%- endif %}{%- if itemType == "bookSection" %}  
> **Book**:: {{publicationTitle}} {%- endif %}{%- if publisher %}  
> **Publisher**:: {{publisher}} {%- endif %}{%- if place %}  
> **Location**:: {{place}} {%- endif %}{%- if pages %}   
> **Pages**:: {{pages}} {%- endif %}{%- if DOI %}  
> **DOI**:: {{DOI}} {%- endif %}{%- if ISBN %}  
> **ISBN**:: {{ISBN}} {%- endif %}    
> {% if allTags %}**ZoteroTags**:: {{allTags}}{% endif %}
> {%- if bibliography %}**Bibliography:** {{bibliography}}{%- endif %}
> **Related**:: {% for relation in relations -%} {%- if relation.title-%} [[{{relation.title}}]], {% endif -%} {%- endfor%}
>

> [!ABSTRACT]- ABSTRACT
> {% if abstractNote %} 
> {{abstractNote|replace("\n"," ")}}
> {% else %} There is no abstract.
> {% endif %}


TOOO:
- [x] get html attachments
- [x] pdfs and html to obsidian Vault
- [x] links are markdown notes titles w/ no path
- [ ] persistence
- [ ] relations are citekeys
- [ ] closer spaced callouts
- [x] fix authorname and date at to
- [ ] get rid if ~ in metadata author list
- [ ] get other attachments

Test entry: ZTEST_Ng24RobotsTalkBack

# Obsidian Notes 
{% persist "Obsidian Notes" %}
{#- No text within persistence. Blank line below will get copied each time the Zotero note is exported -#}
.
{% endpersist %}


