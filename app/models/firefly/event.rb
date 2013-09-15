# == Schema Information
#
# Table name: firefly_events
#
#  id        :integer          not null, primary key
#  name      :string(255)      not null
#  category  :string(255)
#  client_id :string(255)      not null
#

class Firefly::Event < ActiveRecord::Base
end
