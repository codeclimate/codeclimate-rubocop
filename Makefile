.PHONY: image test docs

IMAGE_NAME ?= codeclimate/codeclimate-rubocop

image:
	docker build --rm -t $(IMAGE_NAME) .

test: image
	docker run --rm $(IMAGE_NAME) sh -c "cd /usr/src/app && bundle exec rake"

docs: image
	docker run --rm \
		--user root \
		--workdir /usr/src/app \
		--volume $(PWD):/usr/src/app \
		$(IMAGE_NAME) sh -c "apk --update add git && rake docs:scrape"
