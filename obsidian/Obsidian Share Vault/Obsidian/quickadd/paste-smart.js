// paste-smart.js
module.exports = async (params) => {

    
    module.exports = async (params) => {
        console.log("Paste Smart macro is starting!");

    const { app, quickAddApi } = params;
    const editor = app.workspace.activeEditor?.editor;
    
    // Check stored data exists
    const cutData = quickAddApi.variables.get('smartCut');
    if (!cutData) {
        new Notice('No Smart Cut content found!\nUse Cut Smart first.');
        return;
    }

    try {
        // 1. Insert content
        editor.replaceSelection(cutData.text);
        
        // 2. Calculate new positions
        const docLength = editor.lineCount();
        const newStart = {
            line: Math.min(cutData.start.line, docLength - 1),
            ch: cutData.start.ch
        };
        
        const newEnd = {
            line: Math.min(cutData.end.line, docLength - 1),
            ch: cutData.end.ch
        };

        // 3. Select inserted content
        editor.setSelection(newStart, newEnd);
        editor.setCursor(newEnd);

        // 4. Clear stored data
        quickAddApi.variables.delete('smartCut');
        new Notice('Content pasted and selected');

    } catch (error) {
        new Notice(`Paste Smart Failed: ${error.message}`);
    }
};
