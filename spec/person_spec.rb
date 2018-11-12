require 'person'

RSpec.describe Person do
  it "creates a new instance of the Person class" do
    my_person = Person.new
    expect(my_person.is_a?Object).to eq(true)
  end

  it "creates an instance variable @@first_name with an empty string value" do
    my_person = Person.new
    expect(my_person.first_name).to eq("")
  end

  it "creates instance variable @@last_name with an empty string value" do
    my_person = Person.new
    expect(my_person.last_name).to eq("")
    expect(my_person.email_address).to eq("")
    expect(my_person.phone_number).to eq("")
  end

  it "creates instance variable @@email_address with an empty string value" do
    my_person = Person.new
    expect(my_person.last_name).to eq("")
    expect(my_person.email_address).to eq("")
    expect(my_person.phone_number).to eq("")
  end

  it "creates instance variable @@phone_number with an empty string value" do
    my_person = Person.new
    expect(my_person.last_name).to eq("")
    expect(my_person.email_address).to eq("")
    expect(my_person.phone_number).to eq("")
  end

  it "returns 'Elle' as input" do
    allow($stdin).to receive(:gets).and_return('Elle')
    my_person = Person.new.first_name
    my_person = $stdin.gets.chomp
    expect(my_person).to eq('Elle')
  end



end
