# == Schema Information
#
# Table name: firefly_kinds
#
#  id   :integer          not null, primary key
#  name :string(255)      not null
#

class Firefly::Kind < ActiveRecord::Base
  has_many :events, dependent: :destroy
end
