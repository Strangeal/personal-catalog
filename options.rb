require_relative 'app'
class Options
  # BookLabelHandler book_label_handler = Book_label_handler.new
  # rubocop:disable Metrics/CyclomaticComplexity
  def options(user_input, app)
    case user_input
    when 1 then app.list_all_books
    when 2 then app.list_all_music
    when 3 then puts 'List all movies'
    when 4 then app.list_games
    when 5 then app.list_all_genres
    when 6 then app.list_all_labels
    when 7 then app.list_authors
    when 8 then puts 'List all sources'
    when 9 then app.add_book
    when 10 then app.add_musicalbum
    when 11 then puts app.add_author
    when 12 then puts app.add_game
    when 13 then puts 'Exit'
    else
      'select an option'
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity
end
