class Comment < ApplicationRecord
  self.table_name ='comments'
  self.primary_key = 'id'

  # Relationships
  # @implemented
  belongs_to :task
  belongs_to :user

  # Scope 
  # @implemented
  scope :recent, -> { order(created_at: :desc) }
  scope :by_user, ->(user) { where(user: user) }
  scope :by_task, ->(task) { where(task: task) }

  # Validations 
  # @implemented
  validates :body,
  			presence: true,
  			uniqueness: false,
  			allow_blank: false,
  			length: { minimum: 3, maximum: 145 }

  validates :user_id,
  			presence: true,
  			uniqueness: false,
  			allow_blank: false,
  			numericality: { only_integer: true }

  validates :task_id,
  			presence: true,
  			uniqueness: false,
  			allow_blank: false,
  			numericality: { only_integer: true }
end
