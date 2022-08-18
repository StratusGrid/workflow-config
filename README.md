# workflow-config
Repository that stores the StratusGrid github workflows.

## Usage

Add this file in your .github/workflows folder

```yml
name: Pre-Commit

on:
  pull_request:

jobs:
  build:
    uses: StratusGrid/workflow-config/.github/workflows/pre-commit.yml@main
```

change the path to the workflow you want to use.