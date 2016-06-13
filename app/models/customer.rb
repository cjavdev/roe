# == Schema Information
#
# Table name: customers
#
#  id          :integer          not null, primary key
#  name        :string
#  address_one :string
#  address_two :string
#  city        :string
#  state       :string
#  zip         :string
#  email       :string
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Customer < ActiveRecord::Base
  has_many :items
end
