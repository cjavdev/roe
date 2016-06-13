# == Schema Information
#
# Table name: items
#
#  id                 :integer          not null, primary key
#  photo_file_name    :string
#  photo_content_type :string
#  photo_file_size    :integer
#  photo_updated_at   :datetime
#  name               :string           not null
#  user_id            :integer          not null
#  collection_id      :integer
#  public             :boolean          default(TRUE)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  description        :text
#  color              :string
#

class Item < ActiveRecord::Base
  validates :name, :consultant, presence: true
  belongs_to :consultant, class_name: 'User'
  has_many :sizes, class_name: 'ItemSize'

  # This method associates the attribute ":avatar" with a file attachment
  has_attached_file :photo, styles: {
    thumb: '100x100>',
    square: '300x300#',
    medium: '400x400>'
  }

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
end
