# == Schema Information
#
# Table name: firefly_events
#
#  id          :integer          not null, primary key
#  kind_id     :integer          not null
#  category_id :integer
#  client_id   :integer          not null
#  bundle_id   :integer          not null
#  created_at  :datetime
#

class Firefly::Event < ActiveRecord::Base
  belongs_to :kind
  belongs_to :category
  belongs_to :client
  belongs_to :bundle
end
