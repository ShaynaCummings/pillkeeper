class AddPrescriberContactInfo < ActiveRecord::Migration
  def change
    add_column :meds, :email, :string
  end
end
