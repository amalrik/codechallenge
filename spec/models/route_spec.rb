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

require 'rails_helper'

RSpec.describe Route, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
