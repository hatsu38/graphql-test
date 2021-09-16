FROM ruby:3.0.2 AS base

WORKDIR /app

ENV LANG C.UTF-8
ENV RAILS_ENV development
ENV RACK_ENV development
ENV NODE_MAJOR_VERSION 14
ENV BUNDLE_PATH vendor/bundle

RUN gem update --system && gem install bundler:2.2.27

# builder
FROM base AS builder

RUN curl -sL https://deb.nodesource.com/setup_$NODE_MAJOR_VERSION.x | bash - && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo 'deb http://dl.yarnpkg.com/debian/ stable main' > /etc/apt/sources.list.d/yarn.list && \
    apt-get update -qq && \
    apt-get install -y --no-install-recommends \
    vim locales build-essential curl libpq-dev libmariadb-dev nodejs yarn

# bundle
FROM builder AS bundle

COPY Gemfile Gemfile.lock /app/
RUN bundle install --jobs=4 --retry=3

# yarn
FROM builder AS yarn

COPY package.json yarn.lock /app/
RUN yarn install --frozen-lockfile

# main
FROM builder AS main

COPY . /app/

COPY --from=bundle /app/vendor/bundle /app/vendor/bundle
COPY --from=yarn /app/node_modules /app/node_modules

EXPOSE 3000