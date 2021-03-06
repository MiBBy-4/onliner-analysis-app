# Load the Rails application.
require_relative "application"

analyze_api = File.join(Rails.root, 'analyze.env')
load(analyze_api) if File.exist?(analyze_api)

# Initialize the Rails application.
Rails.application.initialize!
