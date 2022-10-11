# stylelint
GitHub Action that runs [stylelint](https://stylelint.io).

## Usage
To use stylelint in your workflow just add this step:

```yaml
- name: stylelint 
  uses: TarasHoisak/StyleLintInspector@master
```

## Configuration
Action has 4 parameters which you can set:
- FILES - Files for linting
- CONFIG_PATH - Path to stylelint configuration file
- INDENT_SPACE - Space indentation
- FULL_CHECK - Check all files in the project if `FILES` is empty 

This parameters can be set through environment variables:
```yaml
- uses: TarasHoisak/StyleLintInspector@master
  env:
    INDENT_SPACES: 4
    FILES: "*.scss"
```

### .stylelintrc
By default, action will try to find an existing configuration file in the project.  
If the configuration file will not found, it will be created with the next configuration:

```json
{
  "extends": "stylelint-config-standard",
  "rules": {
    "indentation": 2
  }
}
```

### Files pattern
If you want to specify which file or types must be validated.  
You need to pass the pattern as a `FILES` variable.
By default, it will try to find `**/*.scss`.

### Indentation
Indentation can be set by environment variable `INDENT_SPACES`.  
By default space, indent is 2.

```yaml
- uses: TarasHoisak/StyleLintInspector@master
  ENV:
    INDENT_SPACES: 4
```

### Full project linting
`FULL_CHECK` is a boolean value, by default it's `false`, if you want to run linting for the all project files pass `FILES` values as `**/**.(sccs or css)` (or leave it empty) and/or `FULL_CHECK` mark as `true`   

```yaml
- uses: TarasHoisak/StyleLintInspector@master
  ENV:
    FULL_CHECK: true
```

## Example
### Default values
```bash
name: Test
on: [pull_request]

jobs:
  linters:
    name: stylelint
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v3
      - uses: TarasHoisak/StyleLintInspector@master
```

### Custom paramenters
```bash
name: Test
on: [pull_request]

jobs:
  linters:
    name: stylelint
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v3
      - uses: TarasHoisak/StyleLintInspector@master
        env:
          FILES: "*.scss"
          INDENT_SPACES: 4
          FULL_CHECK: true
```

## License
[MIT License](https://github.com/actions-hub/stylelint/blob/master/LICENSE)
