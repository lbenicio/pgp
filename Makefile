.PHONY: deploy

deploy:
	npx --yes wrangler@4 deploy --config wrangler.toml --account-id "${CLOUDFLARE_ACCOUNT_ID}"
