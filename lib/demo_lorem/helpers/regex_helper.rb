# frozen_string_literal: true

module DemoLorem
  module Helpers
    # RegexHelper module generates random regular expressions
    module RegexHelper
      def random_regex
        characters = ('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a
        metacharacters = %w[. * + ?]
        quantifiers = %w[{1,3} {2,5} + *]
        character_classes = ['[a-z]', '[A-Z]', '[0-9]', '\w', '\d']
        base_pattern = characters.sample(5).join
        base_pattern = "#{character_classes.sample}#{base_pattern}"
        base_pattern = "#{base_pattern}#{metacharacters.sample}#{quantifiers.sample}"
        full_pattern = "(#{base_pattern})"

        Regexp.new(full_pattern)
      end
    end
  end
end
