# == Schema Information
#
# Table name: lines
#
#  id           :integer          not null, primary key
#  station_a_id :integer
#  station_b_id :integer
#  line         :integer
#  created_at   :datetime
#  updated_at   :datetime
#

class Lines < ActiveRecord::Base
end
