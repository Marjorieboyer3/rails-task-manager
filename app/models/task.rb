class Task < ApplicationRecord

  after_create :set_completed_to_false

  def set_completed_to_false
    self.completed = false unless self.completed == true
  end
end
