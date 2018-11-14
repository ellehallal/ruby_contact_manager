require 'save_to_file'

RSpec.describe SaveToFile do
  it "creates a new instance of the SaveToFile class" do
    save_to_file = SaveToFile.new
    expect(save_to_file.is_a?Object).to eq(true)
  end
end
