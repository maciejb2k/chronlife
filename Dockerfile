# Dockerfile for the production.

# Default Ruby version for this project.
ARG RUBY_VERSION=3.2.0

# Base image
FROM ruby:$RUBY_VERSION-alpine AS base

# Set environment variables
ENV USER app
ENV APP_DIR /app
ENV BUNDLER_VERSION 2.4.7
ENV GEM_HOME=/usr/local/bundle
ENV BUNDLE_PATH=$GEM_HOME
ENV BUNDLE_APP_CONFIG=$BUNDLE_PATH
ENV BUNDLE_JOBS 4
ENV BUNDLE_RETRY 3
ENV BUNDLE_WITHOUT development:test
ENV BUNDLE_CACHE_ALL true
ENV RACK_ENV production
ENV RAILS_ENV production
ENV RAILS_SERVE_STATIC_FILES true
ENV RAILS_LOG_TO_STDOUT=1
ENV PATH=$APP_DIR/bin:$PATH
ENV LANG C.UTF-8

# Add PostgreSQL, timezone libraries, nodejs and yarn.
RUN apk add --no-cache --update \
      libpq-dev \
      tzdata \
      nodejs \
      yarn \
    && rm -rf /var/cache/apk/*

# Start building a new image called "dependencies"
# from the "base" image.
FROM base AS dependencies

# Add libraries required for installing gems.
RUN apk add --no-cache  --update \
    build-base \
    git \
    && rm -rf /var/cache/apk/*

# Copy the Gemfile and Gemfile.lock
# files to the current directory.
COPY Gemfile Gemfile.lock package.json yarn.lock ./

# Install bundler with specified version.
RUN gem install bundler -v $BUNDLER_VERSION

# "frozen" option means that the exact versions of gems
# specified in the Gemfile.lock file will be used,
# and any updates to those gems will be ignored.
#
# Install gems with ENV options from above,
# remove unnecessary files from gems.
RUN bundle config --global frozen 1 && \
    bundle install && \
    yarn install --frozen-lockfile && \
    rm -rf $BUNDLE_PATH/cache/*.gem && \
    rm -rf $BUNDLE_PATH/ruby/*/cache && \
    find $BUNDLE_PATH/gems/ -name "*.c" -delete && \
    find $BUNDLE_PATH/gems/ -name "*.o" -delete

# Start building a new image from the "base" image.
FROM base

# Copy entrypoint, make it executable.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

# Add new user in the system.
RUN adduser -D $USER

# Create directory for rails application,
# set user as the owner.
RUN mkdir -p $APP_DIR && \
    chown $USER $APP_DIR

# Set the working directory to the app directory.
WORKDIR $APP_DIR

# Switch from root to specified user.
USER $USER

# Copy the bundle directory from the "dependencies"
# image and copy all files to the current directory,
# copy the node_modules directory from the "dependencies"
# sets the ownership to the specified user.
COPY --from=dependencies $BUNDLE_PATH $BUNDLE_PATH
COPY --chown=$USER --from=dependencies /node_modules/ node_modules/
COPY --chown=$USER . ./

# Precompile assets.
# Pass dummy value to SECRET_KEY_BASE as a workaround for error
RUN SECRET_KEY_BASE=1 bundle exec rake assets:precompile

# Expose port 3000 for the application.
EXPOSE 3000

# Run the command to start the Rails server.
CMD ["./bin/rails", "s"]
