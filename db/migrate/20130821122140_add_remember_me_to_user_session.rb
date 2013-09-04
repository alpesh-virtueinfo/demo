class AddRememberMeToUserSession < ActiveRecord::Migration
  def change
    add_column :user_sessions, :remember_me, :boolean
  end
end
