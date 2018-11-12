class Person

  attr_reader :first_name, :last_name, :email_address, :phone_number

  def initialize(first_name="", last_name="", email_address="", phone_number="")
    @first_name = first_name
    @last_name = last_name
    @email_address = email_address
    @phone_number = phone_number
  end

  def get_first_name
    puts "Please enter the first name below:"
    @first_name = $stdin.gets.chomp
  end

  def get_last_name
    puts "Please enter the last name below:"
    @last_name = $stdin.gets.chomp
  end

end
