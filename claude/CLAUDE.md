# Global Claude Code Instructions

## Subagent Usage

- Use subagents whenever possible for implementation tasks, code changes, and exploration.
- Prefer dispatching a subagent over doing the work inline, especially for:
  - Any change touching more than one file
  - Exploration or research before implementation
  - Tasks that can run in parallel
- Always gather sufficient context (by reading files or using an Explore subagent) before dispatching an implementation subagent, so the subagent has everything it needs.
- Run independent subagents in parallel where possible.

## Commit Guidelines

- Do not include Co-Authored-By lines in commit messages

## Documentation Style

- Never use Unicode box-drawing characters or symbols in markdown or any other files.
  Use ASCII equivalents instead:
  - `+--` instead of `├──` / `└──`
  - `|` instead of `│`
  - `->` instead of `→`
  - `[x]` instead of `✓` / `✅`
  - `[ ]` instead of `✗` / `❌`
  - `[!]` instead of `⚠`
  - `-` instead of `─`
