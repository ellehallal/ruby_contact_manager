class Person

  attr_reader :first_name, :last_name, :email_address, :phone_number

  def initialize(first_name="", last_name="", email_address="", phone_number="")
    @first_name = first_name
    @last_name = last_name
    @email_address = email_address
    @phone_number = phone_number
  end

end
