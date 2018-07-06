class PostsView
  # TODO: implement methods called by the PostsController
  def display_all(elements)
    elements.each do |element|
      puts "#{element.id} - #{element.title}."
      puts "Votes: #{element.votes}"
      puts "Link: #{element.url}"
    end
  end

  def display_post(post)
    puts "#{post.id} - #{post.title}."
    puts "Votes: #{post.votes}"
    puts "Link: #{post.url}"
  end

  def ask_title
    puts "What's the new title?"
    gets.chomp.to_s
  end

  def ask_post_id_update
    puts "What's the id of the post you want to update?"
    gets.chomp.to_i
  end

  def ask_post_id_delete
    puts "What's the id of the post you want to delete?"
    gets.chomp.to_i
  end

  def ask_post_id_upvote
    puts "What's the id of the post you want to upvote?"
    gets.chomp.to_i
  end

  def ask_title_update(post)
    puts "Current title:"
    puts post.title.to_s
    puts "Type the new title (Or press enter if you want to leave it unchanged)"
    gets.chomp.to_s
  end

  def ask_url_update(post)
    puts "Current url: " + post.url.to_s
    puts "Type the new url (Or press enter if you want to leave it unchanged)"
    gets.chomp.to_s
  end

  def ask_votes_update(post)
    puts "Current votes:"
    puts post.votes.to_s
    puts "Type the new votes (Or press enter if you want to leave it unchanged)"
    gets.chomp.to_i
  end

  def ask_confirmation(post)
    display_post(post)
    puts ""
    puts "Type 'yes' to confirm you want to delete this post"
    gets.chomp.to_s.downcase == "yes"
  end
end
