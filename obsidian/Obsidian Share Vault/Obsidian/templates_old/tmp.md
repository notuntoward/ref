---
created date: 2024-12-17T08:51:31-08:00
modified date: 2024-12-17T08:51:31-08:00
---
<%*
// Function to check if a note is a literature note
function isLiteratureNote(file) {
  const frontMatter = app.metadataCache.getFileCache(file).frontmatter;
  return frontMatter && frontMatter.category === 'literaturenote';
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
    const match = citekey.match(/^([a-zA-Z]+)(\d{2})/);
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
        const wikiLink = `[[${selectedNote.basename}|${linkDescription}]]`.replace(/[\r\n]+/g, '');
        
        // Insert the entire wiki link string
        const editor = this.app.workspace.activeLeaf.view.editor;
        const cursor = editor.getCursor();
        editor.replaceRange(wikiLink, cursor);
        
        // Move the cursor to the end of the link
        const linkEndPosition = {
          line: cursor.line,
          ch: cursor.ch + wikiLink.length
        };
        editor.setCursor(linkEndPosition);
        
        // Optionally, you can add a notification
        new Notice("Literature note link inserted. Cursor positioned at the end of the link.");
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
