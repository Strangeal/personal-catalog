require_relative 'app'

class Options
  # Import all Ui methods in here
  # rubocop:disable Metrics/CyclomaticComplexity
  def options(user_input, app)
    case user_input
    when 1 then puts 'List all books'
    when 2 then puts 'List all music albums'
    when 3 then puts 'List all movies'
    when 4 then puts app.list_games
    when 5 then puts 'List all genres'
    when 6 then puts 'List all labels'
    when 7 then puts app.list_authors
    when 8 then puts 'List all sources'
    when 9 then puts 'Add a book'
    when 10 then puts 'Add a music album'
    when 11 then puts app.add_author
    when 12 then puts app.add_game
    when 13 then puts 'Exit'
    else
      'select an option'
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity
end
