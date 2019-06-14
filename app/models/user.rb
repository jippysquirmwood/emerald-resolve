class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_org_projects, dependent: :nullify
  # to events
  has_many :authored_events, through: :user_org_projects, source: :events
  # to org_projects
  has_many :org_projects, through: :user_org_projects
  # to orgs
  has_many :orgs, through: :org_projects
  # to projects
  has_many :projects, through: :org_projects
end
