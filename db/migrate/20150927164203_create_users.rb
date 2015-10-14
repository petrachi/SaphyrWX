class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :name

      t.boolean :is_admin

      t.timestamps null: false
    end
  end
end
