# == Schema Information
#
# Table name: firefly_clients
#
#  id   :integer          not null, primary key
#  name :string(255)      not null
#

class Firefly::Client < ActiveRecord::Base
  has_many :events, dependent: :destroy
end
