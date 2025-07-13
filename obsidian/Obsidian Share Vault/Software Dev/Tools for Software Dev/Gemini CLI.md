---
created date: 2025-07-10T12:30:36-05:00
modified date: 2025-07-12T17:23:46-05:00
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

Once you have set up a Github Repo and UV with a basic setup like [[Software Dev/Tools for Software Dev/Gemini CLI.md#Set up a Github Repo and UV with Gemini |this one]], Gemini behaves much as you do when you are writing code in an editor.  When you have approved its proposals, it will:
- its changes will overwrite any existing, regardless of whether or not it is checked in
	- ? Is there a way to modify the prompt so that it will ensure checkin first?
- So, it's a good idea to check code in 
## Keeping UV Up to Date with Gemini
From: [Explain how to create a new gi...](https://www.perplexity.ai/search/explain-how-to-create-a-new-gi-QKnEnyGcRj.iWZU6ujlvmQ#9)

When you [[Software Dev/Tools for Software Dev/Gemini CLI.md#Set up a Github Repo and UV with Gemini |Set up a Github Repo and UV with Gemini]] with a prompt that requires `uv add`, then, as Gemini generates new Python files or requirements, *it may propose* to `add` new dependencies.  

Running `add` will automatically sync with the `.toml` lockfile, obviating the need to run `uv sync` in most cases:

**When still must run `uv sync`, even when you've `add` prompted**

| Scenario | Need to Run `uv sync`? |
| :-- | :--: |
| Only using `uv add` for dependencies | No |
| Manual edits to `pyproject.toml` or lockfile | Yes |
| Pulling dependency changes from version control | Yes |
| Recreating the virtual environment | Yes |

**In summary:**
If you and Gemini always use `uv add` for dependency management in your project, you typically will not need to run `uv sync` during normal development. However, you may still need it in situations where the environment gets out of sync with the lockfile, such as after manual edits or pulling changes from others.

