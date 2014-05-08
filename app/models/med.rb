class Med < ActiveRecord::Base
  
  validates(:med_name, :prescriber, {presence: true})

  belongs_to :user

end
