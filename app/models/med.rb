class Med < ActiveRecord::Base
  
  validates(:med_name, :prescriber, {presence: true})

  belongs_to :user
  #validates_presence_of :user
end
