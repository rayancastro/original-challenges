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

def path_tester(path, lang)
  if path.size == 2
    return STRINGS[path[0]][path[1]][(STRINGS[path[0]][path[1]].key?(lang.to_sym) ? lang.to_sym : :en)]
  elsif path.size == 3
    if STRINGS[path[0]][path[1]][path[2]].key?(lang.to_sym)
      return STRINGS[path[0]][path[1]][path[2]][lang.to_sym]
    else return STRINGS[path[0]][path[1]][path[2]][:en]
    end
  end
end

def translation(a_string, a_language = "en")
  # TODO: your code goes here
  path = a_string.split(".").map { |word| word.to_sym }
  begin
    return path_tester(path, a_language)
  rescue NameError, ArgumentError
    return ""
  else
    return ""
  end
end

p translation('home.content.goodbye', 'de')
