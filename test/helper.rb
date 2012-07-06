require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end

require 'test/unit'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
ENV["RAILS_ENV"] ||= "test"
$:.unshift(File.join(File.dirname(__FILE__), *%w[../lib]))

require 'ostruct'
require 'active_support'
require 'action_controller'
require 'active_support/test_case'
# require 'action_controller/test_process'
require 'action_view/test_case'
require 'active_record'

require 'mocha'
require 'mock_rails'
require 'form_assistant'

