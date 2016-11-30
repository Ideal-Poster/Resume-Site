# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview
  def sample_mail_preview
    ContactMailer.contact_mail(Contact.first)
  end
end
