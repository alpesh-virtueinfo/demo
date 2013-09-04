class AddLoginToUserSession < ActiveRecord::Migration
  def change
    add_column :user_sessions, :login, :string
  end
end
