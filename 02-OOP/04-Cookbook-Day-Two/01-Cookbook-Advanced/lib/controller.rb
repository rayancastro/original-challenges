require_relative 'view.rb'
require_relative 'recipe.rb'
require_relative 'service.rb'

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    @view.display_all(@cookbook.all)
  end

  def read
    list
    index = @view.input_index
    recipe = @cookbook.recipes[index-1]
    @view.display_description(recipe)
  end

  def create
    name = @view.input_name
    description = @view.input_description
    recipe = Recipe.new(name, description)
    @cookbook.add_recipe(recipe)
  end

  def destroy
    list
    index = @view.input_index
    @cookbook.remove_recipe(index-1)
  end

  def import
    keyword = @view.ask_keyword
    service = ScrapeFromFrench.new(keyword)
    titles = service.parse_partial
    @view.list_recipes_to_import(titles)
    index = @view.input_index
    recipe = service.parse_final(index - 1)
    @cookbook.add_recipe(recipe)
  end

end
