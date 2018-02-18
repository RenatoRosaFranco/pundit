class Task < ApplicationRecord
  # include Mailer

  self.table_name = 'tasks'
  self.primary_key = 'id'

  # Relationships
  # @implemented
  belongs_to :user

  # Scopes
  # @implemented
  scope :recent,  -> { order(created_at: :desc) }
  scope :by_user, ->(user) { where(user: user) } 
  scope :completed, -> { where(status: true) }
  scope :uncompleted, -> { where(status: false) }

  validates :name,
  			    presence:true,
  			    uniqueness: false,
  			    allow_blank: false,
  			    length: { minimum: 3, maximum: 30 }

  validates :description,
  			    presence: true,
  			    uniqueness: false,
  			    allow_blank: false,
  			    length: { minimum: 3, maximum: 245 }

  validates :status,
  		     	presence: true,
  			    uniqueness: false,
  			    allow_blank: false

  validates :tags,
  		    	presence: true,
  			    uniqueness: false,
  			    allow_blank: false,
  			    length: { minimum: 3, maximum: 75 }

  validates :user_id,
  			    presence: true,
  			    uniqueness: false,
  			    allow_blank: false,
  			    numericality: { only_integer: true }
end
