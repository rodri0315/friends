desc "imports countries from defined csv"
require 'csv'

task import_countries: :environment do
  include StringUtils

  CSV.foreach('./lib/ffi_countries_2020_09_07.csv') do |row|
    # strips all leading and following spaces and non-ASCII characters from text columns 
    display_name = strip_whitespace(row[0])
    country_code = strip_whitespace(row[1])

    Country.where(display_name: display_name).first_or_create(
      display_name: display_name,
      country_code: country_code
    )
  end
end

