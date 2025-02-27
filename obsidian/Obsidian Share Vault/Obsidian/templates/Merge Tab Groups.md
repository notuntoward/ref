<%*

// Doesn't work.  Is templater allowed to control frame, etc?  Or only to create and insert stuff into notes?
// From: https://www.perplexity.ai/search/vscode-has-a-close-editor-grou-Q9it5mCtTqe5AS2mYMhrtQ#4
// Try running it with the RunJS Plugin ?

const activeGroup = app.workspace.activeTabGroup;
const otherGroups = app.workspace.getLeavesOfType('markdown').filter(leaf => leaf.group !== activeGroup.id);

if (otherGroups.length > 0) {
    // Move all tabs from the active group to another group
    activeGroup.children.slice().reverse().forEach(tab => {
        otherGroups[0].children.push(tab);
        tab.group = otherGroups[0].id;
    });

    // Clear the active group
    activeGroup.children = [];
    app.workspace.requestSaveLayout();
} else {
    new Notice("No other groups available to move tabs.");
}
%>
