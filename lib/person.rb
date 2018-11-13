class Person

  attr_reader :first_name, :last_name, :email_address, :phone_number

  def initialize(first_name="no value", last_name="no value", email="no value", phone="no value")
    @first_name = first_name
    @last_name = last_name
    @email_address = email
    @phone_number = phone
  end

  def get_display_person_details
    get_first_name
    get_last_name
    get_email_address
    get_phone_number
    display_person
  end

  def get_first_name
    puts "Please enter the first name below:"
    @first_name = $stdin.gets.chomp.capitalize
  end

  def get_last_name
    puts "Please enter the last name below:"
    @last_name = $stdin.gets.chomp.capitalize
  end

  def get_email_address
    puts "Please enter the email address below:"
    @email_address = $stdin.gets.chomp.downcase
  end

  def get_phone_number
    puts "Please enter the phone number below:"
    @phone_number = $stdin.gets.chomp
  end

  def display_person
    puts "Here's your contact:"
    puts "First name: #{@first_name}"
    puts "Last name: #{@last_name}"
    puts "Email address: #{@email_address}"
    puts "Phone number: #{@phone_number}"
  end

  def create_person_hash
    {
      :first_name => @first_name,
      :last_name => @last_name,
      :email_address => @email_address,
      :phone_number => @phone_number
    }
  end

end
