NEW_HOST="$1"
TARGET_URL="$2"
FORM_DATA="$3"

curl -i -X POST "$TARGET_URL" \
  -H "Host: $NEW_HOST" \
  -H "Content-Type: application/x-www-form-urlencoded" \
  --data "$FORM_DATA"
