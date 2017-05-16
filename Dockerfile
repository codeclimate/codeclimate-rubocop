FROM ruby:2.3-alpine

WORKDIR /usr/src/app
COPY Gemfile /usr/src/app/
COPY Gemfile.lock /usr/src/app/

RUN gem update --system && \
    gem install bundler && \
    bundle install -j 4 && \
    rm -fr /usr/share/ri

RUN apk --update add git

RUN adduser -u 9000 -D app
COPY . /usr/src/app
RUN chown -R app:app /usr/src/app

USER app

VOLUME /code
WORKDIR /code

CMD ["/usr/src/app/bin/codeclimate-rubocop"]
