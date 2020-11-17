require 'uri'

def check_email(email)
  if (URI::MailTo::EMAIL_REGEXP =~ email) == nil && write_something
    puts true
  else
    puts false
  end
end

def write_something
  puts "Written"
  return true
end

check_email ARGV[0]

