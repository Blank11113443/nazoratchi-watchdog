#!/bin/sh
# Railway cron job (every 10 min): ping Nazoratchi's /health, alert the owner if it stays down.
set -u
code=000
for attempt in 1 2 3; do
  code=$(curl -s -o /dev/null -w '%{http_code}' --max-time 20 "$HEALTH_URL" || echo 000)
  if [ "$code" = "200" ]; then
    echo "healthy"
    exit 0
  fi
  sleep 30
done
curl -s -X POST "https://api.telegram.org/bot${TELEGRAM_BOT_TOKEN}/sendMessage" \
  -d chat_id="$OWNER_TELEGRAM_ID" \
  --data-urlencode text="🚨 Nazoratchi javob bermayapti (Railway zaxira kuzatuvchisi, health: ${code}). Railway'da tekshiring." > /dev/null
echo "unhealthy: ${code}"
