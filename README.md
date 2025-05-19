# StratusGrid Workflow Configuration

<p align="center">                                                                                                                                            
                                                                                
  <img src="https://github.com/StratusGrid/terraform-readme-template/blob/main/header/stratusgrid-logo-smaller.jpg?raw=true" />
  <p align="center">                                                           
    <a href="https://stratusgrid.com/book-a-consultation">Contact Us</a> |                  
    <a href="https://stratusgrid.com/cloud-cost-optimization-dashboard">Stratusphere FinOps</a> |
    <a href="https://stratusgrid.com">StratusGrid Home</a> |
    <a href="https://stratusgrid.com/blog">Blog</a>
  </p>                    
</p>

## Overview

This repository contains standardized GitHub workflows and pre-commit configurations used across StratusGrid repositories. It provides a centralized location for maintaining consistent code quality checks, linting rules, and automated workflows.

## Features

- **Pre-commit Workflows**: Automated checks for code quality and consistency
- **Terraform Linting**: Standardized Terraform code validation
- **Code Formatting**: Consistent code style enforcement
- **Automated Updates**: Renovate configuration for dependency management

## GitHub Actions Usage

### Adding Workflows to Your Repository

1. Create a `.github/workflows` directory in your repository if it doesn't exist
2. Add the desired workflow file (e.g., `pre-commit.yml`)
3. Reference the workflow from this repository

Example for pre-commit workflow:

```yaml
name: Pre-Commit

on:
  pull_request:

jobs:
  build:
    uses: StratusGrid/workflow-config/.github/workflows/pre-commit.yml@main
```

## Local Setup

### Setup

1. Copy the following files from the `precommit-config` directory to your repository root:
   - `.pre-commit-config.yaml`
   - `.prettierignore`
   - `.tflint.hcl`
2. Install pre-commit hooks:
   ```bash
   pip install pre-commit
   pre-commit install
   ```

### Quick Setup with Alias

For easier usage, you can add this function to your shell configuration (e.g., `~/.bashrc` or `~/.zshrc`):

```bash
pre-commit-run() {
    # Check if pre-commit is installed
    if ! command -v pre-commit &> /dev/null; then
        echo "Error: pre-commit is not installed. Please install it first:"
        echo "pip install pre-commit"
        return 1
    fi

    local branch=${1:-main}
    local base_url="https://raw.githubusercontent.com/StratusGrid/workflow-config/$branch/precommit-config"
    local files=(".pre-commit-config.yaml" ".prettierignore" ".tflint.hcl")
    local temp_dir=$(mktemp -d)
    
    echo "Downloading configuration files from branch: $branch"
    
    # Download files
    for file in "${files[@]}"; do
        if ! curl -s -o "$temp_dir/$file" "$base_url/$file"; then
            echo "Error: Failed to download $file"
            rm -rf "$temp_dir"
            return 1
        fi
    done
    
    # Run pre-commit
    echo "Running pre-commit checks..."
    if pre-commit run -a --config "$temp_dir/.pre-commit-config.yaml"; then
        echo "Pre-commit checks completed successfully"
    else
        echo "Pre-commit checks failed"
    fi
    
    # Cleanup
    rm -rf "$temp_dir" ".pre-commit-trivy-cache"
}

# Optional: Create an alias for the default branch
alias pre-commit-run-main="pre-commit-run main"
```

Then you can run pre-commit checks in several ways:

```bash
# Use default branch (main)
pre-commit-run

# Specify a branch
pre-commit-run develop

# Use the alias for main branch
pre-commit-run-main
```

### Available Hooks

The pre-commit configuration includes:
- Terraform formatting and validation
- Code formatting with Prettier
- Linting for various file types
- Security checks

### Usage

Run pre-commit checks manually:
```bash
pre-commit run --all-files
```

Or let them run automatically on git commit.

## Configuration Files

- `.pre-commit-config.yaml`: Defines pre-commit hooks and their configurations
- `.tflint.hcl`: Terraform linter configuration
- `.prettierignore`: Prettier ignore rules
- `renovate.json`: Automated dependency update configuration
- 