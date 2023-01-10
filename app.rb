require_relative 'prompt'

class App
  # Exit

  def initialize
    @books = []
    @labels = []
  end

  def list_all_books
    puts 'book list'
  end

  def exit_app
    puts "\n Thanks for using this app"
    exit
  end
end
