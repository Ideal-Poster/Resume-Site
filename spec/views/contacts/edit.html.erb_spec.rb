# require 'rails_helper'
#
# RSpec.describe "contacts/edit", type: :view do
#   before(:each) do
#     @contact = assign(:contact, Contact.create!(
#       :name => "MyText",
#       :email => "MyText",
#       :body => "MyText"
#     ))
#   end
#
#   it "renders the edit contact form" do
#     render
#
#     assert_select "form[action=?][method=?]", contact_path(@contact), "post" do
#
#       assert_select "textarea#contact_name[name=?]", "contact[name]"
#
#       assert_select "textarea#contact_email[name=?]", "contact[email]"
#
#       assert_select "textarea#contact_body[name=?]", "contact[body]"
#     end
#   end
# end
