class CreateCountries < ActiveRecord::Migration[6.0]
  def change
    create_table :countries do |t|
      t.integer :heroku_id
      t.string :code
      t.string :name
      t.timestamps
    end
  end
end
