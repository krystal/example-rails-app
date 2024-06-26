# frozen_string_literal: true

# This migration comes from authie (originally 20141012174250)
class CreateAuthieSessions < ActiveRecord::Migration[6.1]

  def change
    create_table :authie_sessions do |t|
      t.string :token, :browser_id
      t.bigint :user_id
      t.boolean :active, default: true, null: false
      t.text :data
      t.datetime :expires_at
      t.datetime :login_at
      t.string :login_ip
      t.datetime :last_activity_at
      t.string :last_activity_ip, :last_activity_path
      t.string :user_agent
      t.timestamps null: true
    end
  end

end
