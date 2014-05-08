class AddPrescriberPhoneToMeds < ActiveRecord::Migration
  def change
    add_column :meds, :phone, :string
  end
end
