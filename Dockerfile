FROM ruby:3.3

RUN apt-get update && \
    apt-get install -y build-essential && \
    apt-get install -y nodejs

RUN gem install bundler -v 2.4.22

WORKDIR /app

COPY beautiful-jekyll-theme.gemspec Gemfile Gemfile.lock ./


# RUN bundle config set force_ruby_platform true

# RUN gem install nokogiri -v 1.15.5 --platform=ruby

RUN bundle install
COPY . .

EXPOSE 4000

CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
