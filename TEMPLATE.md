# Appsmith Railway Template — Draft Audit and Manual Publication Package

The Appsmith source deployment is healthy, persistent, and safely configured, and an unpublished project-derived template draft exists. Automated publication stopped at the reconciliation gate because Railway's generator removed required safe defaults, omitted the public domain marker, and omitted the 600-second health-check timeout. No source secret value is included in this repository.

**Publication will be performed manually.**

## Template identity and requested metadata

| Item | Value |
| --- | --- |
| Title | `Appsmith` |
| Template ID | `00e8cdd2-c7eb-4d9e-bb4e-56f4b3f2920b` |
| Draft code | `CJ_jFB` |
| Editor URL | https://railway.com/workspace/templates/00e8cdd2-c7eb-4d9e-bb4e-56f4b3f2920b |
| Status | `UNPUBLISHED` |
| Category | `Starters` |
| Description | `Low-code platform for internal tools, dashboards, and admin panels.` |
| Workspace | Agastya Fauzan Alfath's Projects (`017da116-eee8-4131-a3a0-2f2d3de455f5`) |
| Source project | `Appsmith` (`3d1f3a0a-1344-45ae-8d4f-e5d15f92e671`) |
| Source environment | `production` (`ebaafac2-37c5-4cd5-a896-e4e36dee8b6b`) |
| Source service | `Appsmith` (`da395b6d-76eb-4604-9b7b-20f60d320b83`) |
| Verified source URL | https://appsmith-production-05d9.up.railway.app |

This is a community-maintained deployment template and does not imply affiliation with or endorsement by Appsmith.

## Official icon handoff

- Canonical source: https://avatars.githubusercontent.com/u/67620218?s=512&v=4
- Provenance: the official `appsmithorg` GitHub organization avatar.
- Targets: the `Appsmith` template and `Appsmith` service.
- Verification: HTTP 200, `image/png`, 460 × 460 pixels, RGBA with transparency; suitable for a 1:1 marketplace card.
- Attribution: Appsmith name and logo belong to Appsmith; no affiliation or endorsement is claimed.

## Verified source service graph

- Image: `appsmith/appsmith-ce:v2.2`; Railway resolved digest `sha256:dc17b968c88eebf42b85c2e22b97efb55f2339b2d685e48f804c5f87bdd9d4e5`, matching Umbrel's v2.2 pin.
- Public HTTP: Railway domain routes to official container port `80`; port `9001` for Supervisor is not public.
- Volume: `appsmith-volume` (`26de0b8c-36af-4ffd-b897-4b5121f7aed0`) mounted at `/appsmith-stacks`.
- Health: `/api/v1/health`, 600-second timeout, `ON_FAILURE` restart policy with 10 retries.
- Source security: signup disabled, telemetry disabled, same-origin frame policy, secure public base URL, independent generated encryption password and salt, and generated Supervisor password.

The Appsmith fat container reported `backend`, `editor`, `mongodb`, `postgres`, `redis`, `rts`, and `stdout` as `RUNNING`. Startup migrations completed, the backend connected to MongoDB 7.0.37, the RTS health check succeeded, Redis persisted successfully, the public health endpoint returned HTTP 200 with `All systems are up`, and the UI returned HTTP 200 with title `Appsmith`. A marker written under `/appsmith-stacks` survived a Railway restart and was then removed.

## Draft reconciliation audit

The project-derived draft correctly retained:

- exact title and service name `Appsmith`;
- image `appsmith/appsmith-ce:v2.2`;
- volume mount `/appsmith-stacks`;
- health path `/api/v1/health`;
- `ON_FAILURE` restart policy with 10 retries; and
- the safe composed `APPSMITH_BASE_URL` Railway reference.

The generator created all eight source variable keys but stripped the defaults for `PORT`, both encryption values, the Supervisor password, telemetry, signup, and frame ancestors. It also omitted the public service-domain marker and the 600-second health timeout. The secure template additionally requires the no-default `APPSMITH_ADMIN_EMAILS` deployer input so signup can remain disabled. Because the available API exposes no supported template-config mutation for reconciling these fields, the publication gate failed and no publish command was run.

## Raw variables — exact namespace `Appsmith`

```text
PORT=80
APPSMITH_BASE_URL=https://${{Appsmith.RAILWAY_PUBLIC_DOMAIN}}
APPSMITH_ENCRYPTION_PASSWORD=${{secret(64, "abcdef0123456789")}}
APPSMITH_ENCRYPTION_SALT=${{secret(64, "abcdef0123456789")}}
APPSMITH_SUPERVISOR_PASSWORD=${{secret(64, "abcdef0123456789")}}
APPSMITH_DISABLE_TELEMETRY=true
APPSMITH_ALLOWED_FRAME_ANCESTORS='self'
APPSMITH_SIGNUP_DISABLED=true
APPSMITH_ADMIN_EMAILS=
```

### Variable inventory — exact namespace `Appsmith`

| Key | Description | State | Manual publisher instruction |
| --- | --- | --- | --- |
| `PORT` | Official Appsmith HTTP port and Railway health-check port. | Required; safe literal; default stripped | Set to `80`. |
| `APPSMITH_BASE_URL` | Public HTTPS origin used to validate sensitive authentication flows. | Required; composed Railway reference; preserved | Keep exactly `https://${{Appsmith.RAILWAY_PUBLIC_DOMAIN}}`. |
| `APPSMITH_ENCRYPTION_PASSWORD` | High-entropy password used to encrypt datasource credentials. | Required; generated secret; default stripped | Paste the 64-character hexadecimal template function exactly once. Never copy the source value. |
| `APPSMITH_ENCRYPTION_SALT` | Independent high-entropy salt used with the encryption password. | Required; generated secret; default stripped | Paste its own 64-character hexadecimal template function. Do not reference or reuse the password. |
| `APPSMITH_SUPERVISOR_PASSWORD` | Password for the embedded Supervisor management UI, which remains non-public. | Required; generated secret; default stripped | Paste the 64-character hexadecimal template function. Never publish port 9001. |
| `APPSMITH_DISABLE_TELEMETRY` | Disables anonymous Appsmith usage telemetry. | Required; safe literal; default stripped | Set to `true`. |
| `APPSMITH_ALLOWED_FRAME_ANCESTORS` | Restricts embedding to the Appsmith instance's own origin. | Required; safe literal; default stripped | Set exactly to `'self'`, including the single quotes. |
| `APPSMITH_SIGNUP_DISABLED` | Prevents arbitrary users from registering on the public instance. | Required; safe literal; default stripped | Set to `true`; do not enable unrestricted signup by default. |
| `APPSMITH_ADMIN_EMAILS` | Email address(es) allowed to create and administer the instance while signup is disabled. | Required; deployer input; missing from draft | Add as a required variable with no default. Tell deployers to enter their administrator email; comma-separate multiple addresses. Do not put a real email in the template default. |

No source-project secret or personal email appears above. Each generated secret is independent because these values serve different security purposes.

## Copy-ready service and marketplace descriptions

- Marketplace description: `Low-code platform for internal tools, dashboards, and admin panels.`
- `Appsmith` service description: `Appsmith CE v2.2 with embedded data services and persistent Railway storage.`
- Marketplace overview: copy [README.md](./README.md) verbatim.

## Remaining manual publication actions

1. Open the template editor and select the `Appsmith` service namespace.
2. Paste the raw variable block, converting `APPSMITH_ADMIN_EMAILS=` into a required deployer input with no default; add every inventory description and keep all nine keys required.
3. Add a public service domain targeting port `80` and verify the Supervisor port `9001` remains private.
4. Set the health check to `/api/v1/health` with a 600-second timeout; retain `ON_FAILURE` with 10 retries and `/appsmith-stacks` persistence.
5. Apply the official icon, exact title, `Starters` category, exact short description, service description, and README overview supplied here.
6. Re-audit `serializedConfig`: every key must have the exact safe literal, Railway reference, template function, or explicit no-default input above; verify no source value or personal email appears.
7. Deploy the reconciled draft into a new disposable project. Confirm the admin-email prompt appears, all references and generated values resolve, all embedded processes run, health/UI succeed, same-origin CSP remains, arbitrary signup fails, and volume data survives a restart.
8. Only after those checks pass, obtain final publication approval and run the Railway template publication action.
9. The manual publisher owns cleanup of the disposable test project and any unused source resources after publication evidence is recorded.

## Commands and evidence summary

- `railway templates create --project 3d1f3a0a-1344-45ae-8d4f-e5d15f92e671 --environment ebaafac2-37c5-4cd5-a896-e4e36dee8b6b --json` created draft `CJ_jFB`.
- GraphQL `template(id:) { serializedConfig }` audit produced the reconciliation findings above without printing source variable values.
- GraphQL `serviceInstance` audit confirmed exact image, resolved digest, volume, health path/timeout, and successful deployment.
- `curl` checks returned HTTP 200 for `/api/v1/health` and `/`; CSP is `frame-ancestors 'self'` and `X-Content-Type-Options` is `nosniff`.
- `supervisorctl status` after a Railway restart reported all seven listed processes `RUNNING`.
- Persistence marker survived restart and was removed.
- No automated template publication command was run.
