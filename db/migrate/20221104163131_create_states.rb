class CreateStates < ActiveRecord::Migration[6.0]
  def change
    create_table :states do |t|
      t.integer :heroku_id
      t.string :code
      t.string :name
      t.integer :country_id
      t.timestamps
    end
  end
end
