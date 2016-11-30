class Contact < ActiveRecord::Base
  validates_presence_of :name, :email, :body

  def name_case(title)
    title.split(' ').map! { |name| name.capitalize }.join(' ') if title != nil
  end

  def name=(name)
    return write_attribute(:name, name_case(name) )
  end
  
end
