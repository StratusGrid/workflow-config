<p align="center">                                                                                                                                            ─╯                                                                                   
  <img src="https://github.com/StratusGrid/terraform-readme-template/blob/main/header/stratusgrid-logo-smaller.jpg?raw=true" />
  <p align="center">                                                           
    <a href="https://stratusgrid.com/book-a-consultation">Contact Us Test</a> |                  
    <a href="https://stratusgrid.com/cloud-cost-optimization-dashboard">Stratusphere FinOps</a> |
    <a href="https://stratusgrid.com">StratusGrid Home</a> |
    <a href="https://stratusgrid.com/blog">Blog</a>
  </p>                    
</p>
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