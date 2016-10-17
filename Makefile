.PHONY: image test release

RELEASE_REGISTRY ?= codeclimate
RELEASE_TAG ?= latest

image:
	docker build --tag codeclimate/codeclimate-rubocop .

test:
	docker run --workdir /usr/src/app \
	  codeclimate/codeclimate-rubocop bundle exec rake

release:
	test -n "$(RELEASE_TAG)"
	docker tag codeclimate/codeclimate-rubocop \
	  $(RELEASE_REGISTRY)/codeclimate-rubocop:$(RELEASE_TAG)
	docker push $(RELEASE_REGISTRY)/codeclimate-rubocop:$(RELEASE_TAG)
