class Person

  attr_reader :first_name, :last_name, :email_address, :phone_number

  def initialize
    @first_name = "first name"
    @last_name = "last name"
    @email_address = "email"
    @phone_number = "phone"
  end

  def get_first_name
    puts "Please enter the first name below:"
    @first_name = $stdin.gets.chomp
  end

  def get_last_name
    puts "Please enter the last name below:"
    @last_name = $stdin.gets.chomp
  end

  def get_email_address
    puts "Please enter the email address below:"
    @email_address = $stdin.gets.chomp
  end

end
