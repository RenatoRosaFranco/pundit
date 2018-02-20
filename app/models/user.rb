class User < ApplicationRecord
  self.table_name = 'users'
  self.primary_key = 'id'

  # Relationships
  # @implemented
  has_many :tasks, dependent: :destroy
  has_many :comments, dependent: :destroy

  # Methods
  # @implemented 
  def access
  	(self.admin.eql? true) ? 'Admin' : 'User'
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
