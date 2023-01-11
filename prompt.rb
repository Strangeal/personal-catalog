require_relative 'options'
require_relative 'menu'

class Prompt
  # Prompt
  def prompt(app)
    LibraryMenu.new.menu

    user_input = gets.chomp.to_i

    user_input == 11 ? app.exit_app : Options.new.options(user_input, app)
    prompt(app)
  end
end
