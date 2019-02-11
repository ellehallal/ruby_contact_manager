class Validation
  require 'uri'

  def initialize; end

  def is_email_valid?(email)
    email.match?(/\A[a-z0-9\+\-_\.]+@[a-z\d\-.]+\.[a-z]+\z/i)
  end

  def is_name_valid?(name)
    name.match?(/^[-a-zA-Z ]*$/) && name.length > 1 && name.length < 50
  end

  def is_phone_number_valid?(number)
    number.scan(/\D/).empty? && number.length.between?(7, 11)
  end
end
