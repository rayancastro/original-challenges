require_relative 'view.rb'
require_relative 'recipe.rb'

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    @view.display_all(@cookbook.all)
  end

  def create
    name = @view.input_name
    description = @view.input_description
    recipe = Recipe.new(name, description)
    @cookbook.add_recipe(recipe)
  end

  def destroy
    index = @view.input_index
    @cookbook.remove_recipe(index)
  end
end
