class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_org_projects, dependent: :nullify
  # to events
  has_many :authored_events, through: :user_org_projects, source: :authored_events
  # has_many :base_authored_events, through: :user_org_projects, source: :authored_events, foreign_key: :author_id
  # to org_projects
  has_many :org_projects, through: :user_org_projects
  # to orgs
  has_many :orgs, through: :org_projects
  # to projects
  has_many :projects, through: :org_projects

  # validations
  validates :email, presence: true, uniqueness: true
  validates_format_of :email, with: Devise.email_regexp
  validates :username, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
end
