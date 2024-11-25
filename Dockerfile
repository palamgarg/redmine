# Use a base image with the necessary tools
FROM ruby:3.2

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libmariadb-dev-compat \
    libmariadb-dev \
    nodejs \
    yarn \
    git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /usr/src/redmine

# Copy application files
COPY . .

# Install gems
RUN bundle install

# Expose default Redmine port
EXPOSE 3000

# Start the server
CMD ["rails", "server", "-b", "0.0.0.0"]
