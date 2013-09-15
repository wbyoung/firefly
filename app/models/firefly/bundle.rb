# == Schema Information
#
# Table name: firefly_bundles
#
#  id   :integer          not null, primary key
#  name :string(255)      not null
#

class Firefly::Bundle < ActiveRecord::Base
  has_many :events, dependent: :destroy
end
