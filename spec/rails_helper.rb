require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
require 'devise'

RSpec.configure do |config|
  config.include Devise::Test::IntegrationHelpers, type: :request  # ✅ Devise 헬퍼 추가
  config.include FactoryBot::Syntax::Methods
  config.fixture_paths = [Rails.root.join('spec/fixtures')]
  config.use_transactional_fixtures = true
  config.filter_rails_from_backtrace!
end
