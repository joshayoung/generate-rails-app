FROM ruby:2.7

ENV INSTALL_PATH /app
RUN mkdir -p /app
RUN gem install rails bundler
WORKDIR /app

CMD ["/bin/sh"]
