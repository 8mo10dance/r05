FROM ruby:2.7.5

ARG RAILS_DATABASE_HOST
ARG RAILS_DATABASE_PASSWORD

ENV TZ Asia/Tokyo
ENV BUNDLER_VERSION 2.3.6
ENV RAILS_ENV production
ENV SECRET_KEY_BASE dummy

RUN gem install bundler -v "${BUNDLER_VERSION}"
COPY Gemfile Gemfile.lock ./
RUN bundle config set --local without 'development test'; \
    bundle install

COPY . .
RUN bundle exec rake db:create
RUN bundle exec rake db:migrate
RUN bundle exec rails assets:precompile

RUN chmod 744 /startup.sh

CMD ["/startup.sh"]
