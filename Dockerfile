FROM ruby:2.4-alpine

WORKDIR /usr/src/app

RUN adduser -u 9000 -D app

COPY Gemfile Gemfile.lock /usr/src/app/

RUN apk add --update build-base && \
    gem install bundler && \
    bundle install --quiet -j 4 --without=test && \
    chown -R app:app /usr/local/bundle && \
    rm -fr ~/.gem ~/.bundle ~/.wh..gem && \
    apk del build-base

COPY . /usr/src/app
RUN chown -R app:app .

USER app

VOLUME /code
WORKDIR /code

CMD ["/usr/src/app/bin/codeclimate-rubocop"]
