class Poem < ActiveRecord::Base

  validates :title, :status, :written_on, presence: true
  validates :status, inclusion: ["NONE", "SUBMITTED", "PUBLISHED"]

  has_many :submission_poems, dependent: :destroy
  has_many :submissions, through: :submission_poems, source: :submission

end
