FROM ruby:2.7.2-alpine3.13

USER root

RUN apk update \
    && apk upgrade \
    && apk add --update --no-cache \
    build-base \
    git \
    sqlite-dev \
    tzdata \
    nodejs \
    yarn

ENV LANG=en_US.UTF-8 \
    GEM_HOME=/bundle
ENV BUNDLE_PATH=$GEM_HOME
ENV BUNDLE_APP_CONFIG=$BUNDLE_PATH \
    BUNDLE_BIN=$BUNDLE_PATH/bin
ENV PATH /app/bin:$BUNDLE_BIN:$PATH

RUN yarn install

RUN gem update --system --no-document
RUN gem update bundler --no-document

RUN addgroup -S unprivileged && adduser -S unprivileged -G unprivileged

USER unprivileged

# Switching 'USER' only works for: CMD, RUN, and ENTRYPOINT, for others use 'chown':
COPY --chown=unprivileged ./Gemfile /app/Gemfile
COPY --chown=unprivileged ./.ruby-version /app/.ruby-version

WORKDIR /app

CMD ["/bin/sh"]