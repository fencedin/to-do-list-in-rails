class Task < ActiveRecord::Base
    validates :description, presence: true,
                            length: {maximum: 50}

  def self.completed
    Task.where(done: true)
  end

  def self.not_completed
    Task.where(done: nil)
  end
end

