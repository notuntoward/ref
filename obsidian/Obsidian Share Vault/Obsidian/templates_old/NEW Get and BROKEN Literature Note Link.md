// A template for selecting and pasting literature note links.
// This script has been updated to handle edge cases and ensure compatibility with notes that use arrays for 'category'.

async function getLiteratureNoteLink() {
  // Function to check if a note is a literature note
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

  // Get all markdown files and filter for literature notes
  const allNotes = app.vault.getMarkdownFiles();
  const literatureNotes = allNotes.filter(isLiteratureNote);

  if (literatureNotes.length === 0) {
    new Notice("No literature notes found.");
    return;
  }

  // Prompt user to select a literature note
  const selectedNote = await tp.system.suggester(
    (file) => file.basename,
    literatureNotes,
    false,
    "Select a literature note to link"
  );

  if (!selectedNote) {
    new Notice("No note selected.");
    return;
  }

  // Retrieve the frontmatter of the selected note
  const frontMatter = app.metadataCache.getFileCache(selectedNote)?.frontmatter;
  const citekey = frontMatter?.citekey || null;
  const aliases = frontMatter?.aliases || null;

  if (!citekey) {
    new Notice("Citekey not found in the selected note.");
    return;
  }

  // Validate citekey format
  const match = citekey.match(/^([a-zA-Z0-9]+)(\d{2})(.*)?/); // Updated regex to allow additional text after year
  if (!match) {
    new Notice("Citekey format is incorrect.");
    return;
  }

  const authorName = match[1];
  const yearNum = match[2];
  const extraText = match[3] || ""; // Optional additional text
  const formattedCitekey = `${authorName}${yearNum}${extraText}`;

  // Handle aliases logic
  let linkDescription;
  if (aliases && Array.isArray(aliases) && aliases.length > 0) {
    // Remove duplicate aliases and sort by length
    const uniqueAliases = [...new Set(aliases)];
    const sortedAliases = uniqueAliases.sort((a, b) => b.length - a.length);

    // Use longest alias as default option
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

    // Format the link description based on selection
    linkDescription =
      selectedOption === citekey ? citekey : `${formattedCitekey}: ${selectedOption}`;
  } else {
    // Fallback to using just the citekey if no aliases are found
    linkDescription = citekey;
  }

  // Create the wiki link string and remove all newlines
  const wikiLink = `[[${selectedNote.basename}|${linkDescription}]]`.replace(/[\r\n]+/g, '');

  // Insert the wiki link into the active editor at the current cursor position
  const editor = this.app.workspace.activeLeaf.view.editor;
  const cursor = editor.getCursor();
  editor.replaceRange(wikiLink, cursor);

  // Optionally move the cursor to the end of the inserted link
  editor.setCursor({
    line: cursor.line,
    ch: cursor.ch + wikiLink.length,
  });

  new Notice("Literature note link inserted.");
}

// Run the function when this template is executed
getLiteratureNoteLink();
