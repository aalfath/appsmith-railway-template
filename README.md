[![Deploy on Railway](https://railway.com/button.svg)](https://railway.com/new/template/appsmith-1?utm_medium=integration&utm_source=button&utm_campaign=appsmith)

# Appsmith on Railway

Railway template for [Appsmith](https://www.appsmith.com/) Community Edition,
the open-source low-code platform for internal tools, dashboards and admin panels.

**Deploys:** Appsmith CE **v2.7.0** (`appsmith/appsmith-ce:v2.7.0@sha256:ba7e575a…`),
built from this repo's `Dockerfile`, as a single service with a volume at
`/appsmith-stacks`. The official image runs the editor, the Java backend, the
real-time service and its own MongoDB, Redis and Postgres inside one container.

Template: https://railway.com/deploy/appsmith-1

## First login

1. Deploy and enter your email in `APPSMITH_ADMIN_EMAILS`.
2. Wait for the first boot (2–5 minutes; the health check is `/api/v1/health`).
3. Open `https://YOUR-DOMAIN/user/signup` and **sign up with exactly that email**.
   That account becomes the instance admin.

Appsmith creates the admin address as a locked user at boot, so going straight
to `/user/login` answers "User account is locked". Public sign-up stays off for
every other address (`APPSMITH_SIGNUP_DISABLED=true`); invite more users from
the workspace once you're in.

## Variables

| Variable | Default | Notes |
|---|---|---|
| `APPSMITH_ADMIN_EMAILS` | *(you enter it)* | Admin email(s), comma-separated. Required. |
| `APPSMITH_BASE_URL` | `https://${{Appsmith.RAILWAY_PUBLIC_DOMAIN}}` | Public URL used in links and emails. |
| `APPSMITH_ALLOWED_FRAME_ANCESTORS` | same as base URL | Who may embed Appsmith in an iframe. |
| `APPSMITH_ENCRYPTION_PASSWORD`, `APPSMITH_ENCRYPTION_SALT` | generated | Encrypt datasource credentials. Never change them after the first boot. |
| `APPSMITH_SUPERVISOR_PASSWORD` | generated | Internal supervisord UI; not exposed. |
| `APPSMITH_SIGNUP_DISABLED` | `true` | Keep on, unless you want open sign-up. |
| `APPSMITH_DISABLE_TELEMETRY` | `true` | Anonymous usage data off. |
| `PORT` | `80` | Railway routes the public domain to Appsmith's HTTP port. |

Optional features such as SMTP, Google or GitHub sign-in are set later in
Appsmith's Admin Settings or with the variables in
[Appsmith's reference](https://docs.appsmith.com/getting-started/setup/environment-variables).

## Updates

The image is pinned by version and digest. A new Appsmith release lands here as
a PR that bumps the `FROM` line and adds a `CHANGELOG.md` entry. When it merges
to `main`, Railway shows everyone who deployed the template an "update
available" notice, and they choose when to apply it. Back up first (Admin
Settings → Backup, or `appsmithctl backup`): Appsmith migrates its data on the
first start of a new version.
