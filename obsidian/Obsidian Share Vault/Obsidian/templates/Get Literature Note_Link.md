<%*
// A template for selecting and pasting literature note links.  
// I've mapped this to a hot key (ctrl-])

// Function to check if a note is a literature note
// handles either array or scalar literaturenote category
function isLiteratureNote(file) {
  const frontMatter = app.metadataCache.getFileCache(file)?.frontmatter;
  if (!frontMatter) return false;

  // Handle both string and array cases for 'category'
  if (Array.isArray(frontMatter.category)) {
    return frontMatter.category.includes('literaturenote');
  } else {
    return frontMatter.category === 'literaturenote';
  }
}

//function isLiteratureNote(file) {
//  const frontMatter = app.metadataCache.getFileCache(file).frontmatter;
//  return frontMatter && frontMatter.category === 'literaturenote';
//}

// Check if we have an active editor before proceeding
const activeView = app.workspace.activeLeaf?.view;
if (!activeView || !activeView.editor) {
  new Notice("No active editor found.");
  return;
}

// Get all markdown files and filter for literature notes
const allNotes = app.vault.getMarkdownFiles();
const literatureNotes = allNotes.filter(isLiteratureNote);

if (literatureNotes.length === 0) {
  new Notice("No literature notes found.");
  return;
}

const selectedNote = await tp.system.suggester(
  (file) => file.basename,
  literatureNotes,
  false,
  "Select a literature note to link"
);

if (selectedNote) {
  const frontMatter = app.metadataCache.getFileCache(selectedNote).frontmatter;
  const citekey = frontMatter ? frontMatter.citekey : null;
  const aliases = frontMatter ? frontMatter.aliases : null;

  if (citekey) {
    // const match = citekey.match(/^([a-zA-Z]+)(\d{2})/);
    const match = citekey.match(/^([a-zA-Z0-9]+)(\d{2})/); // match 3Blue1Brown25*, etc.
    if (match) {
      const authorName = match[1];
      const yearNum = match[2];
      const formattedCitekey = `${authorName}${yearNum}`;
    
      if (aliases && Array.isArray(aliases) && aliases.length > 0) {
        // Remove duplicate aliases
        const uniqueAliases = [...new Set(aliases)];
        
        // Sort aliases by length
        const sortedAliases = uniqueAliases.sort((a, b) => b.length - a.length);
        const longestAlias = sortedAliases[0];
        const secondLongestAlias = sortedAliases[1] || '';
        
        // Create options for the selector
        const options = [longestAlias, secondLongestAlias, citekey];
        
        // Show the selector to the user
        const selectedOption = await tp.system.suggester(
         (option) => option,
          options,
          false,
          "Select a link description"
        );
        
        // Format the link description based on the selection
        let linkDescription;
        if (selectedOption === citekey) {
          linkDescription = citekey;
        } else {
          linkDescription = `${formattedCitekey}: ${selectedOption}`;
        }
        
        // Create the wiki link string and remove all newlines
        const wikiLink = `[[${selectedNote.basename}|${linkDescription}]] `.replace(/[\r\n]+/g, '');
        
        // Insert the entire wiki link string
        const editor = this.app.workspace.activeLeaf.view.editor;
        const cursor = editor.getCursor();
        editor.replaceRange(wikiLink, cursor);
        
        // This inserts a newline after the link.  No idea why.
        // If I commentent it out, the cursor remains at the front of the link
        // Front of the link is better because it doesn't make a space in the middle of a sentence.
        // However, it also leaves the link open, which is more annoying than the newline
        // Move the cursor to the end of the link
        const linkEndPosition = {
          line: cursor.line,
          ch: cursor.ch + wikiLink.length
        };
        editor.setCursor(linkEndPosition);
        return; // Explicitly end template execution
      } else {
        new Notice("Aliases not found or empty in the selected note.");
      }
    } else {
      new Notice("Citekey format is incorrect.");
    }
  } else {
    new Notice("Citekey not found in the selected note.");
  }
} else {
  new Notice("No note selected.");
}
%>
