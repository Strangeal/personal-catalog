require_relative 'options'
require_relative 'menu'

class Prompt
  # Prompt
  def prompt(app)
    LibraryMenu.new.menu

    user_input = gets.chomp.to_i

    user_input == 13 ? app.exit_app : Options.new.options(user_input)
    prompt(app)
  end
end
