require 'person'

RSpec.describe Person do
  it "creates a new instance of the Person class" do
    my_person = Person.new
    expect(my_person.is_a?Object).to eq(true)
  end

  it "creates an instance variable @@first_name" do
    my_person = Person.new
    expect(my_person.first_name).to eq("first name")
  end

  it "creates instance variable @@last_name" do
    my_person = Person.new
    expect(my_person.last_name).to eq("last name")
  end

  it "creates instance variable @@email_address" do
    my_person = Person.new
    expect(my_person.email_address).to eq("email")
  end

  it "creates instance variable @@phone_number" do
    my_person = Person.new
    expect(my_person.phone_number).to eq("phone")
  end

  it "accepts 'Elle' as input for get_first_name and sets value of first_name to Elle" do
    allow($stdin).to receive(:gets).and_return("Elle")
    my_person = Person.new
    my_person_get_first_name = my_person.get_first_name
    expect(my_person.first_name).to eq("Elle")
  end

  it "accepts 'Tamara' as input for get_last_name sets value of last_name to Tamara" do
    allow($stdin).to receive(:gets).and_return("Tamara")
    my_person = Person.new
    my_person_get_last_name = my_person.get_last_name
    expect(my_person.last_name).to eq("Tamara")
  end

  it "accepts 'elle@elle.com' as input for get_email_address. sets value of email_address to elle@elle.com" do
    allow($stdin).to receive(:gets).and_return("elle@elle.com")
    my_person = Person.new
    my_person_get_email_address = my_person.get_email_address
    expect(my_person.email_address).to eq("elle@elle.com")
  end

  it "accepts '07999999999' as input for get_phone_number. sets value of phone_number to 07999999999" do
    allow($stdin).to receive(:gets).and_return("07999999999")
    my_person = Person.new
    my_person_get_phone_number = my_person.get_phone_number
    expect(my_person.phone_number).to eq("07999999999")
  end

  xit "returns a string which includes first_name, last_name, email, phone" do
    my_person = Person.new
    my_person.first_name = "Elle"
    my_person.last_name = "Tamara"
    my_person.email_address = "elle@elle.com"
    my_person.phone_number = "07999999999"
    expect {my_person.display_info}.to output("""
      First name: Elle
      Last name: Tamara
      Email address: elle@elle.com
      Phone number: 07999999999
      """).to_stdout
  end








end
