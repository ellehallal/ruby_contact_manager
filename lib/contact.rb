class Contact
  attr_reader :first_name, :last_name, :email, :phone

  def initialize(first_name, last_name, email, phone)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @phone = phone
  end

  def new_contact
    {
      'first_name' => @first_name,
      'last_name' => @last_name,
      'email_address' => @email,
      'phone_number' => @phone
    }
  end
end
