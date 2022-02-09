FROM ruby:2.6.3

RUN apt-get update -qq && apt-get install -y build-essential bundler nodejs postgresql-client
RUN gem update --system

WORKDIR /clinical

COPY . /clinical
COPY Gemfile /clinical/Gemfile
COPY Gemfile.lock /clinical/Gemfile.lock

RUN bundle install

EXPOSE 3000

# Configure the main process to run when running the image
CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0"]
