class CreateEvent < ActiveRecord::Migration
  def change
    create_table :firefly_events do |t|
      t.string :name, null: false
      t.string :category
      t.string :client_id, null: false
    end
  end
end
