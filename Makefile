.PHONY: image test docs bundle

IMAGE_NAME ?= codeclimate/codeclimate-rubocop

image:
	docker build --rm -t $(IMAGE_NAME) .

test: image
	docker run --rm $(IMAGE_NAME) sh -c "cd /usr/src/app && bundle install --with=test && bundle exec rake"

docs: image
	docker run --rm \
		--user root \
		--workdir /usr/src/app \
		--volume $(PWD):/usr/src/app \
		$(IMAGE_NAME) sh -c "apk --update add git && bundle install --with=test && bundle exec rake docs:scrape"

bundle:
	docker run --rm \
	  --entrypoint /bin/sh \
	  --volume $(PWD):/usr/src/app \
	  $(IMAGE_NAME) -c "cd /usr/src/app && bundle $(BUNDLE_ARGS)"