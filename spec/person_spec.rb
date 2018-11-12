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
end
