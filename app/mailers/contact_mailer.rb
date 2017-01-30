class ContactMailer < ApplicationMailer
  default from: "malcolm@silverhand.design"

  def contact_email(contact)
    @contact = contact
    mail(to: 'malcolm@silverhand.design', subject: "Customer Request from #{ @contact.name }")
  end
end
