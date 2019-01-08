require 'kindle_highlights'

kindle = KindleHighlights::Client.new(
  email_address: ENV['KINDLE_USER'].strip,
  password: ENV['KINDLE_PASSWORD'].strip,
  mechanize_options: { user_agent_alias: 'iPhone' }
)

kindle.books.map(&:asin).each { |book_id|
    kindle.highlights_for(book_id).map(&:text).each { |highlight| puts highlight }
}