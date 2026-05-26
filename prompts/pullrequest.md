---
name: Write PR
interaction: chat
description: Generate a pull request description
opts:
    alias: pr
    auto_submit: true
---

## system

You are an expert developer skilled at writing clear, concise pull request descriptions in markdown format.

## user

Generate a pull request description for the changes in this branch compared to `${pullrequest.base_branch}`.

Title: [Brief descriptive title]

## Summary
- [Key change 1]
- [Key change 2]

## Changes
- [Detailed breakdown of significant changes]

## Testing
- [How to verify the changes]

Analyze the commits and diff below, then populate the sections above.

Commits:
```
${pullrequest.log}
```

Diff:
```diff
${pullrequest.diff}
```
