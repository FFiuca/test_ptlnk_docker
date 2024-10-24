INIT_KONG_ADMIN_URL=${INIT_KONG_ADMIN_URL:-"http://host.docker.internal:8001"}


until $(curl --output /dev/null --silent --head --fail "$INIT_KONG_ADMIN_URL"); do
    echo "Waiting for Kong to be ready at $INIT_KONG_ADMIN_URL..."
    sleep 5
done

# Create a service (using the KONG_ADMIN_URL)
curl -i -X POST "$INIT_KONG_ADMIN_URL/services" \
    -H "Content-Type: application/json" \
    -d @lnk-fe-svc.json

echo "create FE service success"
sleep 2

curl -i -X POST "$INIT_KONG_ADMIN_URL/services" \
    -H "Content-Type: application/json" \
    -d @lnk-be-svc.json

echo "create BE service success"
sleep 2

curl -i -X POST "$INIT_KONG_ADMIN_URL/routes" \
    -H "Content-Type: application/json" \
    -d @all.json

echo "create all route success"
sleep 2

curl -i -X POST "$INIT_KONG_ADMIN_URL/routes" \
    -H "Content-Type: application/json" \
    -d @be-user.json

echo "create be-user.json route success"
sleep 2

curl -i -X POST "$INIT_KONG_ADMIN_URL/routes" \
    -H "Content-Type: application/json" \
    -d @be-guest.json

echo "create be-guest.json route success"
sleep 2
