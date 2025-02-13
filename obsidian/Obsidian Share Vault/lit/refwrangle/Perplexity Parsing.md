---
created date: 2025-02-10T15:50:01-08:00
modified date: 2025-02-13T07:34:37-08:00
---

# Reference relinking

## Common Code

```python

def _create_obsidian_or_zotero_link(self, item: Dict) -> str:
        """Create Obsidian wikilink if literature note exists, otherwise Zotero URL link"""
        if item.get('hasLitNote'):
            return f'[[{item["citekey"]}|{item["citekey"]}]]'
        
        return rfw.zotero_item_link(
            item["zotkey"], 
            f'{item["citekey"]}\u2794{item["zotkey"]}'
        )

def find_my_link(url,title=None)
	if item := url2citekey(url)
		return  _create_obsidian_or_zotero_link(item)

	if item := title2citekey(title)
			return _create_obsidian_or_zotero_link(item)
			
	return None
        def _replace_body_link(match: re.Match) -> str:
            url = rfw.normalize_url(match.group(2))
            link_num = match.group(1)
            
            if url not in source_url_map:
                unsourced_links[url] += 1
                
            if item := self._find_zotero_item_via_url(url):
                return self._create_obsidian_or_zotero_link(item)
            if title := source_url_map.get(url):
                if item := self._find_zotero_item_via_title(title):
                    return self._create_obsidian_or_zotero_link(item)
            
            unmatched_links[link_num] = True
            return f'=={match.group(0)}=='
```

## Perplexity Response Clipboard Copy

```python
def links_from_source_perp(sources_text)
	links = {}
	for sourceref in sources_text:
		refnum, url = parseref_perp(sourceref)
		links[refnum] = find_my_link(url)

	return links
```

```python
refnum_to_link_source = links_from_source_perp(sources_text)


```
	
- body
```python
#refnums_body = regexp_body_refs(body_text)
```
- sources
```python
refnum_to_url = build_refnum_lookup(sources_text)
newlinks = {}
newreflist = []
for refnum, url in refnum_to_url:
	if (newlink := relink(url))
		newlinks[refnum] = newlink

	return newlinks


# perp

# smc

	


```

## Save My Chatbot Reponse

- body
- source
```python
def links_from_source_smc(sources_text)
	for sourceref in sources_text:
		refnum, url, title = parseref_smc(sourceref)
		links[refnum] = find_my_link(url, title)

	return links
```

```python

refnum_to_link_source = links_from_source_smc(sources_text)

```
# Dataflow
```handdrawn-ink
{
	"versionAtEmbed": "0.3.3",
	"filepath": "lit/refwrangle/attachments/Ink/Drawing/2025.2.10 - 15.50pm.drawing",
	"width": 742,
	"aspectRatio": 1.4570088750187715
}
```

