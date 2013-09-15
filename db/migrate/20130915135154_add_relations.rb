class AddRelations < ActiveRecord::Migration
  def change
    drop_table :firefly_events do |t|
      t.string :name, null: false
      t.string :category
      t.string :client_id, null: false
    end

    create_table :firefly_kinds do |t|
      t.string :name, null: false, unique: true
    end

    create_table :firefly_categories do |t|
      t.string :name, null: false, unique: true
    end

    create_table :firefly_clients do |t|
      t.string :name, null: false, unique: true
    end

    create_table :firefly_bundles do |t|
      t.string :name, null: false, unique: true
    end

    create_table :firefly_events do |t|
      t.integer :kind_id, null: false
      t.integer :category_id
      t.integer :client_id, null: false
      t.integer :bundle_id, null: false
      t.datetime :created_at
    end

    add_index :firefly_kinds, [:name]
    add_index :firefly_categories, [:name]
    add_index :firefly_clients, [:name]
    add_index :firefly_bundles, [:name]

    add_index :firefly_events, [:kind_id]
    add_index :firefly_events, [:category_id]
    add_index :firefly_events, [:client_id]
    add_index :firefly_events, [:bundle_id]
  end
end
