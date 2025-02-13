// Toggle Outline Pane
const outlinePane = app.workspace.getLeavesOfType("outline")[0];

if (outlinePane) {
    outlinePane.detach(); // Close the Outline pane if it's open
} else {
    app.commands.executeCommandById("outline:open"); // Open the Outline pane if it's not open
}
