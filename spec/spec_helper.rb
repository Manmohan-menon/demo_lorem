$LOAD_PATH.unshift(File.expand_path('../lib', __dir__))

require 'rspec'
require 'demo_lorem'
require 'webmock/rspec'
require 'json'
require 'cgi'
require 'httparty'
require 'openai'

RSpec.configure do |config|
  config.before(:each) do
    # Stub Wikipedia API calls
    stub_request(:get, /en.wikipedia.org/)
      .to_return(
        status: 200,
        body: {
          query: {
            pages: {
              '12345' => {
                extract: 'Sample Wikipedia content'
              }
            }
          }
        }.to_json
      )

    # Stub OpenAI API calls
    stub_request(:post, /api.openai.com/)
      .to_return(
        status: 200,
        body: {
          choices: [
            {
              text: 'Sample AI generated content'
            }
          ]
        }.to_json
      )
  end
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.filter_run_when_matching :focus
  config.example_status_persistence_file_path = 'spec/examples.txt'
  config.disable_monkey_patching!

  config.default_formatter = 'doc' if config.files_to_run.one?
  config.profile_examples = 10
  config.order = :random
  Kernel.srand config.seed
end
