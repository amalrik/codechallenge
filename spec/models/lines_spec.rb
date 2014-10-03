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

require 'rails_helper'

RSpec.describe Lines, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
