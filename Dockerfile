# Appsmith Community Edition for Railway.
# Pinned by version and digest; bump both together and add a CHANGELOG entry.
FROM appsmith/appsmith-ce:v2.7.2@sha256:1f456089b75edec495c005f0e94858aa5c6d1408fcac5f7c1e2d85d69bd1592d

# Safe defaults. The Railway template sets the same values as variables, and
# anything set on the service overrides these.
ENV APPSMITH_DISABLE_TELEMETRY=true \
    APPSMITH_SIGNUP_DISABLED=true


# All state lives in /appsmith-stacks; the Railway template mounts a volume there
# (Railway rejects a Dockerfile VOLUME instruction).
EXPOSE 80

# The image's own entrypoint and command (supervisord with Caddy on port 80)
# are kept unchanged.
