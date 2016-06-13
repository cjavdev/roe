# == Schema Information
#
# Table name: sales
#
#  id          :integer          not null, primary key
#  customer_id :integer
#  paid        :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Sale < ActiveRecord::Base
  belongs_to :customer
  has_many :sale_items
  has_many :items, through: :sale_items, source: :item
end
