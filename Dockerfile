FROM ruby:2.7.5

ARG SECRET_KEY_BASE

ENV TZ Asia/Tokyo
ENV BUNDLER_VERSION 2.3.6
ENV RAILS_ENV production
ENV SECRET_KEY_BASE ${SECRET_KEY_BASE}

RUN gem install bundler -v "${BUNDLER_VERSION}"
COPY Gemfile Gemfile.lock ./
RUN bundle config set --local without 'development test'; \
    bundle install

COPY . .
RUN bundle exec rails assets:precompile

CMD ["bundle", "exec", "puma"]
