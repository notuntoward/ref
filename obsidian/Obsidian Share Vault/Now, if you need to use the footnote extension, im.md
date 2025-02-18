---
created date: 2025-02-17T23:22:34-08:00
modified date: 2025-02-17T23:22:34-08:00
---
<img src="https://r2cdn.perplexity.ai/pplx-full-logo-primary-dark%402x.png" class="logo" width="120"/>

# Now, if you need to use the footnote extension, import it correctly.

I've pasted a markdown document below. Write python that uses Marko to parse it and produce the following:

1. the contents of the first level 1 headline
2. a dict containing the number of a foot note and the corresponding URL
3. all of the text but with the footnotes replaced with markdown links with the link text being the number, and the link destination being that link number's URL.

Here is the markdown:

<img src="https://r2cdn.perplexity.ai/pplx-full-logo-primary-dark%402x.png" class="logo" width="120"/>

# Describe the current state of Seattle's Burke Gilman missing link bike trail, and explain how it reached its current state.

---
The "Missing Link" of Seattle's Burke-Gilman Trail remains incomplete as of February 2025. Despite being a priority in Seattle's Bicycle Master Plan since the 1990s, the Missing Link has faced resistance from local businesses along the proposed route and extensive litigation under the State Environmental Policy Act (SEPA), which opponents have used to delay progress[^1][^4][^9].

### Current State

- **Unfinished Section**: The Missing Link spans 1.4 miles around Salmon Bay, east of the Ballard Locks. Cyclists must navigate busy streets or alternative routes to bypass this gap[^1][^9].
- **Litigation and Delays**: Legal challenges have stalled construction repeatedly, making it one of Seattle's most prolonged infrastructure disputes[^1][^9].


### How It Reached This State

1. **Historical Background**: The Burke-Gilman Trail was initially developed on a former railroad corridor and opened in sections starting in 1978. While most of the 27-mile trail is complete, the Ballard segment has remained contentious due to its industrial setting[^5][^10].
2. **City Efforts**: Successive city administrations have allocated funds and conducted studies to close the gap. However, these efforts have been met with resistance, forcing SDOT to consider alternative routes[^7][^9].

The Missing Link remains a critical gap[^1][^7][^9].

<div style="text-align: center">⁂</div>

[^1]: https://www.youtube.com/watch?v=TKEdfRlFfnw

[^2]: https://www.theurbanist.org/2015/06/22/finding-the-burke-gilman-trails-missing-link/

[^3]: https://www.seattlebikeblog.com/2017/10/12/the-community-advised-missing-link-design-keeps-getting-better-for-everyone/

[^4]: https://www.seattle.gov/transportation/projects-and-programs/programs/bike-program/bgtmissinglink

[^5]: https://www.seattle.gov/transportation/projects-and-programs/programs/bike-program/ballard-multimodal-corridor/burke-gilman-trail-history

[^6]: https://www.traillink.com/trail/burke-gilman-trail/

[^7]: https://www.seattle.gov/transportation/projects-and-programs/programs/bike-program/ballard-bike-route-study

[^8]: https://www.seattlebikeblog.com/2015/03/31/cascade-publishes-very-very-long-timeline-of-work-to-build-the-burke-gilman-missing-link/

[^9]: https://www.seattletimes.com/seattle-news/transportation/is-the-burke-gilman-missing-link-in-seattle-finally-getting-built/

[^10]: https://www.seattlepi.com/seattlenews/article/History-Burke-Gilman-bicycle-walk-trail-Seattle-14369100.php
---
Looking at the search results, I can see that we need to simplify the code and avoid importing FootnoteExtension directly. Here's the corrected code:

```python
import marko

# Initialize Marko with footnote extension
markdown = marko.Markdown(extensions=['footnote'])

# Parse the markdown
parsed_doc = markdown.parse(markdown_text)

# 1. Get first level 1 headline
headline = None
for element in parsed_doc.children:
    if isinstance(element, marko.block.Heading) and element.level == 1:
        headline = ''.join(str(child.children) for child in element.children)
        break

# 2. Create footnote dictionary by parsing the footnote definitions directly
footnote_dict = {}
import re

# Use regex to find footnote definitions
footnote_pattern = r'\[\^(\d+)\]:\s*(http[s]?://\S+)'
for match in re.finditer(footnote_pattern, markdown_text):
    number, url = match.groups()
    footnote_dict[number] = url

# 3. Replace footnotes with markdown links
rendered = markdown_text
for number, url in footnote_dict.items():
    rendered = rendered.replace(f'[^{number}]', f'[{number}]({url})')

result = {
    'headline': headline,
    'footnotes': footnote_dict,
    'rendered_text': rendered
}
```

This version:

1. Only uses the basic Marko import and enables the footnote extension using the string method
2. Uses regex to parse the footnote definitions directly from the text instead of trying to use Marko's internal footnote classes
3. Should successfully extract the headline, create the footnote dictionary, and replace the footnotes with markdown links

The key changes are:

- Removed problematic imports of FootnoteExtension
- Added regex-based footnote parsing instead of relying on Marko's internal footnote handling
- Simplified the overall approach to avoid using internal Marko classes that might not be available

