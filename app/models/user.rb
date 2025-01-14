class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :work_expriences
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
end
