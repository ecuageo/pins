class AccessTokens < ActiveRecord::Migration
  def change
    create_table :access_tokens do |t|
      t.references :user
      t.string :token
      t.datetime :expires_at

      t.timestamps null: false
    end
  end
end
