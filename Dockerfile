FROM node:17-alpine AS client

WORKDIR /client

COPY ./client/package.json ./client/yarn.lock .
RUN yarn install

COPY ./client .
RUN yarn run build:prod


FROM ruby:2.7.5 AS rails

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
RUN RAILS_ENV=${RAILS_ENV} bundle exec rake db:migrate

COPY --from=client /app/javascript ./app/javascript
RUN bundle exec rails assets:precompile

RUN chmod 744 /startup.sh

CMD ["/startup.sh"]
