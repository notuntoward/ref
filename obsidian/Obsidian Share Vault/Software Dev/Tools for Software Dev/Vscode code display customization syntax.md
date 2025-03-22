---
created date: 2025-03-22T13:22:34-07:00
modified date: 2025-03-22T13:30:19-07:00
---

Some [[Vscode Color Themes]] are almost perfect, just need a little tweaking.  This is about the tweaking syntax.

List all the vscode "workbench.colorCustomizations" that affect how code is displayed: colors, weight, italics, etc.
## Perplexity Response
Based on the search results, here are the `workbench.colorCustomizations` that affect how code is displayed in VS Code:
## Color Customizations
- `editorError.foreground` - Controls the color of the wavy line beneath errors[^4]
- `editorWarning.foreground` - Controls the color of the wavy line beneath warnings[^4]
- `editorError.background` - Controls the highlight color of errors[^4]
- `editorWarning.background` - Controls the highlight color of warnings[^4]
- `sideBar.background` - Controls the background color of the sidebar[^1]
- `activityBar.background` - Can be customized for specific themes[^1]
- `diffEditor.removedTextBorder` - Can be reset to default value[^1]
## Font Style Customizations
These are applied using `editor.tokenColorCustomizations` rather than `workbench.colorCustomizations`:

You can customize font styles for specific code elements using the following pattern:

```json
- "editor.tokenColorCustomizations": {
  "[ThemeName]": {
    "textMateRules": [
      {
        "scope": "scope-name",
        "settings": {
          "fontStyle": "italic" // or "bold", "underline", etc.
        }
      }
    ]
  }
}
```

Common scopes that can be customized include:

- `emphasis` - For emphasized text[^2]
- `strong` - For strong text[^2]
- `entity.other.attribute-name` - For attributes[^2]
- `markup.underline` - For underlined text[^2]
- `markup.bold` - For bold text[^2]
- `markup.heading` - For headings[^2]
- `markup.italic` - For italic text[^2]
- `storage.type` - For type declarations[^2]
- `storage.modifier` - For modifiers[^2]
- `keyword.control` - For control keywords[^2]
- `variable.language` - For language variables like "this" or "self"[^2]
- `meta.decorator` - For decorators[^2]
- `punctuation.definition.comment` and `comment` - For comments[^2]
- Various punctuation elements for string interpolation[^2]
- Various keyword operators[^2]

You can apply these customizations to specific themes by naming them in brackets, or use wildcards like `[*Light*]` or `[*Dark*]` to apply to multiple themes[^1].
## Sources
<div style="text-align: center">⁂</div>
[^1]: https://code.visualstudio.com/docs/editor/themes

[^2]: https://dev.to/salted-bytes/adding-italics-support-to-your-favourite-vscode-theme-2ec9

[^3]: https://code.visualstudio.com/docs/getstarted/personalize-vscode

[^4]: https://code.visualstudio.com/docs/editor/accessibility

[^5]: https://stackoverflow.com/questions/41320848/how-do-i-get-visual-studio-code-to-display-italic-fonts-in-formatted-code

[^6]: https://stackoverflow.com/questions/45218663/use-workbench-colorcustomizations-in-extension

[^7]: https://www.reddit.com/r/vscode/comments/c3j2cb/how_to_display_all_workbench_default_color/

[^8]: https://vscode-docs1.readthedocs.io/en/latest/getstarted/theme-color-reference/

[^9]: https://www.youtube.com/watch?v=7DlZHZF7P3U

[^10]: https://www.youtube.com/watch?v=3EFwYdpEEuw

[^11]: https://code.visualstudio.com/api/references/theme-color

[^12]: https://vscode-docs1.readthedocs.io/en/latest/extensions/themes-snippets-colorizers/

[^13]: https://stackoverflow.com/questions/35165362/how-to-edit-default-dark-theme-for-visual-studio-code

[^14]: https://code.visualstudio.com/docs/editor/settings

[^15]: https://github.com/microsoft/vscode/issues/32579

[^16]: https://dev.to/umeshtharukaofficial/customizing-vscode-themes-icons-and-fonts-36b5

[^17]: https://gist.github.com/dcts/5b2af4c8b6918e7d35c4121f11d49fb1

[^18]: https://code.visualstudio.com/docs/terminal/appearance

[^19]: https://www.reddit.com/r/vscode/comments/nn2mll/customize_a_theme/

[^20]: https://stackoverflow.com/questions/72126817/configuring-the-font-style-of-vs-codes-inlay-hints

