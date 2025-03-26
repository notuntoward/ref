---
created date: 2025-02-10T15:50:01-08:00
modified date: 2025-03-24T10:18:38-07:00
---

# Resources for Perplexity Parsing
- [[Dailies/2024-03-14.md#Python interfaces to Obsidian |Python interfaces to Obsidian]]
- Related: [[Zotero to Obsidian to RAG]]
- [[2023-10-12#Zotero <--> Obsidian Links]]
- [[Zotero to Obsidian to RAG#Python interfaces to Obsidian and Zotero]]
# Reference relinking
# Semi-manual Relinking: just relink footnotes
My [[#Script-based Automatic Dataflow]] stuff keeps breaking b/c of small changes or bugs in Perplexity's or SaveMyChatbot's export format.  It's too brittle.

But I could just paste either's markdown into an obsidian note, have python script recognize the footnotes and do the relinking *on that note only*.  Could be simpler.  Perplexity suggestion [[Perplexity Parsing]], for example [here](<Dailies/2024-03-14.md#^d3iv >).
## Script-based Automatic Dataflow
### Relinking many concatenated reference sections
```handdrawn-ink
{
	"versionAtEmbed": "0.3.3",
	"filepath": "lit/refwrangle/attachments/Ink/Drawing/2025.2.13 - 9.17am.drawing",
	"width": 870,
	"aspectRatio": 2.0422535211267605
}
```
### Rough overall dataflow

```handdrawn-ink
{
	"versionAtEmbed": "0.3.3",
	"filepath": "lit/refwrangle/attachments/Ink/Drawing/2025.2.10 - 15.50pm.drawing",
	"width": 500,
	"aspectRatio": 1.5661093328607476
}
```
- **My mermaid flowchart in refwrangle/doc is better**
	- was also easier to edit mermaid in vscode with live preview, as it's a code editor

# Citation link type vs zotero presence and perplexity dialog source

| zotero link | SMC source link title | source link            |
| ----------- | --------------------- | ---------------------- |
| 0           | 0                     | num_link url           |
| 0           | 1                     | num_link title         |
| 1           | 0                     | num_link zotlink       |
| 1           | 1                     | num_link title zotlink |
# Multi file / multi-prompt header organization

| SMC/Perp | num files | num prompts       | IMPLEMENT? | response title | Chat title   | top prompt | prompt title | chat file link   |
| -------- | --------- | ----------------- | ---------- | -------------- | ------------ | ---------- | ------------ | ---------------- |
| perp     | 1         | 1                 | 1          | \# Response    | none         | 1          | none         | top of output    |
| perp     | 1         | M (doesn't exist) | 0          | n/a            | n/a          | n/a        | n/a          | n/a              |
| perp     | N         | 1 (unique)        | 1          | ResponseS      | short prompt | 0          | none         | below file tile  |
| perp     | N         | 1 (same)          | 1          | ResponseS      | file stem    | 1          | none         | below file title |
| perp     | N         | M                 | 1          | Response       | short prompt | 0          | none         | below file tile  |
| smc      | 1         | 1                 | 1          | Response       | none         | 0          | none         | top of output    |
| smc      | 1         | M                 | 1          | Response       | short prompt | 0          | User: text   | top of output    |
| smc      | N         | 1 (unique)        | 1          | Response       | short prompt | 0          | User: text   | below file tile  |
| smc      | N         | 1 (all same)      | 1          | ResponseS      | file stem    | 1          | User: text   | below file tile  |
| smc      | N         | M                 | 1          | Response       | short prompt | 0          | User: text   | below file tile  |
## Functions implied by multi-file / multi-prompt table

- [x] finish implementation of perp N1 same
- [x] parser for new stock perplexity format
- [x] Get cites from both body and sources and merge, check inconsistencies
- [x] finish merging of perp and SMC code
- [x] deal with file types (perp vs. SMC)
	- [x] **Don't need to do this**: insist on all same type to avoid mixed header headaches?
	- [x]  how to specify type?
		- [x] need a variable in the code
		- [x] detect type 
			- either to autodetect or to verify that files are all the same type
			- I made an `is_smc...()` function
- [x] prompt same prompt (SMC or now, Perplexity too)
	- [x] need a variable in the code
	- [x] function to detect prompt similarity 
		- either to auto detect uniqueness or to verify)
- [x] detect if it is an smc multiprompt
- [x] Implemented
	- [x] Perp 11
	- [x] Perp N1 (same)
	- [x] Perp N1 (unique)
	- [x] Perp NM
	- [x] SMC 11
	- [x] SMC 1M
	- [x] SMC N1 unique
	- [x] SMC N1 all same
	- [x] SMC NM
- [ ] Relink an old perplexity output
	- avoid problem of new AI forgetting old links, thus losing context you might have wanted to keep
	- seems fairly easy

--- 

 **Header Structure Output Examples (notation from table above)**

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
