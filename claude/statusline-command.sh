#!/bin/sh
input=$(cat)

model=$(echo "$input" | jq -r '
  if .model | type == "object" then
    (.model.display_name // .model.id // "unknown")
  else
    (.model // "unknown")
  end
')

ctx_pct=$(echo "$input" | jq -r '.context_window.used_percentage // 0 | floor | tostring + "%"')

cost_raw=$(echo "$input" | jq -r '.cost.total_cost_usd // 0')
cost=$(printf '$%.3f' "$cost_raw")

rate_5h=$(echo "$input" | jq -r '
  if (.rate_limits.five_hour.used_percentage | type) == "number" then
    (.rate_limits.five_hour.used_percentage | floor | tostring) + "%"
  else
    ""
  end
')

rate_7d=$(echo "$input" | jq -r '
  if (.rate_limits.seven_day.used_percentage | type) == "number" then
    (.rate_limits.seven_day.used_percentage | floor | tostring) + "%"
  else
    ""
  end
')

api_ms=$(echo "$input" | jq -r '.cost.total_api_duration_ms // 0')
total_ms=$(echo "$input" | jq -r '.cost.total_duration_ms // 0')
if [ "$total_ms" -gt 0 ] 2>/dev/null; then
  api_pct=$(echo "$api_ms $total_ms" | awk '{printf "%d%%", ($1/$2)*100}')
  time_info="api: $api_pct"
else
  time_info=""
fi

if [ -n "$rate_5h" ] || [ -n "$rate_7d" ]; then
  base="$model | ctx: $ctx_pct | $cost | 5h: $rate_5h | 7d: $rate_7d"
else
  base="$model | ctx: $ctx_pct | $cost"
fi

if [ -n "$time_info" ]; then
  echo "$base | $time_info"
else
  echo "$base"
fi
