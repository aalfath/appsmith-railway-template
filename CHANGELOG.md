# Changelog

Deployers of the Railway template get an "update available" notice when this
repo's `main` changes. Read the entry before you apply an update.

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
