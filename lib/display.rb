class Display
  require 'colorize'

  def display_new_entry(first_name, last_name, email, phone)
    puts ''
    puts "Here's your new contact:"
    puts "First name: #{first_name}".colorize(:green)
    puts "Last name: #{last_name}".colorize(:green)
    puts "Email address: #{email}".colorize(:green)
    puts "Phone number: #{phone}".colorize(:green)
    puts ''
  end
end
