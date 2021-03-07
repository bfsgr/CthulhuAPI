require 'simplecov'
require 'simplecov_json_formatter'
require 'simplecov-lcov'

SimpleCov.start 'rails' do
  formatter SimpleCov::Formatter::MultiFormatter.new([SimpleCov::Formatter::JSONFormatter,
                                                      SimpleCov::Formatter::LcovFormatter,
                                                      SimpleCov::Formatter::HTMLFormatter])
end
ENV['RAILS_ENV'] ||= 'test'

require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  parallelize_setup do |worker|
    SimpleCov.command_name "#{SimpleCov.command_name}-#{worker}"
  end

  parallelize_teardown do
    SimpleCov.result
  end

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
