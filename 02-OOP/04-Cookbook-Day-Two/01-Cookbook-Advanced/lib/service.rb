require 'nokogiri'
require 'open-uri'


class ScrapeFromFrench
  attr_accessor :titles, :prep_times, :difficulty, :links, :descriptions
  def initialize(keyword)
    @keyword = keyword
    @titles = []
    @prep_times = []
    @difficulty = []
    @links = []
  end

  def parse_partial
    path = @keyword.to_s
    url = "http://www.letscookfrench.com/recipes/find-recipe.aspx?aqt=" + path
    html_file = open(url).read
    doc = Nokogiri::HTML(html_file)
    # Title
    doc.search('.m_titre_resultat').each do |title|
      @titles << title.text.strip.split.map! {|word| word.capitalize }.join(" ")
      @links << title.search('a').map { |link| link['href'] }[0].to_s
    end
    # Prep Times
    doc.search('.m_detail_time').each do |time|
      @prep_times << time.text.split[1].to_i
    end
    # Difficulty
    doc.search('.m_detail_recette').each do |string|
      result = string.text.strip.split("-")[2].strip
      @difficulty << result
    end
    return @titles[0..4]
  end

  def parse_final(index)
    path = @links[index]
    url = "http://www.letscookfrench.com" + path
    html_file = open(url).read
    html_doc = Nokogiri::HTML(html_file)
    ingredients = html_doc.search(".m_content_recette_ingredients").text.strip.split.join(" ")
    cook_method = html_doc.search(".m_content_recette_todo").text.strip.split.join(" ")
    description = ingredients + cook_method
    recipe = Recipe.new(@titles[index],description.to_s,@prep_times[index],@difficulty[index])
    return recipe
  end
end
