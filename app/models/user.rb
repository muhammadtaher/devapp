class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :projects
  validates_presence_of :first_name
  has_and_belongs_to_many :projects
  has_and_belongs_to_many :tasks
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable
end
