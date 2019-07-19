# Information for engine developers & contributors

## Testing local changes

To run the test suite, use `make test`.

Running `make image` will build `codeclimate/codeclimate-rubocop:latest`
locally. It's a good idea to use a locally-built image to QA engine changes
against real repos using the Code Climate CLI.

## Releasing a new version

If you are upgrading to a new version of RuboCop, please re-run the doc scraper
to get any new or updated docs:

```sh
docker run \
  --rm --volume "$PWD:/usr/src/app" --user root --workdir /usr/src/app \
  codeclimate/codeclimate-rubocop bundle exec rake docs:scrape
sudo chown -R $(id -u):$(id -g) config
```

You should add any new cops without docs that fail specs to
`spec/support/currently_undocumented_cops.txt`.

When doing QA, it's good to confirm the engine will run successfully when using
the default inferred configuration:

```sh
rm .rubocop.yml
codeclimate init --upgrade
codeclimate analyze -e rubocop
```

If configuration was changed in the release, this might not succeed, and the
default configuration will need to be updated.
