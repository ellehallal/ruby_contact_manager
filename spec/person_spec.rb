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

  it "returns 'Elle' as input" do
    allow($stdin).to receive(:gets).and_return("Elle")
    my_person = Person.new.first_name
    my_person = $stdin.gets.chomp
    expect(my_person).to eq("Elle")
  end

  it "accepts input from the user and changes value of first_name to 'Sarah'" do
    my_person = Person.new
    expect(my_person.get_first_name).to eq("Sarah")
  end

  it "accepts input from the user and changes value of first_name to 'Kharraz'" do
    my_person = Person.new
    expect(my_person.get_last_name).to eq("Kharraz")
  end

  # it "accepts input from the user and changes value of email_address" do
  #   my_person = Person.new
  #   expect(my_person.get_phone_number).to eq("sarah@hello.com")
  # end







end
