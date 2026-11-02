.PHONY: deploy sync invalidate all

deploy:
	aws cloudformation deploy \
		--region sa-east-1 \
		--stack-name pgp \
		--template-file cloudformation.yml \
		--parameter-overrides "CertificateArn=$${CERTIFICATE_ARN}" \
		--tags Project=pgp

sync:
	aws s3 sync dist/ s3://pgp.lbenicio.dev/ --delete

invalidate:
	aws cloudfront create-invalidation \
		--distribution-id "$$(aws cloudformation describe-stacks --stack-name pgp --query "Stacks[0].Outputs[?OutputKey=='CloudFrontDistributionId'].OutputValue | [0]" --output text)" \
		--paths "/*"

all: deploy sync invalidate
