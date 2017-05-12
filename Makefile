.PHONY: image test

IMAGE_NAME ?= codeclimate/codeclimate-rubocop

docs:
	docker run --rm \
		--workdir /usr/src/app \
		--volume $(PWD):/usr/src/app \
		$(IMAGE_NAME) sh -c "bundle exec rake docs:scrape"

image:
	docker build --rm -t $(IMAGE_NAME) .

test: image
	docker run --rm $(IMAGE_NAME) sh -c "cd /usr/src/app && bundle exec rake"
