---
created date: 2024-12-17T08:51:31-08:00
modified date: 2024-12-17T08:51:31-08:00
---
{#- Example of persitence from: https://github.com/mgmeyers/obsidian-zotero-integration/blob/main/docs/Templating.md#how-do-i-prevent-sections-of-my-templates-from-being-overwritten -#}

## {{title}}

### Notes
{% persist "notes" %}{% if isFirstImport %}
- [ ] first thing
- [ ] second thing
{% endif %}
{% endpersist %}
