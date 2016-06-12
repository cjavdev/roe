# == Schema Information
#
# Table name: collections
#
#  id                         :integer          not null, primary key
#  title                      :string           not null
#  leading_photo_file_name    :string
#  leading_photo_content_type :string
#  leading_photo_file_size    :integer
#  leading_photo_updated_at   :datetime
#  user_id                    :integer          not null
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#

class Collection < ActiveRecord::Base
end
