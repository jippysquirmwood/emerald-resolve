class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :authored_events, class_name: "Event", foreign_key: "author_id", dependent: :nullify
  has_many :user_org_projects, dependent: :nullify
  has_many :org_projects, through: :user_org_projects
  has_many :orgs, through: :org_projects
  has_many :projects, through: :org_projects
end
