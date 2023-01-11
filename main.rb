require_relative 'app'
require_relative 'prompt'
require 'colorize'

def main
  puts "\n Welcome👋 to my item collection App!".upcase.green
  app = App.new
  Prompt.new.prompt(app)
end
main
