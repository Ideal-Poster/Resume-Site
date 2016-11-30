require 'rails_helper'

RSpec.describe Contact, type: :model do
  let(:contact) {
    FactoryGirl.create(:contact,
      name: "Julissa",
      email: "email@example.com",
      body: "hello im cheap."
  )}

  it 'is valid with valid attributes' do
    expect(contact).to be_valid
  end

  it 'is not valid without a name' do
    contact.name = nil
    expect(contact).to_not be_valid
  end

  it 'returns name in a capitalized format' do
    contact.name = "jUlIsSa cOnTrErAs"
    expect(contact.name).to eq "Julissa Contreras"
  end

  it 'is not valid without a email' do
    contact.email = nil
    expect(contact).to_not be_valid
  end

  it 'is not valid without body' do
    contact.body = nil
    expect(contact).to_not be_valid
  end
end
