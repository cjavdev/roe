# == Schema Information
#
# Table name: users
#
#  id               :integer          not null, primary key
#  email            :string           not null
#  provider         :string           not null
#  uid              :string           not null
#  first_name       :string           not null
#  last_name        :string           not null
#  oauth_token      :string           not null
#  oauth_expires_at :datetime         not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class User < ActiveRecord::Base
  has_many :items, inverse_of: :consultant
  has_many :sales, through: :items, source: :sales
  has_many :customers, through: :sales
  has_many(
    :created_customers,
    class_name: 'Customer',
    foreign_key: :consultant_id
  )

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.email = auth[:email]
      user.provider = auth[:provider]
      user.uid = auth[:uid]
      user.first_name = auth[:first_name]
      user.last_name = auth[:last_name]
      user.oauth_token = auth[:oauth_token]
      user.oauth_expires_at = auth[:oauth_expires_at]
      user.save!
    end
  end

  def name
    "#{ first_name } #{ last_name }"
  end
end

