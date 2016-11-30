class ContactMailer < ApplicationMailer
  default from: "malcolmgourdine@gmail.com"

  def contact_email(contact)
    @contact = contact
    mail(to: 'malcolmgourdine@gmail.com', subject: "Customer Request from #{ @contact.name }")
  end
end
