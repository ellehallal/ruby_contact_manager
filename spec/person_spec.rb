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
    my_person_get_first_name = $stdin.gets.chomp
    puts my_person.first_name
    expect(my_person.first_name).to eq("Elle")
  end

  it "accepts 'Tamara' as input for get_last_name sets value of last_name to Tamara" do
    allow($stdin).to receive(:gets).and_return("Tamara")
    my_person = Person.new
    my_person_get_last_name = my_person.get_last_name
    my_person_get_last_name = $stdin.gets.chomp
    puts my_person.last_name
    expect(my_person.last_name).to eq("Tamara")
  end

  it "accepts 'elle@elle.com' as input for get_phone_number sets value of phone_number to elle@elle.com" do
    allow($stdin).to receive(:gets).and_return("elle@elle.com")
    my_person = Person.new
    my_person_get_phone_number = my_person.get_phone_number
    my_person_get_phone_number = $stdin.gets.chomp
    puts my_person.phone_number
    expect(my_person.phone_number).to eq("elle@elle.com")
  end



  # it "accepts 'Hallal' as input for get_last_name" do
  #   allow($stdin).to receive(:gets).with("Elle")
  #   my_person = Person.new.get_last_name
  #   my_person = $stdin.gets.chomp
  #   expect(my_person).to eq("Hallal")
  # end

  # it "accepts input from the user and changes value of first_name to 'Sarah'" do
  #   my_person = Person.new
  #   expect(my_person.get_first_name).to eq("Sarah")
  # end
  #
  # it "accepts input from the user and changes value of first_name to 'Kharraz'" do
  #   my_person = Person.new
  #   expect(my_person.get_last_name).to eq("Kharraz")
  # end

  # it "accepts input from the user and changes value of email_address" do
  #   my_person = Person.new
  #   expect(my_person.get_phone_number).to eq("sarah@hello.com")
  # end







end
