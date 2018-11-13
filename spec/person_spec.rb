require 'person'

RSpec.describe Person do
  it "creates a new instance of the Person class" do
    my_person = Person.new
    expect(my_person.is_a?Object).to eq(true)
  end

  it "creates an instance variable @@first_name" do
    my_person = Person.new
    expect(my_person.first_name).to eq("no value")
  end

  it "creates instance variable @@last_name" do
    my_person = Person.new
    expect(my_person.last_name).to eq("no value")
  end

  it "creates instance variable @@email_address" do
    my_person = Person.new
    expect(my_person.email_address).to eq("no value")
  end

  it "creates instance variable @@phone_number" do
    my_person = Person.new
    expect(my_person.phone_number).to eq("no value")
  end

end
