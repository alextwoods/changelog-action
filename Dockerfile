# Container image that runs your code
FROM ruby

COPY Gemfile ./
RUN bundle install

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.rb /entrypoint.rb

# Code file to execute when the docker container starts up (`entrypoint.rb`)
ENTRYPOINT ["/entrypoint.rb"]
