---
created date: 2025-01-03T14:39:01-06:00
modified date: 2025-01-03T15:53:33-06:00
---
[Pixi](https://github.com/prefix-dev/pixi) is a conda replacement that should be faster than conda, and should do better at [reproducibility](https://prefix.dev/blog/pixi_for_scientists).  Has [[#VSCode integrations|VSCode integrations]] that work with Jupyter Notebooks.

- The [Perplexity dialog](https://www.perplexity.ai/search/i-have-many-python-projects-wh-3.OhuMOMTqa2m.qdLMR4hw#15) that convinced me that it's worth moving to pixi
- Also: [7 Reasons to Switch from Conda to Pixi | prefix.dev](https://prefix.dev/blog/pixi_a_fast_conda_alternative)
- "replaces" homebrew, winget, etc. for installing rg, bash, etc.: See [this page and video](https://prefix.dev/blog/pixi_a_fast_conda_alternative)
- Installed packages are placed in a [hidden `.pixi` folder](https://prefix.dev/blog/pixi_a_fast_conda_alternative)
- [[#Pixie Package Operations|Pixie Package Operations]]
# Setup

## Install pixi

```
winget install prefix-dev.pixi
```
## Import existing conda env
From: [I have many python projects which I wrote using conda environments, with some...](https://www.perplexity.ai/search/i-have-many-python-projects-wh-3.OhuMOMTqa2m.qdLMR4hw#14)

```
pixi init --import ./myenv.yml
```

where myenv is a conda environment yaml environment
## Installing global environments, like node
From: [I have many python projects which I wrote using conda environments, with some...](https://www.perplexity.ai/search/i-have-many-python-projects-wh-3.OhuMOMTqa2m.qdLMR4hw#15)

```
pixi global install nodejs
```

# VSCode integrations
From here: https://stackoverflow.com/questions/79160156/how-to-use-a-pixi-virtual-environment-to-run-a-jupyter-notebook-in-vscode/79169334#79169334

- Use/install [Pixi VSCode](https://marketplace.visualstudio.com/items?itemName=jjjermiah.pixi-vscode) extension
- For Jupyter notebooks: [must do](https://stackoverflow.com/a/79169334/2591097) `pixi add ipykernel pip` yourself
# Pixie Package Operations
From: [I have many python projects which I wrote using conda environments, with some...](https://www.perplexity.ai/search/i-have-many-python-projects-wh-3.OhuMOMTqa2m.qdLMR4hw#17)
## Adding new package (conda and PyPi)

General adds
```
pixi add numpy                          # Install single package
pixi add numpy pandas "pytorch>=1.8"    # Install multiple packages with version constraints
pixi add --pypi requests               # Install from PyPI specifically
```

Special cases adds
```
pixi add --host "python>=3.9.0"        # Add host dependency
pixi add --build cmake                 # Add build dependency
pixi add --platform osx-64 package     # Platform-specific installation
```
## Updating

General updates
```
pixi update numpy                      # Update single package
pixi update numpy pandas              # Update multiple packages
pixi update --dry-run                 # Check what would be updated
pixi update                           # Update all packages
```

Platform-specific updates
```
pixi update --platform osx-arm64 mlx
pixi update -p linux-64 -p osx-64 numpy
```
## Removal

Basic removal
```
pixi remove numpy                      # Remove single package
pixi remove numpy pandas pytorch       # Remove multiple packages
pixi remove --pypi requests           # Remove PyPI package
```

Special removal
```
pixi remove --host python             # Remove host dependency
pixi remove --build cmake             # Remove build dependency
pixi remove --platform osx-64 package # Remove platform-specific package
```
