# Create a Jekyll container from a Ruby Alpine image
# Credit to https://github.com/BillRaymond/my-jekyll-docker-website

FROM ruby:2.7-alpine3.15
# FROM ruby:3.0.3-alpine3.15

WORKDIR /workspaces/site

# Add Jekyll dependencies to Alpine
RUN apk update
RUN apk add --no-cache build-base gcc cmake git

# Update the Ruby bundler and install Jekyll
RUN gem update bundler && gem install bundler jekyll

# Copy Gemfiles or build them
# build
# RUN bundle init
# copy
COPY Gemfiles* ./

# RUN bundle add jekyll --version "3.9.2"

RUN bundle install 
RUN bundle update

# build the new Jekyll site framework
RUN bundle exec jekyll new --force --skip-bundle .
RUN bundle add webrick
RUN bundle install
RUN bundle update
