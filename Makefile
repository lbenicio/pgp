.PHONY: deploy sync invalidate all

deploy:
	aws cloudformation deploy \
		--region sa-east-1 \
		--stack-name pgp \
		--template-file cloudformation.yml \
		--tags awsApplication=arn:aws:resource-groups:sa-east-1:527540700211:group/lbenicio-community/06owkw4s6gp5r894wctvv2jj5u

sync:
	aws s3 sync dist/ s3://pgp.lbenicio.dev/ --delete

invalidate:
	aws cloudfront create-invalidation \
		--distribution-id EL38J3G514874 \
		--paths "/*"

all: deploy sync invalidate
