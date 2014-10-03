# == Schema Information
#
# Table name: routes
#
#  id         :integer          not null, primary key
#  line_id    :integer
#  name       :string(255)
#  colour     :string(255)
#  stripe     :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Route < ActiveRecord::Base
end
