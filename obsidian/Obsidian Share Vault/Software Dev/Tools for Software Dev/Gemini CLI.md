---
created date: 2025-07-10T12:30:36-05:00
modified date: 2025-07-13T10:32:37-05:00
---
Google's new AI coding command line interface.
# Installing Gemini CLI
From: [Explain how to create a new gi...](https://www.perplexity.ai/search/explain-how-to-create-a-new-gi-QKnEnyGcRj.iWZU6ujlvmQ#0)
If you want to use Google's Gemini CLI for AI assistance in your terminal, here's how to install it[^15][^16]:
## Prerequisites
- Node.js 18 or higher (*install below*) [^17][^18]
- Google account for authentication[^15]
## Installation Steps
### Install Node.js
```bash
winget install OpenJS.NodeJS
```
### Install Gemini CLI
```bash
npm install -g @google/gemini-cli
```
### Launch Gemini CLI
```bash
gemini
```

4. **Authenticate** with your Google account when prompted[^16][^19].
The Gemini CLI provides AI assistance directly in your terminal, offering features like code generation, debugging help, and natural language command translation[^16][^20].
## Set up a Github Repo and UV with Gemini
From: [Explain how to create a new gi...](https://www.perplexity.ai/search/explain-how-to-create-a-new-gi-QKnEnyGcRj.iWZU6ujlvmQ#5)

In a Gemini CLI prompt ([[#Launch Gemini CLI]]), type something like this:
```
Create a new public GitHub repo called "my-uv-app", initialize a Python uv environment, and ensure all generated code uses and updates this environment.

For this project, always use `uv add` (not `uv pip install`) when installing dependencies.
```

This will create a repo in a subfolder of the Gemini `cwd`. You can specify a path for the repo by telling the prompt where to put it (I think).  Below, [Gemini will create](https://www.perplexity.ai/search/explain-how-to-create-a-new-gi-QKnEnyGcRj.iWZU6ujlvmQ#10) a standard python project structure, like this:
```
my-uv-app/
├── .git/                  # Git repository metadata
├── .venv/ or .uv/         # UV-managed virtual environment (often .venv or .uv)
├── pyproject.toml         # Project metadata and dependencies (managed by uv)
├── uv.lock                # Lockfile for reproducible installs
├── README.md              # Project documentation
├── src/ or my_uv_app/     # Source code directory
│   └── __init__.py
├── tests/                 # Test code (if requested)
│   └── test_basic.py
```
Although you can change it with a modified prompt, somehow.

Then, as you prompt Gemini CLI to generate code
*it will propose* and, with your approval, execute shell commands *such as*:
```bash
# Create repo and push
gh repo create my-uv-app --public --source=. --remote=origin --push

# Set up UV environment
cd my-uv-app
uv venv
```
You only need to approve such commands and Gemini will run them.
# Code Generation with Gemini

Once you have set up a Github Repo and UV with a basic setup like [[Software Dev/Tools for Software Dev/Gemini CLI.md#Set up a Github Repo and UV with Gemini |this one]], Gemini behaves much as you do when you are writing code in an editor.  

Much of this section applies to *either* Gemini CLI or Gemini Coding Assistant.

**When you have approved its proposals, it will:**
- its changes will overwrite any existing, regardless of whether or not it is checked in
	- ? Is there a way to modify the prompt so that it will ensure checkin first?
	- So, it's a good idea to check code in before you run a Gemini code operation
		- gemini will ask you to approve any code changes before overwriting, and will show you a diff
		- [diff will be side-by-side if your terminal is wide enough](https://www.perplexity.ai/search/explain-how-to-create-a-new-gi-QKnEnyGcRj.iWZU6ujlvmQ#14)
	- However, you can [[Software Dev/Tools for Software Dev/Gemini CLI.md#Customize Gemini's code overwrite behavior |Customize Gemini's code overwrite behavior]] via prompt, config files, or by subscription-based enterprise features.

- *will ignore manual edits* you've done, [unless you prompt it](https://www.perplexity.ai/search/explain-how-to-create-a-new-gi-QKnEnyGcRj.iWZU6ujlvmQ#11) e.g.
	```
	Review the current version of `main.py` before making changes
	```
	- [ ] Can this prompt be avoided using [[Software Dev/Tools for Software Dev/Gemini CLI.md#b. `.gemini/styleguide.md` |b. `.gemini/styleguide.md`]]
- You have to prompt Gemini to git commit or git push e.g.
```
	Commit all changes with the message 'Add weather endpoint.'
```
OR
```
	Push the latest commits to the remote repository.
```
## Customize Gemini's code overwrite behavior
You can **customize Gemini's code overwrite behavior** primarily through configuration files and clear prompt instructions. Here’s how you can exert control and tailor how Gemini handles code overwrites in your projects:
### 1. **Prompt-Based Control**
Gemini responds to explicit natural language instructions. You can include overwrite policies in your prompts, such as:

- “Before overwriting any file, always show me a diff and ask for confirmation.”
- “Never overwrite existing files; create a new version with a suffix instead.”
- “Only overwrite if the file has not been changed since the last commit.”

This approach works well for ad hoc sessions and single-use policies[^8].
### 2. **Repository-Level Configuration**
For persistent, project-wide customization, use Gemini Code Assist’s configuration system:
#### a. `.gemini/config.yaml`
This YAML file lets you set behaviors such as which files to ignore, and (in enterprise setups) can be expanded for more granular overwrite rules. While the public documentation focuses on code review and ignore patterns, you can use `ignore_patterns` to prevent Gemini from modifying certain files or directories[^4]:

```yaml
ignore_patterns:
  - "*.env"
  - "data/**"
  - "src/legacy_code/**"
```
#### b. `.gemini/styleguide.md`
This Markdown file can include custom rules and best practices, including instructions about overwriting files. For example:

> **Overwriting Policy:**
> - Always prompt before overwriting any file.
> - Never overwrite files in the `src/legacy_code/` directory.
> - If a file has been changed since the last commit, create a backup before overwriting.

Gemini will use these rules as part of its context when generating or modifying code[^4].
### 3. Best Practices for Overwrite Safety
- **Commit early, commit often:** Use git to checkpoint your code before major Gemini operations.
- **Review before approve:** Gemini typically previews changes and asks for confirmation before overwriting files.
- **Use ignore patterns:** Prevent accidental overwrites of sensitive or critical files by listing them in `.gemini/config.yaml`.
### 4. Enterprise \& Advanced Customization

If you’re using Gemini Code Assist with an Enterprise subscription, you can further refine overwrite and code generation behavior by:

- Connecting Gemini to your private repositories for context-aware recommendations[^3].
- Enforcing organization-wide style guides and overwrite policies through shared `.gemini/styleguide.md` files[^4].
### 5. Summary: Gemini overwrite customization

| Customization Method | How to Use | Effect |
| :-- | :-- | :-- |
| Prompt instructions | Add overwrite rules to your prompts | Immediate, session-based control |
| `.gemini/config.yaml` | Set ignore patterns or other config fields | Persistent, project-wide file protection |
| `.gemini/styleguide.md` | Document overwrite policies and best practices | Contextual guidance for code generation |
| Git version control | Commit before changes | Enables easy rollback of unwanted overwrites |

**In summary:**
You can customize Gemini’s code overwrite behavior by using clear prompt instructions, configuring `.gemini/config.yaml` and `.gemini/styleguide.md` in your repo, and leveraging git for safety. For the highest level of automation and enforcement, combine these approaches—especially in team or enterprise environments[^4][^8].
## Keeping UV Up to Date with Gemini
From: [Explain how to create a new gi...](https://www.perplexity.ai/search/explain-how-to-create-a-new-gi-QKnEnyGcRj.iWZU6ujlvmQ#9)

When you [[Software Dev/Tools for Software Dev/Gemini CLI.md#Set up a Github Repo and UV with Gemini |Set up a Github Repo and UV with Gemini]] with a prompt that requires `uv add`, then, as Gemini generates new Python files or requirements, *it may propose* to `add` new dependencies.  

Running `add` will automatically sync with the `.toml` lockfile, obviating the need to run `uv sync` in most cases:

**When still must run `uv sync`, even when you've `add` prompted**

| Scenario                                        | Need to Run `uv sync`? |
| :---------------------------------------------- | :--------------------: |
| Only using `uv add` for dependencies            |           No           |
| Manual edits to `pyproject.toml` or lockfile    |          Yes           |
| Pulling dependency changes from version control |          Yes           |
| Recreating the virtual environment              |          Yes           |

**In summary:**
If you and Gemini always use `uv add` for dependency management in your project, you typically will not need to run `uv sync` during normal development. However, you may still need it in situations where the environment gets out of sync with the lockfile, such as after manual edits or pulling changes from others.

# Gemini Code Assistant
The vscode (and others) extension for running Gemini from inside a code editor.  Is said to be more convenient than Gemini CLI, but not as flexible.  Some places say it can't do multi-file, etc. but other stuff suggests it can.
- [ ] Can Code Assistant operate across multiple files?

- must sign in w/ my "personal account": scottopersonal@gmail.com
	- [Free version doesn't work w/ my usual google workspace account](https://developers.google.com/gemini-code-assist/resources/faqs); must make a new "personal" google account to get it.

## Differences between Code Assistant and CLI
- [ ] ? CLI is more persistent unless Assistant uses styleguide.md or config.yaml?
