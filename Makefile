.PHONY: deploy

deploy:
	test -n "${CLOUDFLARE_API_TOKEN}" || (echo "Set CLOUDFLARE_API_TOKEN" >&2; exit 1)
	test -n "${CLOUDFLARE_ACCOUNT_ID}" || (echo "Set CLOUDFLARE_ACCOUNT_ID" >&2; exit 1)
	npx --yes wrangler@4 deploy --config wrangler.toml
