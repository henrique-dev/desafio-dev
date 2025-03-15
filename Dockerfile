# Dockerfile development version
FROM ruby:3.3.4-alpine AS file_parser-development

RUN apk -U upgrade && apk add --no-cache curl postgresql-dev build-base tzdata bash gcompat git yaml-dev

ENV TZ=America/Sao_Paulo

WORKDIR /opt/app

COPY Gemfile Gemfile.lock ./

ENV LANG=C.UTF-8 \
    BUNDLE_JOBS=4 \
    BUNDLE_RETRY=3 \
    BUNDLE_PATH="/usr/local/bundle"

RUN rm -rf node_modules vendor && \
    gem install bundler && \
    bundle install && \
    rm -rf ~/.bundle/ "${BUNDLE_PATH}"/ruby/*/cache "${BUNDLE_PATH}"/ruby/*/bundler/gems/*/.git

COPY . .

COPY entrypoint.sh /usr/bin/entrypoint.sh
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["/usr/bin/entrypoint.sh"]

RUN adduser file_parser --disabled-password --shell /bin/bash && \
    chown -R file_parser:file_parser db log storage tmp
USER file_parser

CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
