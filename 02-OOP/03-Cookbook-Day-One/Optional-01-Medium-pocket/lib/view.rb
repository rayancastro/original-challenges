class View
  def ask_user_for_index
    puts "What index?"
    index = gets.chomp.to_i
    return index - 1
  end

  def ask_user_for_path
    puts "What path?"
    path = gets.chomp
    return path
  end

  def display_post(post)
    puts post.title
    puts ""
    puts post.text
    puts ""
    puts "Written by: #{post.author}"
  end

  def display_all(posts)
    posts.each_with_index do |post, index|
      post.read ? mark = "[x]" : mark = "[ ]"
      puts "#{index+1}. #{mark} - #{post.title} (#{post.author})"
    end
  end

  def goodbye
    puts "Bye Bye!"
  end
end
