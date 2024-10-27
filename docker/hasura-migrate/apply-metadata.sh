#!/bin/bash

# Environment variables expected to be set:
# HASURA_ENDPOINT - the Hasura GraphQL engine endpoint
# HASURA_ADMIN_SECRET - the Hasura admin secret, if needed
# APPLY_MIGRATIONS - Set to "true" to apply migrations
# APPLY_METADATA - Set to "true" to apply metadata
# APPLY_SEEDS - Set to "true" to apply seeds

# Default values for actions
: ${APPLY_MIGRATIONS:=false}
: ${APPLY_METADATA:=false}
: ${APPLY_SEEDS:=false}
: ${WAIT_FOR_ENDPOINT:=true}

# Wait for the endpoint to be available
if [ "$WAIT_FOR_ENDPOINT" = "true" ]; then
    echo "Waiting for Hasura endpoint http://graphql-engine:8080 to be available..."
    while true; do
        if curl -s -o /dev/null "http://graphql-engine:8080/v1/version"; then
            echo "Endpoint http://graphql-engine:8080 is now available."
            break
        else
            echo "Endpoint http://graphql-engine:8080 not available, waiting..."
            sleep 1
        fi
    done
fi


# Apply metadata
echo "Applying metadata..."
hasura metadata apply --endpoint http://graphql-engine:8080



