# frozen_string_literal: true

require_relative "demo_lorem/version"
require "net/http"
require "json"
require "cgi"
require "httparty"
require "openai"
require_relative "demo_lorem/generator"

module DemoLorem
  class Error < StandardError; end
end
