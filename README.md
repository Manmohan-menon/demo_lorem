# DemoLorem [![Gem Version](https://badge.fury.io/rb/demo_lorem.svg?icon=si:rubygems)](https://badge.fury.io/rb/demo_lorem)

DemoLorem is a versatile text generation gem that provides multiple methods for generating placeholder text, ranging from traditional Lorem Ipsum to AI-powered content generation.

## Features
- **Traditional Lorem Ipsum**: Classic placeholder text generation
- **Cicero Text**: Historical text based on Cicero's writings
- **Pangram Text**: Text containing every letter of the alphabet
- **Random Regex**: Generate random regular expressions for testing
- **AI-Powered Content**: Generate topic-specific content using OpenAI
- **Wikipedia Content**: Fetch real-world content from Wikipedia

## Installation

Add this line to your application's Gemfile:
```ruby
gem 'demo_lorem'
```
Or install directly as:
```
gem install demo_lorem
```

## Usage

Basic Text Generation:
```ruby
generator = DemoLorem::Generator.new

# Generate Lorem Ipsum
generator.generate_text(topic: 'default', length: 100)

# Generate Cicero text
generator.generate_text(topic: 'cicero', length: 100)

# Generate Pangram text
generator.generate_text(topic: 'pangram', length: 100)
```

Random Regex Generation:
```ruby
# Generate random regular expression pattern
generator.generate_text(topic: 'random_regex')
# => Returns a Regexp object for testing pattern matching

# Example usage 
sample_strings = ["Hello World!", "abc123", "This is a test string.", "Another_example_456"] 
sample_strings.each do |string| 
    match = string.match(random_regex)
    puts "#{string} matches pattern? #{!match.nil?}"
end
```

AI-Powered Content Generation:
```ruby
# Generate AI content about a specific topic
generator.generate_text(
  topic: 'artificial intelligence',
  length: 200,
  api_based_on: 'ai',
  api_key: 'your_openai_api_key'
)
```

Wikipedia Content Fetching:
```ruby
# Fetch Wikipedia content for a specific topic
generator.generate_text(
    topic: 'Ruby (programming language)',
    length: 100,
    api_based_on: 'wikipedia'
)
```

## Possible Use Cases:
- **Development Testing**: 
  - Generate placeholder text for UI development/testing purposes
  - Test data generation
  - Form field population
- **Content Generation**:
  - Quick content prototyping
  - Sample texts for layouts
  - Draft content templates for various topics
- **Testing Regular Expressions**:
  - Generate test pattern
  - Validate regex implementations
  - Pattern matching scenarios
- **Educational Content**:
  - Generate topic-specific learning materials
  - Create practice content
  - Sample data for tutorials

## Configuration
Initialize the custom options:
```ruby
generator = DemoLorem::Generator.new(
  default_length: 150,  # Default text length
  debug: true          # Enable debug output
)
```
## Detailed Sections: 
### 1 Random Regex:
Signficance:
 - Development Testing: Generate dynamic test patterns for input validation and form testing
 - Pattern Matching: Create random regex patterns to validate text processing functionality
 - Test Data: Generate test cases for regex-based search and replace operations
### 2 AI-Powered Content Generation:
Signficance:
 - Topic-Specific Content: Generate relevant content about any subject using OpenAI's GPT model
 - Customizable Length: Control content length for different use cases (snippets to full articles)
 - Dynamic Content: Create unique, contextual content for prototypes and demonstrations
 - Error Handling: Robust error management for API issues and rate limiting
### 3 Wikipedia Content:
Signficance:
 - Real-World Content: Fetch factual content from Wikipedia for authentic text samples
 - Multiple Variations: Smart handling of topic variations for better content matching
 - Fallback Mechanism: Graceful handling when content isn't available
 - Length Control: Specify exact character length for content snippets
## Requirements
  - Ruby >= 2.6.0
  - OpenAI API key (for AI-powered generation)
  - Internet connection (for Wikipedia content)
## Future Enhancements
May add few more methods in future(hopefully soon "[:)]" ).
## Update
Made some significant updates to DemoLorem. Here are the highlights:

- Removed Methods: We've streamlined the gem by removing some methods that were required for specific personal projects but no longer serve a general purpose. 
These include:

 - weather

 - kafka

 - european_languages

 - far_far_away

- New Methods: To enhance functionality, we've added two new powerful methods:

 - AI-Based Content Generation: Fetches content from AI sources like OpenAI, allowing for more dynamic and topic-specific text generation.

 - Non-AI Content Fetching: Fetches content from non-AI sources such as Wikipedia, providing real-world content for your applications.

- Modified random_regex Method: The random_regex method has been improved to generate more diverse and complex regular expressions, useful for testing and development purposes.

These updates are designed to provide more flexibility and functionality, enhancing your ability to generate and fetch content as per your needs.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Manmohan-menon/demo_lorem. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the basic code of conduct..

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
