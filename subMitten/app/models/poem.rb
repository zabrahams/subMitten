class Poem < ActiveRecord::Base

  validates :title, :status, :written_on, presence: true
  validates :status, inclusion: ["NONE", "SUBMITTED", "PUBLISHED"]

end
