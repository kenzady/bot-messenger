class AddNotificationTimeToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :notification_time, :datetime
  end
end
