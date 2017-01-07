class Project < ActiveRecord::Base
  validates_presence_of :title, :description
  has_many :images, dependent: :destroy
  accepts_attachments_for :images, attachment: :file
end
