// cut-smart.js
module.exports = async (params) => {

    module.exports = async (params) => {
        console.log("Cut Smart macro is starting!");
        
    const { app, quickAddApi } = params;
    const editor = app.workspace.activeEditor?.editor;
    
    // Check for required plugins
    const requiredPlugins = ['outliner', 'quickadd'];
    const missing = requiredPlugins.filter(p => !app.plugins.enabledPlugins.has(p));
    if (missing.length > 0) {
        new Notice(`Missing required plugins: ${missing.join(', ')}\nInstall and enable them first.`);
        return;
    }

    try {
        // 1. Attempt to fold structure
        await app.commands.executeCommandById('outliner:fold');
        
        // 2. Determine selection type
        const cursor = editor.getCursor();
        const line = editor.getLine(cursor.line);
        let selectionMade = false;

        // Check for foldable elements
        if (line.match(/^(#+|\-|\*|\+)/)) {
            editor.exec('selectAll'); // Select folded content
            selectionMade = true;
        } 
        // Check for non-foldable elements
        else if (line.match(/!\[.*\]|\[\^.*\]|^>|^```
            editor.exec('expandSelectionToLine');
            selectionMade = true;
        }

        if (!selectionMade) {
            new Notice('No foldable element found!\nSelect content manually.');
            return;
        }

        // 3. Store selection state
        const selection = editor.getSelection();
        const start = editor.getCursor('from');
        const end = editor.getCursor('to');
        
        quickAddApi.variables.set('smartCut', {
            text: selection,
            start: { line: start.line, ch: start.ch },
            end: { line: end.line, ch: end.ch }
        });

        // 4. Perform cut
        editor.replaceSelection(''); // Remove selected text
        new Notice('Content cut - use Paste Smart to insert');

    } catch (error) {
        new Notice(`Cut Smart Failed: ${error.message}`);
    }
};
