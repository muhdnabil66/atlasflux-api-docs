# AtlasFlux API Documentation

Mintlify-powered documentation for the AtlasFlux Developer Platform API.

## Target

- **Production docs**: `https://api-docs.atlasflux.my`
- **API base**: `https://api.atlasflux.my`

## Requirements

- [Node.js](https://nodejs.org/) 18+
- [Mintlify CLI](https://mintlify.com/docs/installation)

## Local Development

```bash
npm install
npm run dev
```

Opens `http://localhost:3000` with live reload.

## Validate

```bash
npm run validate
```

Validates all docs.json paths and OpenAPI spec.

## Add a Page

1. Create an `.mdx` file in the appropriate directory.
2. Add the file path to `docs.json` navigation.

## Update Navigation

Edit the `navigation` array in `docs.json`. Each group contains a `group` name and a `pages` array of file paths (without `.mdx` extension).

## Update OpenAPI

Edit `openapi.json` directly. Mintlify generates interactive API reference and playground from this file.

## Deploy

- **GitHub**: Push to the main branch. Mintlify auto-deploys.
- **Custom domain**: Configure `api-docs.atlasflux.my` CNAME in your DNS.

## File Structure

```
docs/
├── docs.json           # Mintlify configuration
├── openapi.json        # OpenAPI 3.0.3 specification
├── introduction.mdx    # Getting started overview
├── quickstart.mdx      # Quick start guide
├── authentication.mdx  # Auth concepts
├── concepts/           # Core concept pages
├── guides/             # Step-by-step guides
├── api-reference/      # Reference docs
├── resources/          # Support, security, errors
└── snippets/           # Code examples
```
