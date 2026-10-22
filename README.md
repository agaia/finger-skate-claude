# Finger Skate for Claude Code

Skate while Claude works: this plugin opens [Finger Skate](https://appsheroes.app)'s skate mode once Claude has been
working a few seconds, and closes it when Claude is done or needs you.

```sh
claude plugin marketplace add agaia/finger-skate-claude
claude plugin install finger-skate@appsheroes
```

Its hooks only send `fingerskate://claude/working` or `/idle` with the session id to the game (`open -g`, in the
background). Turn it off with `claude plugin disable finger-skate@appsheroes`.
