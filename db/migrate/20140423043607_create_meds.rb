class CreateMeds < ActiveRecord::Migration
  def change
    create_table :meds do |t|
      t.string :med_name
      t.string :dosage
      t.string :time_of_day
      t.string :prescriber

      t.timestamps
    end
  end
end
