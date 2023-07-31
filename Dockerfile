FROM ruby:3.2-alpine3.18

LABEL name="Ruby-3.2" \
      version="1.0"

WORKDIR /usr/src/app

RUN adduser -u 9000 -D app

COPY Gemfile Gemfile.lock /usr/src/app/

RUN apk add --update build-base git && \
    bundle install --quiet -j 4 && \
    chown -R app:app /usr/local/bundle && \
    rm -fr ~/.gem ~/.bundle ~/.wh..gem && \
    gem cleanup

COPY . /usr/src/app
RUN chown -R app:app .

USER app

VOLUME /code
WORKDIR /code

CMD ["/usr/src/app/bin/codeclimate-rubocop"]
