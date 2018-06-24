STRINGS = {
  home: {
    intro: {
      en: 'Welcome on Le Wagon',
      fr: 'Bienvenue sur Le Wagon'
    },
    content: {
      explanation: {
        en: 'This is an interesting exercise',
        fr: 'C\'est un exercice interessant',
        de: 'Es ist eine interesante Ãbung'
      },
      goodbye: {
        en: 'Goodbye',
        fr: 'Au revoir',
        es: 'Adios'
      }
    }
  }
}

def translation(a_string, a_language = "en")
  # TODO: your code goes here
  path = a_string.split(".").map { |word| word.to_sym }
  begin
    if path.size == 2
      if STRINGS[path[0]][path[1]].key?(a_language.to_sym)
        return STRINGS[path[0]][path[1]][a_language.to_sym]
      else return STRINGS[path[0]][path[1]][:en]
      end
    elsif path.size == 3
      if STRINGS[path[0]][path[1]][path[2]].key?(a_language.to_sym)
        return STRINGS[path[0]][path[1]][path[2]][a_language.to_sym]
      else return STRINGS[path[0]][path[1]][path[2]][:en]
      end
    end
  rescue
    return ""
  end
end

p translation('home.content.goodbye', 'de')
