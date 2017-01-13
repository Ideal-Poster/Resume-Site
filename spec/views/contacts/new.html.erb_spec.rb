# require 'rails_helper'
#
# RSpec.describe "contacts/new", type: :view do
#   before(:each) do
#     assign(:contact, Contact.new(
#       :name => "MyText",
#       :email => "MyText",
#       :body => "MyText"
#     ))
#   end
#
#   it "renders new contact form" do
#     render
#
#     assert_select "form[action=?][method=?]", contacts_path, "post" do
#
#       assert_select "textarea#contact_name[name=?]", "contact[name]"
#
#       assert_select "textarea#contact_email[name=?]", "contact[email]"
#
#       assert_select "textarea#contact_body[name=?]", "contact[body]"
#     end
#   end
# end
