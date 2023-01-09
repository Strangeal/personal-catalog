require_relative 'app.rb'
require_relative 'prompt.rb'

def main
  puts "\n Welcome👋 to School library App!"
  app = App.new
  Prompt.new.prompt(app)
end
main