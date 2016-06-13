# == Schema Information
#
# Table name: item_sizes
#
#  id         :integer          not null, primary key
#  item_id    :integer          not null
#  size       :integer          default(0), not null
#  sold       :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ItemSize < ActiveRecord::Base
  enum size: [:xxs, :xs, :small, :medium, :large, :xl, :xxl, :one_size, :tall_and_curvy]
  belongs_to :item
end
