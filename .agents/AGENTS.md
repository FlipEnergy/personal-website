# personal-website — agent context

Hugo static blog/homepage for https://pleasenoddos.com (owner: FlipEnergy / Dennis Zhang). Mostly posts about the owner's homelab.

## Ground rules for agents (read first)

**Secrets**
- Never commit secrets: credentials, tokens, private keys, kubeconfigs, `.tfvars`, decrypted sops output, or anything that looks like one. If a change would add one, stop and ask.
- Before committing, review the staged diff (`git diff --cached`) for secret-looking values and for files that should be ignored. Never use `git add -f` on an ignored file, and never weaken `.gitignore` to make a file committable.
- Never put secret values into tracked files, commit messages, PR descriptions, logs, or chat output — not even partially or "redacted by hand".
- Encrypted files (`*.enc.yml`, sops `*-secrets.yaml`) may be read as-is, but only change them with the proper tool (`sops`); never decrypt them unless asked.

**Git-ignored files**
- Do not read, print, search, or open git-ignored files directly unless the user specifically asks for that file. They are often local secrets or decrypted copies (e.g. `*.dec.yml`, `*.yaml.dec`, `terraform.tfvars`, `backend.tf`, `*.key`, `*.pem`).
- Exclude them from searches (prefer `git ls-files` / `git grep`, or tools that respect `.gitignore`). Check with `git check-ignore -v <path>` if unsure.
- Generated build output that is ignored (e.g. `public/`, `.terraform/`) may be listed, but still don't read its contents unless needed for the task and asked.

## Layout

| Path | Purpose |
|---|---|
| `flipenergy/` | Hugo site root (`config.toml`, `content/post/`, `layouts/`, `static/`, `archetypes/`). |
| `flipenergy/themes/base16` | Git **submodule**: htdvisser/hugo-base16-theme. Clone with `--recursive` or run `git submodule update --init`. Don't edit theme files; override in `flipenergy/layouts/` instead. |
| `flipenergy/layouts/` | Local overrides: `404.html`, `partials/{header,hero,homepage,footer}.html`. |
| `flipenergy/static/` | `css/style.css`, images (`img/homelab.jpg` is linked from other repos' READMEs — keep the path stable), favicon. |
| `Dockerfile` | `nginx:stable`, copies `public/` + `nginx.conf`. Build context expects a top-level `public/` (CI copies `flipenergy/public` there). |
| `nginx.conf` | Serves static files on port 80 with custom 404. |
| `helm_chart/values.yaml` | Values for `bjw-s/app-template` used by CI deploy (image `flipenergy/flipenergy`, hosts `pleasenoddos.com` + `www.`). |
| `docker-compose.yml` | Runs the published image locally on port 80. |

## Posts

- Path: `flipenergy/content/post/<slug>.md`; images go in `flipenergy/content/post/<slug>/` and are referenced relatively.
- Front matter: `title`, `date`, `draft`. New posts: `make new name=<slug>` (archetype sets `draft: true` — flip it to `false` to publish).
- Hugo version used locally is 0.96.0 (`make install-hugo`); CI uses `klakegg/hugo:alpine`. Avoid features newer than 0.96.

## Commands

- `make up` — `hugo server -D` (dev server, drafts included).
- `make new name=<slug>` — new post.
- `make dc-up` / `dc-stop` / `dc-down` — run the published image with docker-compose.

## Build & deploy (CI)

Handled by the `personal-sites` pipeline in sibling `concourse-pipelines` (`personal-websites/`):
push to `main` → `hugo` in `flipenergy/` → copy `public` to repo root → OCI build → push `flipenergy/flipenergy:latest` + `<short_ref>` → `helm upgrade -i` release `dennis-site` with `helm_chart/values.yaml`, image tag set to the commit short ref.
Changes to only `Makefile`, `README.md`, `.gitignore`, `renovate.json` don't trigger a build.

## Notes

- `flipenergy/public/` and `notes.md` are gitignored build output / scratch.
- DNS for the domain is in `tf-playground`; the cert issuer `letsencrypt-homelab` and ingress-nginx come from `k8s-homelab`.
