require "open-uri"
require "nokogiri"
require 'net/http'

def nokogiri_doc(url)
  # Receives url and returns the Nokogiri parsed document
  # PS: Had to add a few more lines to get the redirect adress, before parsing
  res = Net::HTTP.get_response(URI(url))
  url = "https:#{res['location']}" unless res.is_a? Net::HTTPSuccess
  uri = URI(url)
  response = Net::HTTP.get(uri)
  return Nokogiri::HTML(response)
end

def scrape_craiglist_antiques(city)
  # TODO: return an array of Antiques found of Craiglist for this `city`.
  # Build the correct url using the city parameter
  url = "https://#{city.delete(' ')}.craigslist.org/search/ata"
  # Open the url using nokogiri and parse the information
  doc = nokogiri_doc(url)
  # Find the correct CSS selectors to filter the result (Using inspect on the web browser)
  # Search your result using the css selectors and nokogiri methods.
  antiques = []
  doc.search(".result-title").each do |title|
    # Store the information found into an array
    antiques.push(title.text)
  end
  # Return array of antiques found
  return antiques
end

