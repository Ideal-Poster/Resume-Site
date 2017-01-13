require 'rails_helper'

RSpec.describe ContactsController, type: :controller do

  let(:admin) { Admin.create(email: "me@home.com", password: "whodini718") }

  before(:example) do
    sign_in admin
  end

  describe "POST create" do

  let(:build) { FactoryGirl.build(:contact, name: "julissa", email: "email@example.com", body: "hello. Im cheap!") }

    it "creates a contact" do
      expect(Contact).to receive(:new)
        .with(name: build.name, email: build.email, body: build.body)
        .and_return(build)
      post :create, contact: build.attributes
      expect(response).to redirect_to(contacts_path)
      # expect(assigns(:action)).not_to be_nil
    end

    it "goes back to the form on failure" do
      post :create, contact: { name: build.name, email: build.email }
      expect(response).to render_template(:new)
      expect(assigns(:contact)).to be_present
    end

    it "fails create gracefully" do
      expect(Contact).to receive(:new).and_return(Contact.create(name:build.name, email:build.email))
      post :create, contact: { name: build.name }
      expect(response).to render_template(:new)
    end

    before(:example) do
      ActionMailer::Base.deliveries.clear
    end

    it 'does not send an email when a contact is not completed' do
      post :create, contact: { name: build.name }
      expect(ActionMailer::Base.deliveries.size).to eq(0)
    end

    it "sends an email when a contact is completed" do
      expect(Contact).to receive(:new)
        .with(name: build.name, email: build.email, body: build.body)
        .and_return(build)
      post :create, contact: build.attributes
      expect(ActionMailer::Base.deliveries.size).to eq(1)
      email = ActionMailer::Base.deliveries.first
      expect(email.subject).to eq("Customer Request from Julissa")
      expect(email.to).to eq(["malcolmgourdine@gmail.com"])
      expect(email.body).to match(/\w+/)
    end

  end
end
