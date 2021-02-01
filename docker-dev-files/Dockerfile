FROM ruby:2.7

USER root

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update -qq && apt-get install -y \
    nodejs \
    yarn

ENV LANG=en_US.UTF-8 \
    GEM_HOME=/bundle
ENV BUNDLE_PATH=$GEM_HOME
ENV BUNDLE_APP_CONFIG=$BUNDLE_PATH \
    BUNDLE_BIN=$BUNDLE_PATH/bin
ENV PATH /app/bin:$BUNDLE_BIN:$PATH

RUN gem update --system --no-document
RUN gem update bundler --no-document

COPY ./Gemfile /app/Gemfile
COPY ./.ruby-version /app/.ruby-version

WORKDIR /app

CMD ["/bin/bash"]