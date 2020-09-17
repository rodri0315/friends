desc "imports languages from defined csv"
require 'csv'

task import_languages: :environment do
  include StringUtils

  CSV.foreach('./lib/ffi_languages_2020_09_07.csv') do |row|
    # strips all leading and following spaces and non-ASCII characters from text columns 
    display_name = strip_whitespace(row[0])
    locale_code = strip_whitespace(row[1])

    Language.where(display_name: display_name).first_or_create(
      display_name: display_name,
      locale_code: locale_code
    )
  end
end

