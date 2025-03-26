---
created date: 2024-12-17T08:51:31-08:00
modified date: 2025-03-24T19:30:05-07:00
---
- Python lib for colormaps of different types: [scicomap](https://github.com/ThomasBury/scicomap)
# Perplexity answers
## Color Picking Websites
Find me a good html color picking tool or web that suggests color tables with a selectable and variable number of colors.  The three types of tables I'm looking for are:
1. Colors in a theme that are distiguishable but connote gradual icreases in properties like "magnitude," "size", "importance"
2. maximally disnguishable colors that aren't ugly together
3. color combinations that just look good
Based on your requirements, here are several excellent color picking tools that can help you create the specific types of color palettes you're looking for:
### Tools for Sequential/Gradient Color Palettes
#### Super Color Palette
Super Color Palette allows you to generate color palettes by shifting hue, saturation, lightness, and more. It's particularly useful for creating sequential palettes that show gradual increases in properties ==[1](https://supercolorpalette.com)==.
- Supports up to 24 colors in a palette
- Offers shift color properties to create gradual changes
- Includes various color harmonies
- 100% free without ads
#### Paletton
Paletton is a comprehensive color scheme designer that lets you create color combinations using classical color theory ==[10](https://paletton.com)==.
- Creates palettes of one to four hues, each with five different shades
- Offers monochromatic to tetrad color sets
- Allows adjustment of brightness and saturation
- Includes vision simulation filters for accessibility testing
### Tools for Maximally Distinguishable Colors
#### Visually Distinct Colors Generator
This tool specifically builds subsets of colors where each color is visually the most distinct possible from every other color in the set ==[11](https://mokole.com/palette.html)==.
- Filters colors based on minimum and maximum luminosity
- Uses CIE Lab color space for perceptive distance
- Ranks palettes by minimal pairwise distance between colors
#### MATLAB's Perceptually-Distinct Colors
While this is a MATLAB function, it demonstrates the concept of generating maximally perceptually-distinct colors by using the Lab color space, which more closely matches human color perception than RGB ==[5](https://www.mathworks.com/matlabcentral/fileexchange/29702-generate-maximally-perceptually-distinct-colors)==.
### Tools for Aesthetically Pleasing Color Combinations
#### WebFX Color Picker
This free HTML color selector allows you to generate cohesive, harmonious color schemes using complementary, triade, tetrade, and analogic options ==[2](https://www.webfx.com/web-design/color-picker)==.
- Manually adjust HEX codes, HSB, and RGB values
- Save preferred colors to a palette
- Fine-tune your color selection with precision
#### Infogram's Color Guide
Infogram offers guidance on selecting the right type of color palette for different visualization needs ==[4](https://infogram.com/blog/best-colors-for-charts)==:
- Sequential palettes for ordered data
- Diverging palettes for data with a meaningful midpoint
- Categorical palettes for distinct categories
#### Color Hex
Color Hex provides a collection of almost 40,000 color palettes that you can use in your projects ==[13](https://digitalsynopsis.com/design/beautiful-color-palettes-combinations-schemes)==.
- Copy hex codes directly
- Download PNG versions of each palette
- Browse through numerous pre-made beautiful color combinations
### Accessible Color Options
#### Venngage's Accessible Color Palette Generator
This tool ensures your color choices are accessible to people with visual impairments by focusing on contrast ratios that meet WCAG compliance standards ==[6](https://venngage.com/tools/accessible-color-palette-generator)==.
- Helps choose colors with maximum contrast
- Considers color blindness in palette creation
- Follows WCAG 2.1 requirements for contrast ratios
Each of these tools offers unique features that can help you create the specific types of color palettes you're looking for, whether you need sequential colors to show gradation, maximally distinguishable colors for categorical data, or simply beautiful color combinations for your design projects.

## Color Picking in Python

Now pick the same but python libraries that can do this.
Based on the search results, here are Python libraries that can help you create color palettes with varying properties:
### Sequential/Gradient Color Palettes
#### Seaborn
Seaborn provides several options for creating sequential color palettes that show gradual increases in properties:
- Built-in perceptually uniform sequential colormaps: `"rocket"`, `"mako"`, `"flare"`, and `"crest"` ==[1](https://seaborn.pydata.org/tutorial/color_palettes.html)==
- `light_palette()` and `dark_palette()` functions to create custom sequential palettes from a single color ==[1](https://seaborn.pydata.org/tutorial/color_palettes.html)==
- Cubehelix palettes with linear increase/decrease in brightness and continuous variation in hue ==[1](https://seaborn.pydata.org/tutorial/color_palettes.html)==
- Color Brewer sequential palettes with single or multi-hue options ==[1](https://seaborn.pydata.org/tutorial/color_palettes.html)==
#### PyPalettes
A comprehensive library offering access to 2500+ color palettes ==[6](https://python-graph-gallery.com/color-palette-finder)== ==[7](https://python-graph-gallery.com/python-colors)==:
- Simple API: `from pypalettes import load_cmap; cmap = load_cmap("Acadia")` ==[7](https://python-graph-gallery.com/python-colors)==
- Compatible with Matplotlib for easy integration into visualizations ==[6](https://python-graph-gallery.com/color-palette-finder)==
- Includes palettes from paleteer, Matplotlib, and Seaborn ==[6](https://python-graph-gallery.com/color-palette-finder)==
### Maximally Distinguishable Colors
#### Distinctipy
A specialized library for generating visually distinct colors ==[4](https://distinctipy.readthedocs.io/en/latest/usage.html)== ==[8](https://pypi.org/project/distinctipy)==:
- `get_colors(N)` generates N visually distinct colors ==[8](https://pypi.org/project/distinctipy)==
- `get_colors(N, existing_colors)` generates colors distinct from existing ones ==[8](https://pypi.org/project/distinctipy)==
- Supports pastel color generation with `pastel_factor` parameter ==[4](https://distinctipy.readthedocs.io/en/latest/usage.html)== ==[8](https://pypi.org/project/distinctipy)==
- Includes colorblind-friendly options: `get_colors(N, colorblind_type="Deuteranomaly")` ==[8](https://pypi.org/project/distinctipy)==
- Provides visualization tools like `color_swatch(colors)` ==[4](https://distinctipy.readthedocs.io/en/latest/usage.html)== ==[8](https://pypi.org/project/distinctipy)==
#### Visually Distinct Colors Generator
While not a Python library itself, the approach described can be implemented using:
- CIE Lab color space for perceptual distance calculations ==[5](https://mokole.com/palette.html)==
- Filtering by minimum and maximum luminosity ==[5](https://mokole.com/palette.html)==
- Ranking palettes by minimal pairwise distance between colors ==[5](https://mokole.com/palette.html)==
### Aesthetically Pleasing Color Combinations
#### Pylettes
A lightweight Matplotlib-compatible collection of beautiful palettes ==[9](https://github.com/fcomitani/pylettes)==:
- Easy installation via pip: `pip install pylettes` ==[9](https://github.com/fcomitani/pylettes)==
- Direct access to individual colors by index ==[9](https://github.com/fcomitani/pylettes)==
- Visualization methods: `show_colors()` and `show_colors(continuous=True)` ==[9](https://github.com/fcomitani/pylettes)==
- Search palettes by keywords using `list_palettes_by_tag()` ==[9](https://github.com/fcomitani/pylettes)==
- View multiple palettes with `show_multiple_palettes()` ==[9](https://github.com/fcomitani/pylettes)==
#### Color-Palette Generator
A Python application that offers:
- Random color palette generation ==[2](https://github.com/kadarisadhvika903/color-palette-generator)==
- Light and dark shades of particular colors using Seaborn ==[2](https://github.com/kadarisadhvika903/color-palette-generator)==
- Image-based palette generation using K-means clustering ==[2](https://github.com/kadarisadhvika903/color-palette-generator)==
- PyQt5-based graphical interface ==[2](https://github.com/kadarisadhvika903/color-palette-generator)==
These libraries provide comprehensive solutions for all three types of color palettes you're looking for, with options for sequential/gradient colors, maximally distinguishable colors, and aesthetically pleasing combinations.
<div style="text-align: center">⁂</div>
# Sources 1
==([1](https://seaborn.pydata.org/tutorial/color_palettes.html)) https://seaborn.pydata.org/tutorial/color_palettes.html ==
==([2](https://github.com/kadarisadhvika903/color-palette-generator)) https://github.com/kadarisadhvika903/color-palette-generator ==
([3](https://how.dev/answers/how-to-make-a-circular-color-gradient-in-python)) https://how.dev/answers/how-to-make-a-circular-color-gradient-in-python
==([4](https://distinctipy.readthedocs.io/en/latest/usage.html)) https://distinctipy.readthedocs.io/en/latest/usage.html ==
==([5](https://mokole.com/palette.html)) https://mokole.com/palette.html ==
==([6](https://python-graph-gallery.com/color-palette-finder)) https://python-graph-gallery.com/color-palette-finder ==
==([7](https://python-graph-gallery.com/python-colors)) https://python-graph-gallery.com/python-colors ==
==([8](https://pypi.org/project/distinctipy)) https://pypi.org/project/distinctipy ==
==([9](https://github.com/fcomitani/pylettes)) https://github.com/fcomitani/pylettes ==
([10](https://www.reddit.com/r/python/comments/1gzdra0/generate_a_gradient_between_2_colors_in_python)) https://www.reddit.com/r/python/comments/1gzdra0/generate_a_gradient_between_2_colors_in_python
([11](https://stackoverflow.com/questions/25668828/how-to-create-colour-gradient-in-python)) https://stackoverflow.com/questions/25668828/how-to-create-colour-gradient-in-python
([12](https://krita-artists.org/t/palette-generator/55225)) https://krita-artists.org/t/palette-generator/55225
([13](https://github.com/bsouthga/blog/blob/master/public/posts/color-gradients-with-python.md)) https://github.com/bsouthga/blog/blob/master/public/posts/color-gradients-with-python.md
([14](https://matplotlib.org/stable/users/explain/colors/colormaps.html)) https://matplotlib.org/stable/users/explain/colors/colormaps.html
([15](https://www.youtube.com/watch?v=hb9nrfwz46y)) https://www.youtube.com/watch?v=hb9nrfwz46y
([16](https://seaborn.pydata.org/generated/seaborn.color_palette.html)) https://seaborn.pydata.org/generated/seaborn.color_palette.html
([17](https://www.reddit.com/r/python/comments/dmzs6s/i_created_a_python_script_to_generate_color)) https://www.reddit.com/r/python/comments/dmzs6s/i_created_a_python_script_to_generate_color
([18](https://r02b.github.io/seaborn_palettes)) https://r02b.github.io/seaborn_palettes
([19](https://docs.bokeh.org/en/latest/docs/reference/palettes.html)) https://docs.bokeh.org/en/latest/docs/reference/palettes.html
([20](https://github.com/thomasbury/scicomap)) https://github.com/thomasbury/scicomap
([21](https://pypi.org/project/colors-accessibility)) https://pypi.org/project/colors-accessibility
([22](https://stackoverflow.com/questions/42697933/colormap-with-maximum-distinguishable-colours)) https://stackoverflow.com/questions/42697933/colormap-with-maximum-distinguishable-colours
([23](https://stackoverflow.com/questions/470690/how-to-automatically-generate-n-distinct-colors)) https://stackoverflow.com/questions/470690/how-to-automatically-generate-n-distinct-colors
([24](https://stackoverflow.com/questions/45958519/contrasting-color-palette-in-python)) https://stackoverflow.com/questions/45958519/contrasting-color-palette-in-python
([25](http://medialab.github.io/iwanthue)) http://medialab.github.io/iwanthue
([26](https://pypi.org/project/colour-science)) https://pypi.org/project/colour-science
([27](https://plotly.com/python/colorscales)) https://plotly.com/python/colorscales
([28](https://python-graph-gallery.com/92-control-color-in-seaborn-heatmaps)) https://python-graph-gallery.com/92-control-color-in-seaborn-heatmaps
([29](https://www.mathworks.com/matlabcentral/fileexchange/29702-generate-maximally-perceptually-distinct-colors?s_tid=fx_rc2_behav)) https://www.mathworks.com/matlabcentral/fileexchange/29702-generate-maximally-perceptually-distinct-colors?s_tid=fx_rc2_behav
([30](https://graphicdesign.stackexchange.com/questions/158777/how-to-pick-32-distinct-colors-for-map-drawing)) https://graphicdesign.stackexchange.com/questions/158777/how-to-pick-32-distinct-colors-for-map-drawing
([31](https://hauselin.github.io/colorpalettejs)) https://hauselin.github.io/colorpalettejs
([32](https://coolors.co)) https://coolors.co
([33](https://www.reddit.com/r/python/comments/336o8m/what_is_the_best_most_aesthetically_pleasing)) https://www.reddit.com/r/python/comments/336o8m/what_is_the_best_most_aesthetically_pleasing
([34](https://loading.io/color/feature/python)) https://loading.io/color/feature/python
([35](https://stackoverflow.com/questions/876853/generating-color-ranges-in-python)) https://stackoverflow.com/questions/876853/generating-color-ranges-in-python
([36](http://stackoverflow.com/questions/32059359/how-to-create-an-rgb-rainbow-gradient-in-python-2-7/32080147)) http://stackoverflow.com/questions/32059359/how-to-create-an-rgb-rainbow-gradient-in-python-2-7/32080147
([37](https://plotly.com/python/builtin-colorscales)) https://plotly.com/python/builtin-colorscales
([38](https://github.com/zugbahnhof/color-contrast)) https://github.com/zugbahnhof/color-contrast
([39](https://github.com/taketwo/glasbey)) https://github.com/taketwo/glasbey
([40](https://github.com/thibaudcolas/kontrasto)) https://github.com/thibaudcolas/kontrasto
([41](https://www.zeileis.org/news/python_colorspace)) https://www.zeileis.org/news/python_colorspace
([42](https://colorcet.holoviz.org)) https://colorcet.holoviz.org
([43](https://stackoverflow.com/questions/43044/algorithm-to-randomly-generate-an-aesthetically-pleasing-color-palette)) https://stackoverflow.com/questions/43044/algorithm-to-randomly-generate-an-aesthetically-pleasing-color-palette
([44](https://stackoverflow.com/questions/15814635/prettier-default-plot-colors-in-matplotlib)) https://stackoverflow.com/questions/15814635/prettier-default-plot-colors-in-matplotlib
# Sources 2
==([1](https://supercolorpalette.com)) https://supercolorpalette.com ==
==([2](https://www.webfx.com/web-design/color-picker)) https://www.webfx.com/web-design/color-picker ==
([3](https://www.datylon.com/blog/a-guide-to-data-visualization-color-palette)) https://www.datylon.com/blog/a-guide-to-data-visualization-color-palette
==([4](https://infogram.com/blog/best-colors-for-charts)) https://infogram.com/blog/best-colors-for-charts ==
==([5](https://www.mathworks.com/matlabcentral/fileexchange/29702-generate-maximally-perceptually-distinct-colors)) https://www.mathworks.com/matlabcentral/fileexchange/29702-generate-maximally-perceptually-distinct-colors ==
==([6](https://venngage.com/tools/accessible-color-palette-generator)) https://venngage.com/tools/accessible-color-palette-generator ==
([7](https://looka.com/blog/color-combinations)) https://looka.com/blog/color-combinations
([8](https://www.twelveandtwentyeight.com/blog/10-aesthetic-color-palettes)) https://www.twelveandtwentyeight.com/blog/10-aesthetic-color-palettes
([9](https://appmaster.io/blog/25-appealing-color-combinations-for-your-next-design)) https://appmaster.io/blog/25-appealing-color-combinations-for-your-next-design
==([10](https://paletton.com)) https://paletton.com ==
==([11](https://mokole.com/palette.html)) https://mokole.com/palette.html ==
([12](https://designwizard.com/blog/colour-combination)) https://designwizard.com/blog/colour-combination
==([13](https://digitalsynopsis.com/design/beautiful-color-palettes-combinations-schemes)) https://digitalsynopsis.com/design/beautiful-color-palettes-combinations-schemes ==
([14](https://webflow.com/blog/best-color-combinations)) https://webflow.com/blog/best-color-combinations
([15](https://www.pyngl.ucar.edu/graphics/create_color_table.shtml)) https://www.pyngl.ucar.edu/graphics/create_color_table.shtml
([16](https://github.com/daattali/colourpicker)) https://github.com/daattali/colourpicker
([17](https://www.reddit.com/r/web_design/comments/136gdjq/any_tools_that_allow_generating_a_color_palette)) https://www.reddit.com/r/web_design/comments/136gdjq/any_tools_that_allow_generating_a_color_palette
([18](https://www.canva.com/graphs/tables)) https://www.canva.com/graphs/tables
([19](https://fffuel.co/cccolor)) https://fffuel.co/cccolor
([20](https://coolors.co)) https://coolors.co
([21](https://developer.mozilla.org/en-us/docs/web/html/element/input/color)) https://developer.mozilla.org/en-us/docs/web/html/element/input/color
([22](https://mycolor.space)) https://mycolor.space
([23](https://htmlcolorcodes.com/color-picker)) https://htmlcolorcodes.com/color-picker
([24](https://color.adobe.com/create/color-wheel)) https://color.adobe.com/create/color-wheel
([25](https://www.w3schools.com/colors/colors_picker.asp)) https://www.w3schools.com/colors/colors_picker.asp
([26](https://www.canva.com/colors/color-palette-generator)) https://www.canva.com/colors/color-palette-generator
([27](https://coolors.co/palettes/gradient)) https://coolors.co/palettes/gradient
([28](https://www.southernliving.com/home/colors/paint-colors-that-increase-home-value)) https://www.southernliving.com/home/colors/paint-colors-that-increase-home-value
([29](https://www.heavy.ai/blog/12-color-palettes-for-telling-better-stories-with-your-data)) https://www.heavy.ai/blog/12-color-palettes-for-telling-better-stories-with-your-data
([30](https://coolors.co/palettes/trending/gradient)) https://coolors.co/palettes/trending/gradient
([31](https://shiftersmovers.com/best-color-schemes-house-interior-in-2025-0799922285)) https://shiftersmovers.com/best-color-schemes-house-interior-in-2025-0799922285
([32](https://www.ablebits.com/office-addins-blog/color-scales-excel)) https://www.ablebits.com/office-addins-blog/color-scales-excel
([33](https://app.uxcel.com/glossary/color-palette)) https://app.uxcel.com/glossary/color-palette
([34](https://offeo.com/learn/rustic-color-palette)) https://offeo.com/learn/rustic-color-palette
([35](https://www.simplifiedsciencepublishing.com/resources/best-color-palettes-for-scientific-figures-and-data-visualizations)) https://www.simplifiedsciencepublishing.com/resources/best-color-palettes-for-scientific-figures-and-data-visualizations
([36](https://learnui.design/tools/data-color-picker.html)) https://learnui.design/tools/data-color-picker.html
([37](https://www.dunnedwards.com/pros/blog/popular-color-palettes-through-the-decades-1920s-1960s)) https://www.dunnedwards.com/pros/blog/popular-color-palettes-through-the-decades-1920s-1960s
([38](https://support.microsoft.com/en-us/office/use-data-bars-color-scales-and-icon-sets-to-highlight-data-f118d0a6-5921-4e2e-905b-fe00f3378fb9)) https://support.microsoft.com/en-us/office/use-data-bars-color-scales-and-icon-sets-to-highlight-data-f118d0a6-5921-4e2e-905b-fe00f3378fb9
([39](https://ux.stackexchange.com/questions/95706/colour-palette-progression-to-indicate-priority)) https://ux.stackexchange.com/questions/95706/colour-palette-progression-to-indicate-priority
([40](https://www.reddit.com/r/coolguides/comments/l4fpke/a_guide_to_common_clothing_color_combinations)) https://www.reddit.com/r/coolguides/comments/l4fpke/a_guide_to_common_clothing_color_combinations
([41](https://github.com/taketwo/glasbey)) https://github.com/taketwo/glasbey
([42](https://approval.studio/blog/worst-color-combinations)) https://approval.studio/blog/worst-color-combinations
([43](https://www.atlassian.com/data/charts/how-to-choose-colors-data-visualization)) https://www.atlassian.com/data/charts/how-to-choose-colors-data-visualization
([44](https://makeartthatsells.com/make-beautiful-color-palettes-ugly-colors)) https://makeartthatsells.com/make-beautiful-color-palettes-ugly-colors
([45](https://coolors.co/palettes/popular/contrast)) https://coolors.co/palettes/popular/contrast
([46](https://www.mathworks.com/matlabcentral/fileexchange/70215-maximally-distinct-color-generator)) https://www.mathworks.com/matlabcentral/fileexchange/70215-maximally-distinct-color-generator
([47](https://www.creatopy.com/blog/social-media-color-inspiration)) https://www.creatopy.com/blog/social-media-color-inspiration
([48](https://color-contrast-checker.deque.com)) https://color-contrast-checker.deque.com
([49](http://medialab.github.io/iwanthue)) http://medialab.github.io/iwanthue
([50](https://www.ggunn.com/blog/how-to-not-suck-at-color)) https://www.ggunn.com/blog/how-to-not-suck-at-color
([51](https://www.adobe.com/express/learn/blog/101-brilliant-color-combinations)) https://www.adobe.com/express/learn/blog/101-brilliant-color-combinations
([52](https://coolors.co/palettes/popular/aesthetic)) https://coolors.co/palettes/popular/aesthetic
([53](https://99designs.com/blog/creative-inspiration/color-combinations)) https://99designs.com/blog/creative-inspiration/color-combinations
([54](https://www.canva.com/colors/color-wheel)) https://www.canva.com/colors/color-wheel
([55](https://www.pinterest.com/craftyrunner04/aesthetic-colors)) https://www.pinterest.com/craftyrunner04/aesthetic-colors
([56](https://visme.co/blog/website-color-schemes)) https://visme.co/blog/website-color-schemes
([57](https://www.color-hex.com/color-palette/4628)) https://www.color-hex.com/color-palette/4628
([58](https://www.tailorbrands.com/blog/logo-color-combinations)) https://www.tailorbrands.com/blog/logo-color-combinations
([59](https://www.reddit.com/r/interiordesign/comments/1bqhaa3/color_palette_base_and_aesthetic_colors)) https://www.reddit.com/r/interiordesign/comments/1bqhaa3/color_palette_base_and_aesthetic_colors
([60](https://www.canva.com/learn/100-color-combinations)) https://www.canva.com/learn/100-color-combinations
([61](https://www.canva.com/colors/color-palettes)) https://www.canva.com/colors/color-palettes
([62](https://www.figma.com/resource-library/color-combinations)) https://www.figma.com/resource-library/color-combinations
([63](https://www.pinterest.com/marimoon/aesthetic-color-palette)) https://www.pinterest.com/marimoon/aesthetic-color-palette
([64](https://www.w3schools.com/tags/att_input_type_color.asp)) https://www.w3schools.com/tags/att_input_type_color.asp
([65](https://ninjatables.com/docs/table-color-settings)) https://ninjatables.com/docs/table-color-settings
([66](https://help.tableau.com/current/pro/desktop/en-us/formatting_create_custom_colors.htm)) https://help.tableau.com/current/pro/desktop/en-us/formatting_create_custom_colors.htm
([67](https://developer.mozilla.org/en-us/docs/web/css/css_colors/color_picker_tool)) https://developer.mozilla.org/en-us/docs/web/css/css_colors/color_picker_tool
([68](https://colorkit.co/color-palette-generator)) https://colorkit.co/color-palette-generator
([69](https://www.datanovia.com/en/blog/top-r-color-palettes-to-know-for-great-data-visualization)) https://www.datanovia.com/en/blog/top-r-color-palettes-to-know-for-great-data-visualization
([70](https://www.thisoldhouse.com/painting/21017992/choose-paint-colors-with-a-color-wheel)) https://www.thisoldhouse.com/painting/21017992/choose-paint-colors-with-a-color-wheel
([71](https://academy.datawrapper.de/article/140-what-to-consider-when-choosing-colors-for-data-visualization)) https://academy.datawrapper.de/article/140-what-to-consider-when-choosing-colors-for-data-visualization
([72](https://www.decorilla.com/online-decorating/living-room-color-schemes-palettes)) https://www.decorilla.com/online-decorating/living-room-color-schemes-palettes
([73](https://blog.datawrapper.de/which-color-scale-to-use-in-data-vis)) https://blog.datawrapper.de/which-color-scale-to-use-in-data-vis
([74](https://www.thetoptens.com/colors/colors-dont-go-together)) https://www.thetoptens.com/colors/colors-dont-go-together
([75](https://www.artworkflowhq.com/resources/7-worst-color-combinations-you-need-to-avoid)) https://www.artworkflowhq.com/resources/7-worst-color-combinations-you-need-to-avoid
([76](https://graphicdesign.stackexchange.com/questions/158777/how-to-pick-32-distinct-colors-for-map-drawing)) https://graphicdesign.stackexchange.com/questions/158777/how-to-pick-32-distinct-colors-for-map-drawing
	([77](https://www.reddit.com/r/design/comments/pjop9/highcontrast_color_schemes_for_science)) https://www.reddit.com/r/design/comments/pjop9/highcontrast_color_schemes_for_science