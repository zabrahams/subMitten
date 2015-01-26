class Submission < ActiveRecord::Base

  validates :journal_id, :date_made, presence: true

  belongs_to :journal
  has_many :submission_poems, inverse_of: :submission, dependent: :destroy
  has_many :poems, through: :submission_poems, source: :poem

end
