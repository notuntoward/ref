---
created date: 2025-04-21T15:07:16-07:00
modified date: 2025-04-21T15:07:16-07:00
---
<img src="https://r2cdn.perplexity.ai/pplx-full-logo-primary-dark%402x.png" class="logo" width="120"/>

# How does uv define a "top-level package?"

Based on the search results and the context of Python packaging, `uv` itself doesn't explicitly define "top-level package" in its documentation. Instead, this term relates to standard Python packaging conventions and how build tools like `setuptools` (which `uv` utilizes for building packages[^1]) interpret the project structure.

In the context of the "flat layout" error you encountered, a "top-level package" refers to a directory that:

1. Is located directly within the root directory of your project (the same level as your `pyproject.toml` file).
2. Contains an `__init__.py` file, marking it as a Python package discoverable via import statements.

The "flat layout" is problematic when multiple such package directories exist at the root level because `setuptools` cannot automatically determine which directories are intended to be part of the distributable package and which might be other code, tests, or temporary files[Previous Query]. This ambiguity leads to the error.

Contrastingly, the "src layout" avoids this by placing all package source code inside a dedicated `src` directory (e.g., `project_root/src/my_package/`)[^3]. When using `uv init --package`, this `src` layout is created by default, along with necessary build system configurations in `pyproject.toml`[^3]. This structure makes package discovery unambiguous for the build system.

<div style="text-align: center">⁂</div>

[^1]: https://docs.astral.sh/uv/guides/package/

[^2]: https://www.datacamp.com/tutorial/python-uv

[^3]: https://pybit.es/articles/developing-and-testing-python-packages-with-uv/

[^4]: https://www.saaspegasus.com/guides/uv-deep-dive/

[^5]: https://docs.astral.sh/uv/reference/cli/

[^6]: https://github.com/astral-sh/uv

[^7]: https://github.com/astral-sh/uv/issues/9703

[^8]: https://stackoverflow.com/questions/72294299/multiple-top-level-packages-discovered-in-a-flat-layout

