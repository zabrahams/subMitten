class Journal < ActiveRecord::Base

  validates :name, presence: true, uniqueness: true

end
