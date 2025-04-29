---
created date: 2025-04-19T19:47:55-07:00
modified date: 2025-04-21T18:43:33-07:00
---

Details about how uv works, etc.
# Setting up uv for vscode and juypyter notebooks
- Instructions from below came from [google ai studio](https://aistudio.google.com/app/prompts?state=%7B%22ids%22:%5B%221QdY10RxMNYvtg-YvErXs0tc53eN7HGxH%22%5D,%22action%22:%22open%22,%22userId%22:%22106663353829707201139%22,%22resourceKeys%22:%7B%7D%7D&usp=sharing).  
- Also see [[uv and vscode]]
## Setting Up a New `uv` Project for VS Code + Jupyter

This guide outlines the steps to initialize a new Python project using `uv`, install necessary dependencies for running Jupyter notebooks within VS Code, and configure the environment correctly.
### Prerequisites

-   **`uv` installed:** [[https://github.com/astral-sh/uv#installation|Install uv]].
-   **VS Code:** Your Integrated Development Environment.
-   **VS Code Extensions:**
    -   [[https://marketplace.visualstudio.com/items?itemName=ms-python.python|Python Extension]] (installed and enabled).
    -   [[https://marketplace.visualstudio.com/items?itemName=ms-toolsai.jupyter|Jupyter Extension]] (installed and enabled).
-   **`pyproject.toml`:** Your project configuration file, located in the project's root directory.  Actually you can get a hatchling .toml file by following steps here:  [[Software Dev/Tools for Software Dev/Package Management/uv package manager.md#always get a 'src layout' package |always get a 'src layout' package]]
### Setup Steps

1.  **Make your project directory**
   
- [[Software Dev/Tools for Software Dev/Package Management/uv package manager.md#always get a 'src layout' package |always get a 'src layout' package]]
  
1.  **Navigate to Project Root**
    Open your terminal and change to the directory containing your `pyproject.toml`.
    
    ```bash
    cd path/to/your/new_project
    ```
    
    If your .toml file user name as a `\` in it e.g. `"SP11_SDO\scott"` you'll need protect it like so: `SP11_SDO\\scott`
    
2. **Create Virtual Environment**
    Use `uv` to create an isolated environment named `.venv`. In your project root directory:
    
    ```bash
    uv venv
    ```
    
    This creates the `.venv` folder. ^kklk

3.  **Activate Virtual Environment**
    Activate the environment to use its tools. Your terminal prompt should change to indicate activation (e.g., showing `(.venv)`).

    -   **Windows (Command Prompt):**
        ```cmd
        .venv\Scripts\activate.bat
        ```
    -   **Windows (PowerShell):**
        ```powershell
        .venv\Scripts\Activate.ps1
        ```
        *(Note: You might need to adjust PowerShell execution policy: `Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser`)*
    -   **Linux / macOS / Git Bash on Windows:**
        ```bash
        source .venv/bin/activate
        ```

4.  **Prepare `pyproject.toml` for Jupyter**
    Ensure your `pyproject.toml` includes packages for Jupyter, preferably under `[project.optional-dependencies]`.

    *Example `pyproject.toml` additions:*
    ```toml
    # --- pyproject.toml ---

    [build-system]
    requires = ["setuptools>=61.0"]
    build-backend = "setuptools.build_meta"

    [project]
    name = "your_project_name"
    version = "0.1.0"
    requires-python = ">=3.9" # Example
    # ... other project metadata ...
    dependencies = [
        # ... your project's core dependencies like numpy, pandas ...
        # "numpy",
        # "pandas",
    ]

    [project.optional-dependencies]
    dev = [
        "ipykernel>=6.0",     # **Essential for Jupyter kernels**
        "jupyter>=1.0",       # Core Jupyter components & notebook format support
        "matplotlib",         # Common plotting library for notebooks
        # Add other dev tools if needed:
        # "ruff",
        # "pytest",
    ]

    # Needed if using `src` layout
    [tool.setuptools.packages.find]
    where = ["src"] # Or your source directory if different
    ```
    -   **`ipykernel` is crucial** for VS Code to recognize and use your environment as a Jupyter kernel.

5.  **Install Dependencies**
    Install your project and its dependencies (including the `dev` group) using `uv`. **Make sure the environment is active.**

    ```bash
    uv pip install -e .[dev]
    ```
    -   `uv pip install`: Command to install.
    -   `-e`: **Editable mode**. Links your source code (e.g., in `src/`) directly. Changes are reflected without reinstalling. Essential for development.
    -   `.`: Represents the current project directory.
    -   `[dev]`: Installs the optional dependencies listed under the `dev` group.

    *Alternative (if not using optional groups):*
    ```bash
    # Install project in editable mode
    uv pip install -e .
    # Install Jupyter tools separately
    uv pip install ipykernel jupyter matplotlib
    ```

6.  **Verify Installation**
    Check if key packages are present in the active environment.

    ```bash
    # Windows
    uv pip list | findstr "ipykernel jupyter your_project_name"

    # Linux / macOS / Git Bash
    uv pip list | grep -E "ipykernel|jupyter|your_project_name"
    ```
    *(Replace `your_project_name` with the name specified in your `pyproject.toml`)*

7.  **Configure VS Code**
    -   **Open Project Folder:** In VS Code, use `File > Open Folder...` to open the *root* directory of your project.
    -   **Select Python Interpreter:**
        -   Command Palette (`Ctrl+Shift+P` or `Cmd+Shift+P`) -> `Python: Select Interpreter`.
        -   Choose the interpreter inside your `.venv` (e.g., `Python 3.X.X ('.venv')`). VS Code usually detects this. If not, manually point it to `.venv/bin/python` or `.venv\Scripts\python.exe`.
    -   **Open/Create a Notebook (`.ipynb`):**
    -   **Select Kernel:** When the notebook opens, VS Code/Jupyter extension will prompt for a kernel (usually top-right). Select the one corresponding to your `.venv` environment.

### Result

You should now be able to:

-   Run Python scripts via the activated environment or `uv run your_script.py`.
-   Execute Jupyter notebooks (`.ipynb` files) within VS Code, using the kernel tied to your project's `.venv`.
-   Import your own project modules (e.g., `import your_project_name`) in both scripts and notebooks, thanks to the **editable install (`-e`)**.
# Single Top-level Package description
Started from: [perplexity](https://www.perplexity.ai/search/explain-the-error-below-why-do-qR2LuAQhQmq7jleevaZnnA#1)

`uv` requires that your project have only a single [[Software Dev/Tools for Software Dev/Package Management/uv package manager.md#top-level package |top-level package]], a restriction originating int the standard python `setuptools` package builder.  I think the idea is to prevent developers from accidentally putting into a public package private or test code that might be lying around in the vicinity of the code you meant to distribute. 

`uv` wants to see a `src layout` where the only [[Software Dev/Tools for Software Dev/Package Management/uv package manager.md#top-level package |top-level package]] is a `src` directory i.e. `project_root/src/my_package`.

If you have more than top level package, you have a prohibited `flat layout`, and when you try to init a `uv` environment in this situation, you'll get an error message.

You can use `uv` to ensure that you [[Software Dev/Tools for Software Dev/Package Management/uv package manager.md#always get a 'src layout' package |always get a 'src layout' package]].
## top-level package

**Definition**: A `top-level package` refers to a *directory* that:

1. Is located directly within the root directory of your project (the same level as your `pyproject.toml` file).
2. Contains an `__init__.py` file, marking it as a Python package discoverable via import statements.

So, `project_root/src/tests` or `project_root/src/notebooks` directories are OK, as long as they don't contain a `__init__.py`. 
## always get a 'src layout' package
In an empty directory with the name of your package-to-be, say `project_name`, run:

	uv init --packagerepos/refwrangle/

and `uv` it will make `.toml` file, `src` directories and other stuff.  

This will make for:

	project_name\src\project_name
	
and

	project_name\src\project_name\__init__.py

and some other standard files.  This can be initialized by running ` uv venv` and further commands.  See [[Software Dev/Tools for Software Dev/Package Management/uv package manager.md#Setup Steps |Setup Steps]]

# Populating a bare new venv

First, do [[#always get a 'src layout' package]], then [[Software Dev/Tools for Software Dev/Package Management/uv package manager.md#^kklk|create a virtual environment]].  

Install python:

```
uv python install 3.12.5
```

### Getting packages from hierarchy of files.
If you got .py or .ipynb files you want to be in this package, you can collect them using my `collect_pip_installs.py`.  At one point, the command for this was:

```
uv run repos/refwrangle/src/utils/collect_pip_installs.py --output package_names.txt
```

Then install them into the `uv` environment with 

```
uv add -r package_names.txt
```

You might need to delete some packages because of unsolvable version numbers.  Fore example, for refwrangle, I had to remove `bottle` and `servicemanager` for python 3.12.5

# Also
- See [[uv and vscode]]
- alternative: [[Pixi Package Manager]]

