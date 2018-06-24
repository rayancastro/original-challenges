def mail_joke(email)
  # TODO: Return (not print!) a joke suited to the email provided
  # Verify if its a valid email
  # Split the domain from the rest and return joke
  raise ArgumentError.new, "Not a valid mail." unless email.include?("@" && ".")
  email_array = email.split("@")
  email_array[0].gsub!(/[.]/) { " " }
  jokes = { "lewagon.org" => "Well done #{email_array[0]}, you're skilled and capable",
            "gmail.com" => "#{email_array[0]}, you're an average but modern person",
            "live.com" => "#{email_array[0]}, aren't you born after 1973?",
            unknown: "Sorry #{email_array[0]}, we don't know how to judge '#{email_array[1]}'" }
  return jokes.key?(email_array[1]) ? jokes[email_array[1]] : jokes[:unknown]
end

# p mail_joke("rayan@lewagon.com")
