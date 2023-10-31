class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  validates :name, presence: true
  has_many :foods, foreign_key: 'user_id'
  has_many :recipes, foreign_key: 'user_id'

  def admin?
    # role == 'admin'
  end
end
