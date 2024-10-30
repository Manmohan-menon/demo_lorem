# frozen_string_literal: true

# DemoLorem Generator
# 
# Provides text generation capabilities through various methods:
# - Traditional Lorem Ipsum
# - Cicero-style phrases
# - Pangrams
# - Random Regex generation
# - AI-powered content generation
# - Wikipedia content fetching
#
# Usage:
#   generator = DemoLorem::Generator.new(default_length: 200)
#   generated_text = generator.generate_text(topic: 'default', length: 150)

require 'net/http'
require 'json'
require 'cgi'
require 'httparty'
require 'openai'
require_relative 'helpers/regex_helper'
require_relative 'helpers/ai_api_helper'
require_relative 'helpers/nonai_api_helper'

module DemoLorem
  class Generator
    include Helpers::RegexHelper
    include Helpers::AiApiHelper
    include Helpers::NonaiApiHelper

    LATIN_WORDS = %w[
      Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod
      tempor incididunt ut labore et dolore magna aliqua Ut enim ad minim veniam
      quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
      consequat Duis aute irure dolor in reprehenderit in voluptate velit esse
      cillum dolore eu fugiat nulla pariatur Excepteur sint occaecat cupidatat non
      proident sunt in culpa qui officia deserunt mollit anim id est laborum
    ]

    CICERO_WORDS = %w[
      But I must explain to you how all this mistaken idea of denouncing pleasure and praising
      pain was born and I will give you a complete account of the system, and expound the actual
      teachings of the great explorer of the truth, the master-builder of human happiness
    ]

    PANGRAM_WORDS = %w[
      The quick, brown fox jumps over a lazy dog. DJs flock by when MTV ax quiz prog. Junk MTV quiz graced
      by fox whelps. Bawds jog, flick quartz, vex nymphs. Waltz, bad nymph, for quick jigs vex! Fox nymphs
      grab quick-jived waltz. Brick quiz whangs jumpy veldt fox
    ]

    def initialize(options = {})
      @default_length = options[:default_length] || 100
      @debug = options[:debug] || false
    end

    # Generates text based on user input
    def generate_text(topic:, length: nil, api_based_on: nil, api_key: nil)
      content_generators = {
        'default' => ->(l) { ipsum(l) },
        'cicero' => ->(l) { cicero(l) },
        'pangram' => ->(l) { pangram(l) },
        'random_regex' => ->(_) { random_regex }
      }

      generator = content_generators[topic] || ->(l) { fetch_api_content(topic, l, api_based_on, api_key) }
      generator.call(length)
    end

    private

    def ipsum(word_count = 100)
      LATIN_WORDS.sample(word_count).join(' ') + '.'
    end

    def cicero(word_count = 100)
      CICERO_WORDS.sample(word_count).join(' ') + '.'
    end

    def pangram(word_count = 100)
      PANGRAM_WORDS.sample(word_count).join(' ') + '.'
    end

    def fetch_api_content(topic, length, api_based_on, api_key)
      if api_based_on == 'ai'
        fetch_ai_content(topic, length, api_key)
      else
        fetch_wikipedia_content(topic, length)
      end
    end

    def debug_output(message)
      puts "[Debug] #{message}" if @debug
    end
  end
end
