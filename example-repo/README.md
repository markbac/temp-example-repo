# Example-Repo

## Pre commit hooks

This Repo is an example of how to set up a repo with pre-commit hooks etc

Run 
```sh
git config core.hooksPath .githooks
```
to use the githooks


see 
- https://betterprogramming.pub/your-git-commit-history-should-read-like-a-history-book-heres-how-7f44d5df1801
- https://www.conventionalcommits.org/en/v1.0.0/

### Basic structure is

```
<type>[optional !][optional scope]: <description>

[optional body]

[optional footer(s)]
```

e.g

```
feat: allow user to keep logged in
fix: messages are now serialized correctly
feat(api)!: removed the old way users are handled
ci(deployment): the application will now be deployed on nonlive as well
```

An exclamation mark shows breaking changes. This can also be more explicit in the footer of the commit message, like:

```
chore: drop support for Node 6

BREAKING CHANGE: use JavaScript features not available in Node 6.
```

This also requires a ticket number or NO-JIRA if no ticket exists.


## Appendix: Types

```json
{
  "$schema": "./index.spec.json",
  "types": {
    "feat": {
      "description": "A new feature",
      "title": "Features"
    },
    "fix": {
      "description": "A bug fix",
      "title": "Bug Fixes"
    },
    "docs": {
      "description": "Documentation only changes",
      "title": "Documentation"
    },
    "style": {
      "description": "Changes that do not affect the meaning of the code (white-space, formatting, missing semi-colons, etc)",
      "title": "Styles"
    },
    "refactor": {
      "description": "A code change that neither fixes a bug nor adds a feature",
      "title": "Code Refactoring"
    },
    "perf": {
      "description": "A code change that improves performance",
      "title": "Performance Improvements"
    },
    "test": {
      "description": "Adding missing tests or correcting existing tests",
      "title": "Tests"
    },
    "build": {
      "description": "Changes that affect the build system or external dependencies (example scopes: gulp, broccoli, npm)",
      "title": "Builds"
    },
    "ci": {
      "description": "Changes to our CI configuration files and scripts (example scopes: Travis, Circle, BrowserStack, SauceLabs)",
      "title": "Continuous Integrations"
    },
    "chore": {
      "description": "Other changes that don't modify src or test files",
      "title": "Chores"
    },
    "revert": {
      "description": "Reverts a previous commit",
      "title": "Reverts"
    }
  }
}
```
