class SubmissionPoem < ActiveRecord::Base

  validates :submission_id, :poem_id, presence: true
  validates :submission_id, uniqueness: { scope: :poem_id }

  belongs_to :submission
  belongs_to :poem

end
