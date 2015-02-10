class Note < ActiveRecord::Base

  validates :body, :notable_id, :notable_type, presence: true

  belongs_to :notable, polymorphic: true

end
