class CreateAuthentications < ActiveRecord::Migration
  def change
    create_table :authentications do |t|
      t.string :uid
      t.string :token
      t.string :provider
      t.string :user_id
      t.timestamps null: false
    end
  end
end
