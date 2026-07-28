# Deploy and Host Appsmith on Railway

Appsmith is an open-source low-code platform for building internal tools, dashboards, admin panels, and business applications. It combines drag-and-drop UI widgets with database and API connectors, JavaScript customization, Git-based workflows, and application sharing so teams can ship data-driven tools without building every interface from scratch.

## About Hosting Appsmith

Hosting Appsmith on Railway runs the official Community Edition v2.2 image as a single stateful service. The image supervises the web editor, Java backend, real-time service, MongoDB, Redis, and supporting PostgreSQL process internally. Railway routes HTTPS traffic to Appsmith's HTTP port 80, checks readiness at `/api/v1/health`, and mounts a persistent volume at `/appsmith-stacks` for databases, configuration, Git checkouts, and backups. The template generates independent encryption password, encryption salt, and Supervisor credentials; sets the public base URL from Railway's generated domain; disables telemetry; restricts framing to the same origin; and requires an administrator email while keeping public signup disabled.

## Common Use Cases

- Build internal admin panels and operational dashboards
- Create database-backed CRUD tools and approval workflows
- Connect APIs, databases, and SaaS services through a visual application builder

## Dependencies for Appsmith Hosting

- Official `appsmith/appsmith-ce:v2.2` single-container image with embedded application and data services
- Railway persistent volume mounted at `/appsmith-stacks`

### Deployment Dependencies

- [Appsmith Docker installation guide](https://docs.appsmith.com/getting-started/setup/installation-guides/docker)
- [Appsmith environment-variable reference](https://docs.appsmith.com/getting-started/setup/environment-variables)
- [Appsmith v2.2 Umbrel manifest and Compose package](https://github.com/getumbrel/umbrel-apps/tree/master/appsmith)

## Implementation Details

- **Image:** `appsmith/appsmith-ce:v2.2` (resolved source digest `sha256:dc17b968c88eebf42b85c2e22b97efb55f2339b2d685e48f804c5f87bdd9d4e5` during verification)
- **Networking:** Railway public HTTPS domain targeting Appsmith's official HTTP port `80`; the Supervisor port is not published
- **Health check:** `/api/v1/health` with a 600-second startup allowance
- **Persistence:** one volume mounted at `/appsmith-stacks`
- **Security:** independent generated encryption secrets, generated Supervisor password, same-origin frame policy, telemetry disabled, public signup disabled, and a required administrator-email input

## Why Deploy Appsmith on Railway?

Railway is a singular platform to deploy your infrastructure stack. Railway will host your infrastructure so you don't have to deal with configuration, while allowing you to vertically and horizontally scale it.

By deploying Appsmith on Railway, you are one step closer to supporting a complete full-stack application with minimal burden. Host your servers, databases, AI agents, and more on Railway.
