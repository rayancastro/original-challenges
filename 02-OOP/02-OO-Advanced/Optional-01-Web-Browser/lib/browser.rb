require "open-uri"
require "nokogiri"
require 'net/http'

class Browser
  def nokogiri_doc(url)
    # Receives url and returns the Nokogiri parsed document
    # PS: Had to add a few more lines to get the redirect adress, before parsing
    res = Net::HTTP.get_response(URI(url))
    url = "https:#{res['location']}" unless res.is_a? Net::HTTPSuccess
    uri = URI(url)
    response = Net::HTTP.get(uri)
    return Nokogiri::HTML(response)
  end

  def fetch_content(url)
    doc = nokogiri_doc(url)
    return doc.text
  end
end
