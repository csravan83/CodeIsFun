require 'simplecov'
require 'simplecov-json'
require 'simplecov-rcov'
require 'metric_fu/metrics/rcov/simplecov_formatter'
SimpleCov.formatter = SimpleCov::Formatter::MetricFu

SimpleCov.formatters = [
    SimpleCov::Formatter::HTMLFormatter,
    SimpleCov::Formatter::JSONFormatter,
    SimpleCov::Formatter::RcovFormatter
]

SimpleCov.start

# require_relative '../string_ops'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
