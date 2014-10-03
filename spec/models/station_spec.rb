# == Schema Information
#
# Table name: stations
#
#  id           :integer          not null, primary key
#  latitude     :float
#  longitude    :float
#  name         :string(255)
#  display_name :text
#  zone         :float
#  total_lines  :integer
#  rail         :integer
#  created_at   :datetime
#  updated_at   :datetime
#

require 'rails_helper'

RSpec.describe Station, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
