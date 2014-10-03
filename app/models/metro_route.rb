# == Schema Information
#
# Table name: metro_routes
#
#  id         :integer          not null, primary key
#  line       :integer
#  name       :string(255)
#  colour     :string(255)
#  stripe     :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class MetroRoute < ActiveRecord::Base
end
