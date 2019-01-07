require 'kindle_highlights'

kindle = KindleHighlights::Client.new(
  email_address: ENV['KINDLE_USER'],
  password: ENV['KINDLE_PASSWORD']
)

kindle.books.map(&:asin).each { |book_id|
    kindle.highlights_for(book_id).map(&:text).each { |highlight| puts highlight }
}