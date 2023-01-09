require_relative 'app'
require_relative 'prompt'

def main
  puts "\n Welcome👋 to School library App!"
  app = App.new
  Prompt.new.prompt(app)
end
main
