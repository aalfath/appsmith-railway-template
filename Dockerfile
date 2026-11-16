# Appsmith Community Edition for Railway.
# Pinned by version and digest; bump both together and add a CHANGELOG entry.
FROM appsmith/appsmith-ce:v2.7.0@sha256:ba7e575a188f64aa83e646d532673304626825353dd47727e021f9b42bd53833

# Safe defaults. The Railway template sets the same values as variables, and
# anything set on the service overrides these.
ENV APPSMITH_DISABLE_TELEMETRY=true \
    APPSMITH_SIGNUP_DISABLED=true

# All state (embedded MongoDB, Redis, Postgres, config, Git checkouts, backups)
# lives here. The Railway template mounts a volume at this path.
VOLUME ["/appsmith-stacks"]

EXPOSE 80

# The image's own entrypoint and command (supervisord with Caddy on port 80)
# are kept unchanged.
