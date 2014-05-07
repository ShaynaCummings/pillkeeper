class AddColumnUserIdToMeds < ActiveRecord::Migration
  def change
    add_column :meds, :user_id, :integer
  end
end
