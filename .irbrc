require 'rubygems'

# Use awesome_print color and formating by default.
require 'awesome_print'
unless IRB.version.include?('DietRB')
  IRB::Irb.class_eval do
    def output_value
      ap @context.last_value
    end
  end
else # MacRuby
  IRB.formatter = Class.new(IRB::Formatter) do
    def inspect_object(object)
      object.ai
    end
  end.new
end

# Includes the Rails URL helpers if this is a Rails 3 console.
if Object.const_defined?("Rails") && Rails.version =~ /^3/
  include Rails.application.routes.url_helpers
end

# Log to STDOUT if in Rails
if ENV.include?('RAILS_ENV') && !Object.const_defined?('RAILS_DEFAULT_LOGGER')
  require 'logger'
  RAILS_DEFAULT_LOGGER = Logger.new(STDOUT)
end
