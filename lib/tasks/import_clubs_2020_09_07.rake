desc "imports clubs from defined csv"
require 'csv'

task import_clubs: :environment do

  include StringUtils

  other_country = Country.where(country_code: 'OTHER').first
  if other_country==nil
    other_country_id = 0
  else 
    other_country_id = other_country.id
  end

  CSV.foreach('./lib/ffi_clubs_2020_09_07.csv') do |row|
    # strips all leading and following spaces and non-ASCII characters from text columns 
    club_number = strip_whitespace(row[0])
    display_name = strip_whitespace(row[1])
    region = strip_whitespace(row[2])
    sub_region1 = strip_whitespace(row[3])
    sub_region2 = strip_whitespace(row[4])
    state_province = strip_whitespace(row[5])
    status = strip_whitespace(row[6])

    country = Country.where(display_name: sub_region2).first

    if country!=nil
      country_id = country.id 
      country_other = nil
    else
      country_id = other_country_id
      country_other = sub_region2
    end

    # NOTE: this task will not be able to import clubs if there is no country code of "N/A" (the catch-all)
    Club.where(club_number: club_number).first_or_create(
      club_number: club_number,
      display_name: display_name,
      region: region,
      sub_region: sub_region1,
      country_id: country_id,
      country_other: country_other,
      state_province: state_province,
      status: status
    )
  end
end

