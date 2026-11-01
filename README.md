# nazoratchi-watchdog

Every 10 minutes this workflow calls the Nazoratchi agent's `/health` endpoint and sends a
Telegram message to the owner if the agent stops responding. The URL, bot token and chat id
live in repository secrets.

`railway/` holds the same check as a Railway cron service (separate project
`nazoratchi-watchdog`, every 10 minutes) — a second, punctual backup because GitHub
schedules can start late. It needs `HEALTH_URL`, `TELEGRAM_BOT_TOKEN` and
`OWNER_TELEGRAM_ID` as Railway variables.
