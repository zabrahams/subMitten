class SubmissionPoem < ActiveRecord::Base

  validates :submission, :poem_id, presence: true
  validates :submission_id, uniqueness: { scope: :poem_id }

  belongs_to :submission, inverse_of: :submission_poems
  belongs_to :poem

end
