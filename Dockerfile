# Appsmith Community Edition for Railway.
# Pinned by version and digest; bump both together and add a CHANGELOG entry.
FROM appsmith/appsmith-ce:v2.7.1@sha256:0d2f4d4122b47e0a0b80fe7681d7bf8dfb4b14ccb9f6ee3e6092968c22c04b15

# Safe defaults. The Railway template sets the same values as variables, and
# anything set on the service overrides these.
ENV APPSMITH_DISABLE_TELEMETRY=true \
    APPSMITH_SIGNUP_DISABLED=true


# All state lives in /appsmith-stacks; the Railway template mounts a volume there
# (Railway rejects a Dockerfile VOLUME instruction).
EXPOSE 80

# The image's own entrypoint and command (supervisord with Caddy on port 80)
# are kept unchanged.
