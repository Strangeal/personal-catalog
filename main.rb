require_relative 'app'
require_relative 'prompt'

def main
  puts "\n Welcome👋 to my item collection App!".upcase
  app = App.new
  Prompt.new.prompt(app)
end
main
