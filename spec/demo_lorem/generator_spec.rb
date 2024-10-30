require 'spec_helper'
require 'demo_lorem'

RSpec.describe DemoLorem::Generator do
  let(:generator) { described_class.new }
  let(:generator_with_options) { described_class.new(default_length: 50, debug: true) }
  let(:api_key) { ENV['OPENAI_API_KEY'] || 'dummy_api_key_for_testing' }

  describe '#initialize' do
    it 'creates a new generator with default options' do
      expect(generator).to be_a(DemoLorem::Generator)
    end

    it 'creates a new generator with custom options' do
      expect(generator_with_options).to be_a(DemoLorem::Generator)
    end
  end

  describe '#generate_text' do
    context 'with default lorem ipsum' do
      it 'generates lorem ipsum text' do
        result = generator.generate_text(topic: 'default', length: 100)
        expect(result).to be_a(String)
        expect(result).to end_with('.')
      end
    end

    context 'with cicero text' do
      it 'generates cicero text' do
        result = generator.generate_text(topic: 'cicero', length: 100)
        expect(result).to be_a(String)
        expect(result).to end_with('.')
      end
    end

    context 'with pangram text' do
      it 'generates pangram text' do
        result = generator.generate_text(topic: 'pangram', length: 100)
        expect(result).to be_a(String)
        expect(result).to end_with('.')
      end
    end

    context 'with random regex' do
      it 'generates a valid regex pattern' do
        result = generator.generate_text(topic: 'random_regex')
        expect(result).to be_a(Regexp)
      end
    end

    context 'with AI-based generation' do
      it 'fetches AI content when api_based_on is ai' do
        result = generator.generate_text(
          topic: 'technology',
          length: 100,
          api_based_on: 'ai',
          api_key: api_key
        )
        expect(result).to be_a(String)
      end

      it 'returns error message when API key is missing' do
        result = generator.generate_text(
          topic: 'technology',
          length: 100,
          api_based_on: 'ai',
          api_key: nil
        )
        expect(result).to include('OpenAI API key is required')
      end
    end

    context 'with Wikipedia-based generation' do
      it 'fetches Wikipedia content when api_based_on is not ai' do
        result = generator.generate_text(
          topic: 'Ruby (programming language)',
          length: 100,
          api_based_on: 'wiki'
        )
        expect(result).to be_a(String)
      end
    end
  end

  describe 'debug output' do
    it 'outputs debug messages when debug is enabled' do
      expect { generator_with_options.send(:debug_output, 'test message') }
        .to output(/\[Debug\] test message/).to_stdout
    end
  end
end
