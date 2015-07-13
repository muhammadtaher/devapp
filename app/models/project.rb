class Project < ActiveRecord::Base
	has_and_belongs_to_many :users
	belongs_to :user
	has_many :user_stories, :dependent => :destroy
	accepts_nested_attributes_for :user_stories
	  validates_presence_of :name

end
