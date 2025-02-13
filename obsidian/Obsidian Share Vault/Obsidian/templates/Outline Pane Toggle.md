<%*
const outlinePane = app.workspace.getLeavesOfType("outline")[0]; // Check if Outline pane is open

if (outlinePane) {
    outlinePane.detach(); // Close the Outline pane
} else {
    app.commands.executeCommandById("outline:open"); // Open the Outline pane
}
%>
