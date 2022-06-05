require 'active_support'
require 'active_support/core_ext'
require 'dotenv/load'
require 'yaml'

# POSTGRESQL_HOST
if ENV['POSTGRESQL_HOST'].present?
  POSTGRESQL_HOST = ENV['POSTGRESQL_HOST']
else
  raise "Missing ENV POSTGRESQL_HOST"
end

# POSTGRESQL_PORT
if ENV['POSTGRESQL_PORT'].present?
  POSTGRESQL_PORT = ENV['POSTGRESQL_PORT']
else
  raise "Missing ENV POSTGRESQL_PORT"
end

# POSTGRESQL_DB
if ENV['POSTGRESQL_DB'].present?
  POSTGRESQL_DB = ENV['POSTGRESQL_DB']
else
  raise "Missing ENV POSTGRESQL_DB"
end

# POSTGRESQL_USERNAME
if ENV['POSTGRESQL_USERNAME'].present?
  POSTGRESQL_USERNAME = ENV['POSTGRESQL_USERNAME']
else
  raise "Missing ENV POSTGRESQL_USERNAME"
end

# POSTGRESQL_PASSWORD
if ENV['POSTGRESQL_PASSWORD'].present?
  POSTGRESQL_PASSWORD = ENV['POSTGRESQL_PASSWORD']
else
  raise "Missing ENV POSTGRESQL_PASSWORD"
end

# REDIS_HOST
if ENV['REDIS_HOST'].present?
  REDIS_HOST = ENV['REDIS_HOST']
else
  raise "Missing ENV REDIS_HOST"
end

# REDIS_PORT
if ENV['REDIS_PORT'].present?
  REDIS_PORT = ENV['REDIS_PORT']
else
  raise "Missing ENV REDIS_PORT"
end

# REDIS_DB
if ENV['REDIS_DB'].present?
  REDIS_DB = ENV['REDIS_DB']
else
  raise "Missing ENV REDIS_DB"
end

NACEBEL_CSV_HEADERS = YAML.load_file File.expand_path('../config/yaml/nacebel_csv_headers.yaml', __dir__)
