# Changelog

Deployers of the Railway template get an "update available" notice when this
repo's `main` changes. Read the entry before you apply an update.

## 2.7.2 (2026-11-21): security release

- No breaking changes. Apps, workspaces and users in the embedded MongoDB on the `/appsmith-stacks` volume are kept; Appsmith runs its own migrations at start.
- Appsmith [v2.7.2](https://github.com/appsmithorg/appsmith/releases/tag/v2.7.2) bundles Eclipse Temurin 25.0.5.1, which fixes [CVE-2026-114938](https://nvd.nist.gov/vuln/detail/CVE-2026-114938) ("Java4Shell") in the Java runtime. Upstream says every earlier Appsmith image has an affected Java version, so apply this update.
- Image: `appsmith/appsmith-ce:v2.7.2@sha256:1f456089b75edec495c005f0e94858aa5c6d1408fcac5f7c1e2d85d69bd1592d`.

## 2.7.1 (2026-11-19)

- No breaking changes. Apps, workspaces and users in the embedded MongoDB on the `/appsmith-stacks` volume are kept; Appsmith runs its own migrations at start.
- Appsmith [v2.7.1](https://github.com/appsmithorg/appsmith/releases/tag/v2.7.1): security fixes and bug fixes.
- Image: `appsmith/appsmith-ce:v2.7.1@sha256:0d2f4d4122b47e0a0b80fe7681d7bf8dfb4b14ccb9f6ee3e6092968c22c04b15`.

## 2.7.0-railway.2 (2026-11-16)

- README: Deploy on Railway button linking to the published template `appsmith-1`. No change to the app or its config.

## 2.7.0-railway.1 (2026-11-16)

**Breaking for existing image-based deploys:** none. This is the first release
of the repo build. Deploys made from the older image-based template
(`appsmith/appsmith-ce:v2.2`) don't receive updates from this repo; to move
one, back up from Appsmith's Admin Settings, redeploy the template, and restore.

- Builds from this repo instead of running the Docker image directly, so
  Railway can tell deployers about updates.
- Appsmith CE `v2.7.0`, pinned by digest
  `sha256:ba7e575a188f64aa83e646d532673304626825353dd47727e021f9b42bd53833`
  (was `v2.2`).
- Documents the first login: sign up at `/user/signup` with the address from
  `APPSMITH_ADMIN_EMAILS`. Appsmith pre-creates that user as locked, so
  `/user/login` alone says "User account is locked".
- Removes the old `TEMPLATE.md` audit notes, which described v2.2.
