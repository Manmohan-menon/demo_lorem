# frozen_string_literal: true

require 'httparty'
require 'cgi'
require 'json'

module DemoLorem
  module Helpers
    # NonaiApiHelper module currently fetches wikipedia content for a given topic and length
    # @param topic [String] the topic to search for
    # @param length [Integer] the number of characters to fetch
    # @return [String] content fetched from Wikipedias
    module NonaiApiHelper
      def fetch_wikipedia_content(topic, length)
        puts 'Please wait while we fetch your content... (this may take 2-10 seconds)'
        sleep(rand(2..10)) # Simulate wait time

        variations = [topic, topic.tr('_', ' ')]
        variations.each do |variation|
          url = "https://en.wikipedia.org/w/api.php?action=query&prop=extracts&exchars=#{length}&explaintext=true&format=json&titles=#{CGI.escape(variation)}"
          response = HTTParty.get(url)
          pages = response.dig('query', 'pages')
          next if pages.nil? || pages.empty?

          page = pages.values.first
          extract = page.dig('extract')
          return extract unless extract.nil? || extract.empty?
        end

        'No content found for the given topic'
      rescue StandardError => e
        "An error occurred while fetching Wikipedia content: #{e.message}"
      end
    end
  end
end
