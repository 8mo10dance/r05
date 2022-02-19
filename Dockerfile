FROM ruby:2.7.5

ENV TZ Asia/Tokyo
ENV BUNDLER_VERSION 2.3.6

RUN gem install bundler -v "${BUNDLER_VERSION}"
COPY Gemfile Gemfile.lock ./
RUN bundle config set --local without 'development test'; \
    bundle install

COPY . .
RUN bundle exec rails assets:precompile

CMD ["bundle", "exec", "puma"]
