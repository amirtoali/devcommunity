class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    paginates_per 5
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :work_expriences, dependent: :destroy
  has_many :connections,foreign_key: :user_id, dependent: :destroy
  has_many :connected_users, -> { where(connections: { status: 'accepted' }) }, through: :connections, source: :connected_user
  has_many :reverse_connections, class_name: 'Connection', foreign_key: :connected_user_id, dependent: :destroy
  has_many :followers, through: :reverse_connections, source: :user
  PROFILE_TITLE= [
  'sanair ruby on rails developer',
  'sanair ruby on rails developer',
  'frontend developer',
  'backend developer',
  'sanair ruby on rails developer',
  'project manager',
  'backend developer'
]
def user_name
  "#{self.first_name}" + "#{self.last_name}"
end
def user_locations
  "#{self.streat_adress}" + "#{self.city}"+ "#{self.state}"+ "#{self.country}" +"#{self.pincode}"
end
  def self.ransackable_attributes(auth_object = nil)
    ["about", "city", "contect_number", "country", "created_at", "data_of_birth", "email", "encrypted_password", "first_name", "id", "last_name", "perfile_title", "pincode", "remember_created_at", "reset_password_sent_at", "reset_password_token", "state", "streat_adress", "updated_at", "username"]
  end
  def check_if_already_connected?(current_user, user)
    current_user != user && !current_user.connections.pluck(:connected_user_id).include?(user.id)
  end
  def mutual_connections(user1, user2)
  User.joins(:connections)
      .where(connections: { user_id: user1.id })
      .where(id: user2.connected_users.pluck(:id))
end

end
