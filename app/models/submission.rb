class Submission < ActiveRecord::Base

  validates :journal_id, :date_made, presence: true

  belongs_to :journal
  has_many :submission_poems, inverse_of: :submission, dependent: :destroy
  has_many :poems, through: :submission_poems, source: :poem
  has_many :notes, as: :notable

  after_create :set_poem_status_to_submitted
  after_update :reset_poem_status, if: :rejected?
  after_update :adjust_poem_status, if: :accepted?

  attr_accessor :accepted_poem_ids

  def set_poem_status_to_submitted
    self.poems.update_all(status: "SUBMITTED")
  end

  def rejected?
    self.result_changed? && self.result == "REJECTION"
  end

  def accepted?
    self.result_changed? && self.result == "ACCEPTANCE"
  end

  def reset_poem_status
    self.poems.includes(:submissions).each do |poem|
      if poem.submissions.where("submissions.result = 'PENDING' OR submissions.result = 'ACCEPTED'").count == 0
        poem.update(status: "NONE")
      end
    end
  end

  def adjust_poem_status
    self.poems.includes(:submissions).each do |poem|
      if accepted_poem_ids.include?(poem.id.to_s)
        poem.update(status: "PUBLISHED")
      else
        if poem.submissions.where("submissions.result = 'PENDING'").count == 0
          poem.update(status: "NONE")
        end
      end
    end
  end

end
