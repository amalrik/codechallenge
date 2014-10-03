# == Schema Information
#
# Table name: lines
#
#  id         :integer          not null, primary key
#  station1   :integer
#  station2   :integer
#  line       :integer
#  created_at :datetime
#  updated_at :datetime
#

class Line < ActiveRecord::Base
end
