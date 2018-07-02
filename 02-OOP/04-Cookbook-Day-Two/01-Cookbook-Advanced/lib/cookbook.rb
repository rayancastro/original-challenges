require 'csv'
require_relative 'recipe.rb'

CSV_OPTIONS = { encoding: 'UTF-8', skip_blanks: true, headers: false, col_sep: "|", quote_char: '"' }
CSV_BACKUP = File.join(__dir__, 'recipes_backup.csv')

class Cookbook
  attr_accessor :recipes

  def initialize(filepath)
    @filepath = filepath
    @recipes = []
    CSV.foreach(filepath, CSV_OPTIONS) do |row|
      @recipes.push(Recipe.new(row[0], row[1], row[2], row[3]))
    end
    File.write(CSV_BACKUP, File.read(filepath))
  end

  def all
    @recipes
  end

  def add_recipe(recipe)
    @recipes.push(recipe)
    update
  end

  def remove_recipe(index)
    @recipes.delete_at(index)
    update
  end

  def update
    CSV.open(@filepath, "wb", CSV_OPTIONS) do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description, recipe.prep_time, recipe.difficulty]
      end
    end
  end
end
