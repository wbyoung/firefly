# == Schema Information
#
# Table name: firefly_categories
#
#  id   :integer          not null, primary key
#  name :string(255)      not null
#

class Firefly::Category < ActiveRecord::Base
  has_many :events, dependent: :destroy
end
