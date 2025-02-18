---
created date: 2025-02-18T13:43:28-08:00
modified date: 2025-02-18T13:43:28-08:00
---
<img src="https://r2cdn.perplexity.ai/pplx-full-logo-primary-dark%402x.png" class="logo" width="120"/>

# In vscode, at this line of code:

        relinked_sources = "\n".join(sorted(relinked_sources, key=lambda line: int(re.search(citenum_plain_re, line).group(1))))
    I see this mypy message:

Incompatible types in assignment (expression has type "str", variable has type "list[str]")Mypyassignment

I meant to do this.  I want to convert the type of a variable from a list of strings to a string.

What should I do to get rid of this warning
---
The `mypy` warning occurs because the type of `relinked_sources` was initially inferred as `list[str]`, but you are reassigning it to a `str`. To resolve this issue and make your intent clear to `mypy`, you can explicitly annotate the variable's type as `str` after the reassignment. Here's how you can do it:

### Solution: Explicit Type Annotation

Annotate the variable to indicate that its type changes from a list of strings to a string:

```python
from typing import List

relinked_sources: List[str] = [...]  # Initial list of strings
relinked_sources = "\n".join(sorted(relinked_sources, key=lambda line: int(re.search(citenum_plain_re, line).group(1))))
relinked_sources: str  # Explicitly declare the new type as str
```


### Explanation

1. **Initial Type**: When you first assign `relinked_sources` as a list of strings, its type is inferred as `List[str]`.
2. **Reassignment**: After reassigning it with `"\n".join(...)`, the value becomes a string.
3. **Explicit Declaration**: Adding `relinked_sources: str` after the reassignment clarifies to `mypy` that the variable's type is now a string.

Alternatively, if you want to avoid reusing the same variable name, you can use a new variable for the string:

```python
from typing import List

original_relinked_sources: List[str] = [...]  # Initial list of strings
relinked_sources_str = "\n".join(sorted(original_relinked_sources, key=lambda line: int(re.search(citenum_plain_re, line).group(1))))
```

This approach avoids confusion and satisfies `mypy` without additional annotations.

<div style="text-align: center">⁂</div>

[^1]: https://www.reddit.com/r/Python/comments/1623g35/question_regarding_typehinting_collection_types/

[^2]: https://www.freecodecamp.org/news/python-list-to-string-how-to-convert-lists-in-python/

[^3]: https://dev.to/decorator_factory/typevars-explained-hmo

[^4]: https://discuss.python.org/t/mypy-type-inferred-for-a-list-as-a-value-in-a-dict/74483

[^5]: https://www.datacamp.com/tutorial/how-to-convert-a-list-to-a-string-in-python

[^6]: https://mypy.readthedocs.io/en/stable/type_inference_and_annotations.html

[^7]: https://stackoverflow.com/questions/69618160/mypy-allowing-liststr-to-have-values-of-type-tuplestr-liststr

[^8]: https://stackoverflow.com/questions/5618878/how-to-convert-list-to-string

[^9]: https://dev.to/tusharsadhwani/the-comprehensive-guide-to-mypy-561m

