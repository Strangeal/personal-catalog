require_relative 'app'
class Options
  # BookLabelHandler book_label_handler = Book_label_handler.new
  # rubocop:disable Metrics/CyclomaticComplexity
  def options(user_input, app)
    case user_input
    when 1 then app.list_all_books
    when 2 then app.list_all_music
    when 3 then app.list_games
    when 4 then app.list_all_genres
    when 5 then app.list_all_labels
    when 6 then app.list_authors
    when 7 then app.add_book
    when 8 then app.add_musicalbum
    when 9 then puts app.add_author
    when 10 then puts app.add_game
    when 11 then puts 'Exit'
    else
      'select an option'
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity
end
