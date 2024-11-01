# frozen_string_literal: true

require 'openai'

module DemoLorem
  module Helpers
    # AiApiHelper module fetches AI-generated content using OpenAI's API for a given topic and length
    # @param topic [String] the topic to generate content for. 
    # @param length [Integer] the number of characters to generate. 
    # @param api_key [String] the API key for accessing OpenAI's API. 
    # @return [String] the content generated by OpenAI.
    module AiApiHelper
      def fetch_ai_content(topic, length, api_key)
        return 'OpenAI API key is required for AI-based generation' if api_key.nil?

        begin
          client = OpenAI::Client.new(access_token: api_key)
          response = client.completions(
            parameters: {
              model: 'text-davinci-003',
              prompt: "Generate #{length} characters of text about #{topic}",
              max_tokens: length
            }
          )
          response['choices'].first['text'].strip
        rescue StandardError => e
          "An error occurred while fetching AI content: #{e.message}"
        end
      end
    end
  end
end
