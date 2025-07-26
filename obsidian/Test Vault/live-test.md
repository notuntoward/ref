// To run this test:
// 1. Run `npm run setup:test`
// 2. Open the Test Vault in Obsidian.
// 3. Open the Developer Console (Ctrl+Shift+I or Cmd+Option+I).
// 4. Paste this entire script into the console and press Enter.
// 5. The results will be logged to the console.

(async () => {
  console.log("--- Starting Live Integration Test ---");

  const app = this.app;
  const pluginId = 'multi-properties';
  const plugin = app.plugins.plugins[pluginId];

  if (!plugin) {
    console.error("Plugin not found. Is it enabled?");
    return;
  }

  const testNotePath = 'test-note.md';
  let file = app.vault.getAbstractFileByPath(testNotePath);
  if (!file || !(file instanceof TFile)) {
      console.error(`Could not find '${testNotePath}'. Make sure the test vault is initialized.`);
      return;
  }

  // --- Test Case 1: Add a new property ---
  console.log("Running Test Case 1: Add Property");
  const propToAdd = { name: 'live-test-prop', type: 'number', value: 999 };
  
  // Mock the PropModal to automatically submit
  const originalCreatePropModal = plugin.createPropModal;
  plugin.createPropModal = (iterable) => {
      const props = new Map();
      props.set(propToAdd.name, { type: propToAdd.type, data: propToAdd.value });
      plugin.searchFiles(iterable, plugin.addPropsCallback(props));
  };

  app.workspace.activeLeaf.openFile(file);
  app.commands.executeCommandById('multi-properties:add-props-to-current-note');
  
  // Restore original function
  plugin.createPropModal = originalCreatePropModal;

  // Verification for Test Case 1
  // We need a slight delay for the file processing to complete
  await new Promise(resolve => setTimeout(resolve, 100)); 
  let metadata = app.metadataCache.getFileCache(file);
  if (metadata.frontmatter[propToAdd.name] === propToAdd.value) {
    console.log("  ✅ SUCCESS: Property was added correctly.");
  } else {
    console.error("  ❌ FAILED: Property was not added.", metadata.frontmatter);
  }

  // --- Test Case 2: Remove the property ---
  console.log("Running Test Case 2: Remove Property");

  const originalCreateRemoveModal = plugin.createRemoveModal;
  plugin.createRemoveModal = (iterable) => {
      plugin.searchFiles(iterable, plugin.removePropsCallback([propToAdd.name]));
  };

  app.commands.executeCommandById('multi-properties:remove-props-from-current-note');
  plugin.createRemoveModal = originalCreateRemoveModal;

  // Verification for Test Case 2
  await new Promise(resolve => setTimeout(resolve, 100));
  metadata = app.metadataCache.getFileCache(file);
  if (metadata.frontmatter[propToAdd.name] === undefined) {
    console.log("  ✅ SUCCESS: Property was removed correctly.");
  } else {
    console.error("  ❌ FAILED: Property was not removed.", metadata.frontmatter);
  }

  console.log("--- Live Integration Test Complete ---");

})();
