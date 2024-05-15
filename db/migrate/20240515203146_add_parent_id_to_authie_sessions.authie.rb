# frozen_string_literal: true

# This migration comes from authie (originally 20150109144120)
class AddParentIdToAuthieSessions < ActiveRecord::Migration[6.1]

  def change
    add_column :authie_sessions, :parent_id, :bigint
  end

end
