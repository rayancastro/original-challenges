def group_mails(emails)
  # TODO: group email by provider
  domain_names = {}
  emails.each do |email|
    mail_array = email.split("@")
    # user = mail_array[0]
    domain = mail_array[1][0, mail_array[1].index(".")]
    domain_names.key?(domain) ? domain_names[domain].push(email) : domain_names[domain] = [email]
  end
  return domain_names
end

def provider?(email, provider)
  mail_array = email.split("@")
  domain = mail_array[1][0, mail_array[1].index(".")]
  domain == provider
end

users = [
  "bob@yahoo.fr",
  "roger57@hotmail.fr",
  "bigbox@yahoo.fr",
  "boris@lewagon.org",
  "monsieur.olivier@gmail.com",
  "monsieur.mack@gmail.com"
]

p group_mails(users)
