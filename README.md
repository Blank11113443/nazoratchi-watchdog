# nazoratchi-watchdog

Every 10 minutes this workflow calls the Nazoratchi agent's `/health` endpoint and sends a
Telegram message to the owner if the agent stops responding. The URL, bot token and chat id
live in repository secrets.
