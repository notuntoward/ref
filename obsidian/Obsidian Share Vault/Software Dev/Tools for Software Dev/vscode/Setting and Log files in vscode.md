---
modified date: 2025-04-19T23:16:01-07:00
---
<img src="https://r2cdn.perplexity.ai/pplx-full-logo-primary-dark%402x.png" class="logo" width="120"/>
# Settings file
- %APPDATA%\Code\User\settings.json
## Where VS Code Stores Logs
### General VS Code Logs
- **Location by OS:**
    - **Windows:** `%AppData%\Code\logs`
    - **macOS:** `~/Library/Application Support/Code/logs/`
    - **Linux:** `~/.config/Code/logs`
- **How to Access:**
Use the Command Palette (`Ctrl+Shift+P` or `Cmd+Shift+P`) and search for:
    - `Developer: Open Logs Folder`
    - This opens the logs directory in your system's file explorer[^1].
### Extension and Output Logs
- **View in VS Code:**
Open the Output panel (`View &gt; Output`), then select the relevant log channel (e.g., Jupyter, Python, Extension Host) from the dropdown[^2].
- **Extension Logs Folder:**
Use the Command Palette and search for:
    - `Developer: Open Extension Logs Folder`
    - This opens the logs folder for extensions, which may contain logs for Jupyter, Python, or other extensions[^1].
### Python Debugger Logs
- **Location:**
When using the Python extension's debugger (`debugpy`), logs are stored inside the extension's installation directory:
    - **Windows:** `%USERPROFILE%\.vscode\extensions\ms-python.debugpy-*`
    - **macOS/Linux:** `~/.vscode/extensions/ms-python.debugpy-*`
- **Custom Log Directory:**
Set the `DEBUGPY_LOG_DIR` environment variable to direct logs to a custom folder[^4].
### Jupyter Logs
- Jupyter extension logs are typically available in the Output panel under the "Jupyter" channel.
- Some logs may also be written to the general or extension logs folder as above[^1][^2].
---
## How to Delete VS Code Logs
- **Manual Deletion:**
You can safely delete log files and folders from the locations above using your file explorer or command line. VS Code will recreate the necessary log folders as needed.
- **For Python Debugger Logs:**
Delete the relevant files from the `ms-python.debugpy-*` extension folder[^4].
- **For Jupyter and Other Extensions:**
Delete logs from the main logs directory or extension logs directory.
---
## Summary Table
output

| Log Type        | Default Location (Windows)                             | Default Location (macOS/Linux)                                      | How to Delete                 |
| :-------------- | :----------------------------------------------------- | :------------------------------------------------------------------ | :---------------------------- |
| General VS Code | `%AppData%\Code\logs`                                  | `~/Library/Application Support/Code/logs/` or `~/.config/Code/logs` | Delete files/folders directly |
| Extension Logs  | `%AppData%\Code\logs` or extension-specific dirs       | Same as above                                                       | Delete files/folders directly |
| Python Debugpy  | `%USERPROFILE%\.vscode\extensions\ms-python.debugpy-*` | `~/.vscode/extensions/ms-python.debugpy-*`                          | Delete files/folders directly |
| Jupyter Logs    | Output panel, extension logs folder                    | Output panel, extension logs folder                                 | Delete files/folders directly |

---

**Tip:**
Deleting these logs will not affect your settings or extensions. VS Code and its extensions will recreate log files as needed when restarted[^1][^4].

<div style="text-align: center">⁂</div>

[^1]: https://stackoverflow.com/questions/46373762/where-are-visual-studio-code-log-files

[^2]: https://stackoverflow.com/questions/44188262/where-are-the-vscode-error-logs-for-extensions

[^3]: https://learn.microsoft.com/en-us/visualstudio/ide/how-to-view-save-and-configure-build-log-files?view=vs-2022

[^4]: https://github.com/microsoft/debugpy/wiki/Enable-debugger-logs

[^5]: https://github.com/Microsoft/vscode/issues/69160

[^6]: https://docs.oracle.com/en/cloud/paas/application-integration/adapter-builder/view-vs-code-extension-logs.html

[^7]: https://code.visualstudio.com/docs/editor/Debugging

[^8]: https://www.reddit.com/r/vscode/comments/11486lu/where_are_project_files_for_vscode_locatedand_how/

[^9]: https://stackoverflow.com/questions/63974953/how-to-remove-or-stop-auto-generating-debug-log-file-in-vscode

[^10]: https://www.reddit.com/r/vscode/comments/kx7fkk/how_to_completely_delete_everything_related_to/

[^11]: https://answers.microsoft.com/en-us/windows/forum/all/vs-code-creating-debuglog-file-all-the-time/0b7640b2-7a22-40ad-b137-d255c90d43a4

[^12]: https://superuser.com/questions/1380208/how-to-completely-uninstall-visual-studio-code-from-windows-10

[^13]: https://code.visualstudio.com/docs/datascience/jupyter-kernel-management

[^14]: https://www.youtube.com/watch?v=DA6ZAHBPF1U

[^15]: https://learn.microsoft.com/en-us/fabric/data-engineering/setup-vs-code-extension

[^16]: https://github.com/microsoft/vscode-jupyter/issues/14459

[^17]: https://superuser.com/questions/1402681/remove-cached-conda-environments-in-vscode-for-python

[^18]: https://github.com/microsoft/vscode-jupyter/discussions/13031

[^19]: https://discourse.julialang.org/t/cannot-stop-active-code-in-jupyter-notebook-vscode/119663

[^20]: https://code.visualstudio.com/docs/python/settings-reference

[^21]: https://code.visualstudio.com/docs/python/linting

[^22]: https://www.youtube.com/watch?v=5Ziq9MxbvSs

[^23]: https://community.vcvrack.com/t/how-to-see-log-when-debugging-from-vscode/19837

[^24]: https://superuser.com/questions/1800042/how-can-i-remove-an-extension-for-a-vs-code-profile

[^25]: https://github.com/microsoft/pylance-release/discussions/6686

[^26]: https://askubuntu.com/questions/976093/how-do-i-uninstall-a-visual-studio-code-extension-without-using-the-gui

[^27]: https://www.ibm.com/docs/en/wdfrhcw/1.4.0?topic=t-troubleshooting-using-log-files

[^28]: https://dev.to/suhailkakar/remove-all-console-log-from-your-project-in-less-a-minutes-3glg

[^29]: https://dev.to/rajeshroyal/how-to-view-server-logs-in-real-time-in-vs-code-26he

[^30]: https://marketplace.visualstudio.com/items?itemName=davidgg00.remove-all-console-logs

[^31]: https://marketplace.visualstudio.com/items?itemName=TheMagicianDev.vsc-clean-output-log

[^32]: https://builtin.com/articles/vs-code-clear-cache

[^33]: https://github.com/microsoft/vscode-jupyter/issues/16430

[^34]: https://code.visualstudio.com/docs/datascience/jupyter-notebooks

[^35]: https://www.reddit.com/r/vscode/comments/n9xi3i/how_can_i_remove_jupyter_extension/

[^36]: https://code.visualstudio.com/docs/python/jupyter-support-py

[^37]: https://ncar-hpc-docs.readthedocs.io/en/latest/environment-and-software/vscode/

[^38]: https://code.visualstudio.com/docs/python/debugging

[^39]: https://www.reddit.com/r/vscode/comments/yl6vz8/vscode_extension_for_removing_print_statements/

[^40]: https://stackoverflow.com/questions/36746857/completely-uninstall-vs-code-extensions

[^41]: https://github.com/microsoft/vscode/issues/206256

