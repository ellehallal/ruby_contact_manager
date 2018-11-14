class Person

  attr_reader :first_name, :last_name, :email_address, :phone_number

  def initialize(first_name="no value", last_name="no value", email="no value", phone="no value")
    @first_name = first_name
    @last_name = last_name
    @email_address = email
    @phone_number = phone
  end

  def create_person_hash
    {
      "first_name": @first_name,
      "last_name": @last_name,
      "email_address": @email_address,
      "phone_number": @phone_number
    }
  end

end
