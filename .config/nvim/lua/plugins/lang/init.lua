-- Import all language-specific plugin configurations
return {
  { import = "plugins.lang.go" }, -- Go
  { import = "plugins.lang.graphql" }, -- GraphQL
  { import = "plugins.lang.hcl" }, -- hcl
  { import = "plugins.lang.json" }, -- json
  { import = "plugins.lang.php" }, -- PHP
  { import = "plugins.lang.python" }, -- Python
  { import = "plugins.lang.web" }, -- HTML, CSS, JavaScript, TypeScript
}
