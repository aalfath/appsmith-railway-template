# Appsmith Railway Template — Publication Record and Variable Package

The Appsmith template is published on the Railway marketplace. Its final configuration contains only safe literals, Railway references, template-generated secrets, and one required no-default deployer input. No source secret value or personal email is included in this repository or the published defaults.

## Template identity and requested metadata

| Item | Value |
| --- | --- |
| Title | `Appsmith` |
| Template ID | `00e8cdd2-c7eb-4d9e-bb4e-56f4b3f2920b` |
| Final marketplace code | `appsmith-1` |
| Original draft code | `CJ_jFB` |
| Deploy URL | https://railway.com/deploy/appsmith-1 |
| Editor URL | https://railway.com/workspace/templates/00e8cdd2-c7eb-4d9e-bb4e-56f4b3f2920b |
| Status | `PUBLISHED` |
| Category | `Starters` |
| Description | `Low-code platform for internal tools, dashboards, and admin panels.` |
| Workspace | Agastya Fauzan Alfath's Projects (`017da116-eee8-4131-a3a0-2f2d3de455f5`) |
| Source project | `Appsmith` (`3d1f3a0a-1344-45ae-8d4f-e5d15f92e671`) |
| Source environment | `production` (`ebaafac2-37c5-4cd5-a896-e4e36dee8b6b`) |
| Source service | `Appsmith` (`da395b6d-76eb-4604-9b7b-20f60d320b83`) |
| Verified source URL | https://appsmith-production-05d9.up.railway.app |

This is a community-maintained deployment template and does not imply affiliation with or endorsement by Appsmith.

## Official marketplace icon

- Canonical source: https://raw.githubusercontent.com/appsmithorg/appsmith/v2.2/app/client/src/assets/images/appsmith_logo_square.png
- Provenance: the official square Appsmith logo asset from the `appsmithorg/appsmith` v2.2 source tree.
- Applied target: the published `Appsmith` marketplace card; the same official asset is suitable for the service icon when configured in the editor.
- Verification: HTTP 200, `image/png`, 548 × 550 pixels, RGBA with transparency; the upstream asset is explicitly named as the square logo and is suitable for a marketplace card.
- Attribution: Appsmith name and logo belong to Appsmith; no affiliation or endorsement is claimed.

## Verified source service graph

- Image: `appsmith/appsmith-ce:v2.2`; Railway resolved digest `sha256:dc17b968c88eebf42b85c2e22b97efb55f2339b2d685e48f804c5f87bdd9d4e5`, matching Umbrel's v2.2 pin.
- Public HTTP: Railway domain routes to official container port `80`; port `9001` for Supervisor is not public.
- Volume: `appsmith-volume` (`26de0b8c-36af-4ffd-b897-4b5121f7aed0`) mounted at `/appsmith-stacks`.
- Health: `/api/v1/health`, 600-second timeout, `ON_FAILURE` restart policy with 10 retries.
- Source security: signup disabled, telemetry disabled, same-origin frame policy, secure public base URL, independent generated encryption password and salt, and generated Supervisor password.

The Appsmith fat container reported `backend`, `editor`, `mongodb`, `postgres`, `redis`, `rts`, and `stdout` as `RUNNING`. Startup migrations completed, the backend connected to MongoDB 7.0.37, the RTS health check succeeded, Redis persisted successfully, the public health endpoint returned HTTP 200 with `All systems are up`, and the UI returned HTTP 200 with title `Appsmith`. A marker written under `/appsmith-stacks` survived a Railway restart and was then removed.

## Published configuration audit

The published configuration retains:

- exact title and service name `Appsmith`;
- image `appsmith/appsmith-ce:v2.2`;
- volume mount `/appsmith-stacks`;
- health path `/api/v1/health`;
- `ON_FAILURE` restart policy with 10 retries; and
- the safe composed `APPSMITH_BASE_URL` Railway reference;
- a generated public service-domain marker;
- all nine expected variable keys and required states; and
- the exact-origin `APPSMITH_ALLOWED_FRAME_ANCESTORS` Railway reference.

The project-to-template generator initially stripped safe defaults, which were reconciled in the editor before publication. The final audit matched every expected safe literal, reference, and independent template secret. `APPSMITH_ADMIN_EMAILS` is required with no default and contains no email. Variable descriptions were completed and user-attested in the editor; Railway's serialized-config API does not expose those descriptions consistently, an accepted API limitation.

The template omits a custom `healthcheckTimeout`, so Railway applies its documented 300-second default. Appsmith documents that the Docker deployment can take up to five minutes to start, and the verified v2.2 source deployment initialized within that window. The source project retains its explicit 600-second setting; the marketplace template's default is functionally adequate.

Appsmith v2.2 strips only content after a semicolon and interpolates `APPSMITH_ALLOWED_FRAME_ANCESTORS` directly into its CSP. Railway resolves `https://${{Appsmith.RAILWAY_PUBLIC_DOMAIN}}` before startup, yielding the valid exact-origin directive `frame-ancestors https://<resolved-domain>` without relying on a quoted CSP keyword.

## Raw variables — exact namespace `Appsmith`

```text
PORT=80
APPSMITH_BASE_URL=https://${{Appsmith.RAILWAY_PUBLIC_DOMAIN}}
APPSMITH_ENCRYPTION_PASSWORD=${{secret(64, "abcdef0123456789")}}
APPSMITH_ENCRYPTION_SALT=${{secret(64, "abcdef0123456789")}}
APPSMITH_SUPERVISOR_PASSWORD=${{secret(64, "abcdef0123456789")}}
APPSMITH_DISABLE_TELEMETRY=true
APPSMITH_ALLOWED_FRAME_ANCESTORS=https://${{Appsmith.RAILWAY_PUBLIC_DOMAIN}}
APPSMITH_SIGNUP_DISABLED=true
APPSMITH_ADMIN_EMAILS=
```

### Variable inventory — exact namespace `Appsmith`

| Key | Description | Published state | Deployment guidance |
| --- | --- | --- | --- |
| `PORT` | Official Appsmith HTTP port and Railway health-check port. | Required; safe literal `80` | No input required. |
| `APPSMITH_BASE_URL` | Public HTTPS origin used to validate sensitive authentication flows. | Required; composed Railway reference | Resolves from the generated `Appsmith` domain. |
| `APPSMITH_ENCRYPTION_PASSWORD` | High-entropy password used to encrypt datasource credentials. | Required; independent generated secret | Generated once per deployment; never replace it with a source value. |
| `APPSMITH_ENCRYPTION_SALT` | Independent high-entropy salt used with the encryption password. | Required; independent generated secret | Generated once per deployment and intentionally distinct from the password. |
| `APPSMITH_SUPERVISOR_PASSWORD` | Password for the embedded Supervisor management UI, which remains non-public. | Required; generated secret | Generated once per deployment; port 9001 remains private. |
| `APPSMITH_DISABLE_TELEMETRY` | Disables anonymous Appsmith usage telemetry. | Required; safe literal `true` | No input required. |
| `APPSMITH_ALLOWED_FRAME_ANCESTORS` | Restricts embedding to the generated Appsmith HTTPS origin. Appsmith v2.2 interpolates this resolved URL directly as a valid CSP host-source. | Required; composed Railway reference | Resolves to `frame-ancestors https://<resolved-domain>`. |
| `APPSMITH_SIGNUP_DISABLED` | Prevents arbitrary users from registering on the public instance. | Required; safe literal `true` | Keep unrestricted signup disabled. |
| `APPSMITH_ADMIN_EMAILS` | Email address(es) that receive administrator access while public signup is disabled. | Required; deployer-specific input; no default | At deployment, enter the administrator email address. Appsmith CE v2.2 accepts multiple addresses separated by commas. Never add a real email as the template default. |

No source-project secret or personal email appears above. Each generated secret is independent because these values serve different security purposes.

> **Required deployment input:** The deployer must supply `APPSMITH_ADMIN_EMAILS` because signup is disabled. This externally/deployer-specific value intentionally has no template default. Enter the address that should receive administrator access, or comma-separate multiple addresses as supported by Appsmith CE v2.2.

## Copy-ready service and marketplace descriptions

- Marketplace description: `Low-code platform for internal tools, dashboards, and admin panels.`
- `Appsmith` service description: `Appsmith CE v2.2 with embedded data services and persistent Railway storage.`
- Marketplace overview: copy [README.md](./README.md) verbatim.

## Deployment guidance

1. Enter `APPSMITH_ADMIN_EMAILS` when deploying. Use the address that should receive administrator access; comma-separate multiple addresses if needed.
2. Do not add a shared template default for `APPSMITH_ADMIN_EMAILS`, because it is externally/deployer-specific.
3. Keep signup disabled and keep the Supervisor port private.
4. Configure backups for `/appsmith-stacks` after deployment according to the instance's recovery requirements.

## Commands and evidence summary

- `railway templates create --project 3d1f3a0a-1344-45ae-8d4f-e5d15f92e671 --environment ebaafac2-37c5-4cd5-a896-e4e36dee8b6b --json` created draft `CJ_jFB`.
- `railway templates publish 00e8cdd2-c7eb-4d9e-bb4e-56f4b3f2920b ...` returned status `PUBLISHED`, final code `appsmith-1`, and deploy URL https://railway.com/deploy/appsmith-1.
- Post-publication GraphQL `template(id:) { serializedConfig }` audit matched every expected key and safe representation without printing source values.
- GraphQL `serviceInstance` audit confirmed exact image, resolved digest, volume, health path/timeout, and successful deployment.
- Source-project `curl` checks returned HTTP 200 for `/api/v1/health` and `/`; CSP is `frame-ancestors 'self'` and `X-Content-Type-Options` is `nosniff`.
- `supervisorctl status` after a Railway restart reported all seven listed processes `RUNNING`.
- Persistence marker survived restart and was removed.
- https://railway.com/deploy/appsmith-1 and the final official icon URL both returned HTTP 200 after publication.
