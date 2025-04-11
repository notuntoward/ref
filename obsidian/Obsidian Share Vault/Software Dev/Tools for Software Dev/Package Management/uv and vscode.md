---
created date: 2025-04-11T12:24:35-07:00
modified date: 2025-04-11T12:24:35-07:00
---
# How can I run jupyter notebooks inside of vscode when I'm using the uv package manager...
Exported on 11/04/2025 at 12:23:19 [from Perplexity.ai](https://www.perplexity.ai/search/how-can-i-run-jupyter-notebook-GVKaoQXHTGiwFC7ASj92tA) - with [SaveMyChatbot](https://save.hugocollin.com)


## User
how can I run jupyter notebooks inside of vscode when I'm using the uv package manager

## AI answer
To run Jupyter Notebooks inside Visual Studio Code (VS Code) using the `uv` package manager, follow these steps:

**1\. Install Required Dependencies**
-------------------------------------

Ensure that the necessary packages are installed in your `uv`\-managed project environment:

1.  **Initialize a Project** (if not already done):
    
    ```bash
    uv init project
    cd project
    ```
    
2.  **Add Jupyter and ipykernel**:
    
    ```bash
    uv add --dev jupyter ipykernel
    ```
    
3.  **Optional:** If you need to manipulate the environment from within the notebook, add `uv` as a development dependency:
    
    ```bash
    uv add --dev uv
    ```
    

**2\. Create a Jupyter Kernel for Your Project**
------------------------------------------------

To ensure that the Jupyter Notebook uses the correct environment, create a kernel for your project:

1.  Install `ipykernel` (if not already done):
    
    ```bash
    uv add --dev ipykernel
    ```
    
2.  Create the kernel:
    
    ```bash
    uv run ipython kernel install --user --name=project-kernel
    ```
    

This creates a kernel named `project-kernel`, which you can select in VS Code.

**3\. Open Your Project in VS Code**
------------------------------------

1.  Launch VS Code from your project directory:
    
    ```bash
    code .
    ```
    
2.  Install the **Jupyter Extension** in VS Code, if not already installed:
    
    *   Go to the Extensions view (`Ctrl+Shift+X` or `Cmd+Shift+X` on macOS).
        
    *   Search for "Jupyter" and install it.
        
3.  Create or open a `.ipynb` file:
    
    *   Use the command palette (`Ctrl+Shift+P` or `Cmd+Shift+P`) and select **"Create: New Jupyter Notebook"**.
        

**4\. Select the Correct Kernel**
---------------------------------

When prompted to select a kernel, choose the one corresponding to your project's virtual environment (e.g., `project-kernel`). If not automatically detected, manually navigate to `.venv/bin/python` (Linux/macOS) or `.venv\Scripts\python.exe` (Windows).

**5\. Run Jupyter Commands Inside Notebooks**
---------------------------------------------

You can manage dependencies directly within your notebook using shell commands:

*   To add a package as a project dependency:
    
    ```python
    !uv add pandas
    ```
    
*   To install a package without persisting it in `pyproject.toml`:
    
    ```python
    !uv pip install matplotlib
    ```
    

**6\. Troubleshooting Kernel Issues**
-------------------------------------

If you encounter issues with kernels not connecting:

*   Ensure that the `.venv` directory is correctly set up and contains Python and Jupyter.
    
*   Verify that the correct Python interpreter is selected in VS Code.
    
*   Restart VS Code after making changes to dependencies or environments.
    

For more advanced use cases, you can also use `uvx` commands for prototyping or running Jupyter independently of a project context:

```bash
uvx jupyter lab
```

This approach ensures seamless integration of `uv`, Jupyter, and VS Code [1](https://docs.astral.sh/uv/guides/integration/jupyter/) [3](https://flocode.substack.com/p/044-python-environments-again-uv) [4](https://code.visualstudio.com/docs/datascience/jupyter-notebooks) [6](https://github.com/astral-sh/uv/issues/6672).

---
**Sources:**
- (1) Astral Docs
- (2) youtube
- (3) Flocode: Engineering Insights
- (4) Microsoft
- (5) reddit
- (6) GitHub
- (7) Jupyter Community Forum
- (8) reddit
- (9) youtube
- (10) stackoverflow
- (11) reddit
- (12) Stack Overflow


