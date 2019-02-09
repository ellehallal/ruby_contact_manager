require 'validation'

RSpec.describe Validation do
  before :each do
    @validation = Validation.new
  end
  it 'returns true if email is valid' do
    check_validity = @validation.is_email_valid?('hello@gmail.com')
    expect(check_validity).to eq(true)
  end

  it 'returns false if email is not valid' do
    check_validity = @validation.is_email_valid?('hello@@@@gmail')
    expect(check_validity).to eq(false)
  end

  it 'returns true if name is valid' do
    check_name1 = @validation.is_name_valid?('Hannah')
    check_name2 = @validation.is_name_valid?('Hannah Rose')
    check_name3 = @validation.is_name_valid?('Hannah-Rose')
    expect(check_name1).to eq(true)
    # expect(check_name2).to eq(true)
    expect(check_name3).to eq(true)
  end

  it 'returns false if name is not valid' do
    check_name1 = @validation.is_name_valid?('434')
    check_name2 = @validation.is_name_valid?('/@£$Fdcv%!')
    check_name3 = @validation.is_name_valid?('s')
    expect(check_name1).to eq(false)
    expect(check_name2).to eq(false)
    expect(check_name3).to eq(false)
  end
  
end
