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

require 'rails_helper'

RSpec.describe Lines, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
