class Journal < ActiveRecord::Base

  validates :name, presence: true, uniqueness: true

  has_many :submissions, dependent: :destroy

end
