---
created date: 2025-02-10T15:50:01-08:00
modified date: 2025-02-17T20:44:07-08:00
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
## Dataflow
### Relinking many concatenated reference sections


```handdrawn-ink
{
	"versionAtEmbed": "0.3.3",
	"filepath": "lit/refwrangle/attachments/Ink/Drawing/2025.2.13 - 9.17am.drawing",
	"width": 920,
	"aspectRatio": 1.8930041152263375
}
```

### Rough overall datafl 

**My mermaid flowchart in refwrangle/doc is better**
```handdrawn-ink
{
	"versionAtEmbed": "0.3.3",
	"filepath": "lit/refwrangle/attachments/Ink/Drawing/2025.2.10 - 15.50pm.drawing",
	"width": 500,
	"aspectRatio": 1.5661093328607476
}
```

# Citation link type vs zotero presence and perplexity dialog source

| zotero link | SMC source link title | source link            |
| ----------- | --------------------- | ---------------------- |
| 0           | 0                     | num_link url           |
| 0           | 1                     | num_link title         |
| 1           | 0                     | num_link zotlink       |
| 1           | 1                     | num_link title zotlink |
# Multi file / multi-prompt header organization

| SMC/Perp | num files | num prompts  | IMPLEMENT? | response title | file title | prompt title | chat file link   |
| -------- | --------- | ------------ | ---------- | -------------- | ---------- | ------------ | ---------------- |
| perp     | 1         | 1            | 1          | \# Response    | none       | none         | top of output    |
| perp     | 1         | M            | 0          | Response (n)   | none       | none         | top of output    |
| perp     | N         | 1 (unique)   | 0          | ResponseS      | file stem  | none         | below file tile  |
| perp     | N         | 1 (same)     | 1          | ResponseS      | file stem  | none         | below file title |
| perp     | N         | M            | 0          | Response       | file stem  | none         | below file tile  |
| smc      | 1         | 1            | 1          | Response       | none       | none         | top of output    |
| smc      | 1         | M            | 1          | Response       | none       | User: text   | top of output    |
| smc      | N         | 1 (unique)   | 1          | Response       | file stem  | User: text   | below file tile  |
| smc      | N         | 1 (all same) | 1          | ResponseS      | file stem  | User: text   | below file tile  |
| smc      | N         | M            | 1          | Response       | file stem  | User: text   | below file tile  |
## Functions implied by multi-file / multi-prompt table

- [ ] finish implementation of perp N1 same
- [ ] finish merging of perp and SMC code
- [ ] deal with file types (perp vs. SMC)
	- insist on all same type to avoid mixed header headaches
	- [ ]  how to specify type?
		- [ ] need a variable in the code
		- [x] detect type 
			- either to autodetect or to verify that files are all the same type
- [ ] prompt same prompt (SMC)
	- [ ] need a variable in the code
	- [ ] detect prompt similarity 
		- either to auto detect uniqueness or to verify)
- [x] detect if it is an smc multiprompt
- [ ] header logic
	- [ ] Perp 11
	- [ ] SMC 11
	- [ ] SMC 1M
	- [ ] SMC N1 unique
	- [ ] SMC N1 all same
	- [ ] SMC NM
--- 

 **Output Examples**

--- 

# SMC  Examples

---

### **SMC 11**

*[[source]]*
### User (shortened prompt)

> user prompt

### Response

> AI answer

### Sources
[1] asdfas
[2] asdfjl

---
## **SMC** 1M

*[[source]]*

### Prompt Reponses
#### User (shortened prompt 1)

> user prompt 1

#### Response

> AI answer

#### User (shortened prompt 2)

> user prompt 2

#### Response

> AI answer

### Sources
[1] asdfas
[2] asdfjl

--- 
## **SMC N1 (unique prompts)**

### File 1 stem
*[[source]]*
#### User (shortened prompt File 1)

> user prompt File 1

#### Response

> AI answer File 1

### File 2 stem
*[[source]]*
#### User (shortened prompt File 2)

> user prompt File 2

#### Response

> AI answer 

### Sources
[1] asdfas
[2] asdfjl

--- 
## **SMC N1 (same prompt)**

### User (shortened prompt File 1)

> user prompt File 1
### Responses
#### File 1 stem
*[[source]]*

> AI answer File 1

#### File 2 stem
*[[source]]*
### Sources
[1] asdfas
[2] asdfjl

---
## **SMC NM** (*don't try to organize for now, just merge sources*)
### File 1 Stem
*[[source]]*
#### User (shortened prompt 1)

> user prompt 1

#### Response

> AI answer 1

#### User (shortened prompt 2)

> user prompt 2

#### Response

> AI answer 2

### File 2 Stem
*[[source]]*
#### User (shortened prompt 1)

> user prompt 1

#### Response

> AI answer 1

#### User (shortened prompt 2)

> user prompt 2

#### Response

> AI answer 2

### Sources
[1] asdfas
[2] asdfjl

---
# Perplexity Examples

---

### **Perp 11**

*[[source]]*
## Response

> AI answer

## Sources
[1] asdfas
[2] asdfjl

---
## **Perp** 1M (Does not exist: NOT IMPLEMENTED )

--- 
## **Perp N1 (unique prompts: NOT IMPLEMENTED)**

### File 1 stem
*[[source]]*
#### Prompt 1 (you fill in below)
#### Response 1

> AI answer File 1

### File 2 stem
*[[source]]*
#### Prompt 2 (you fill in below)

#### Response 2

> AI answer File 2

## Sources
[1] asdfas
[2] asdfjl

--- 
## **Perp N1 (same prompt: NOT IMPLMENTED)**

### Prompt 1 (you fill in below)

#### File 1 stem
*[[source]]*

> AI answer File 1

#### File 2 stem
*[[source]]*
### Sources
[1] asdfas
[2] asdfjl

---
## **Perp NM** (NOT IMPLEMENTED)

--- 
