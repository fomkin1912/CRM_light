class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :group_users
  has_many :groups, through: :group_users
 
  has_one :address, as: :addressable, dependent: :destroy
  has_many :contacts
  has_many :assigned_contacts, class_name: :contacts, foreign_key: "assigned_to", validate: true

  belongs_to :group
  belongs_to :department
  belongs_to :position

  has_many :contacts

  after_initialize :init

  validates :name, :email, presence: true
  validates :email, uniqueness: true
  validates :enabled, :admin, inclusion: {in: [true, false]}

  accepts_nested_attributes_for :address, allow_destroy: true, update_only: true

  def full_name
    [name, mid_name, last_name].reject{ |x| x.blank? }.join(' ')
  end

  def init
    self.address ||= build_address if self.new_record?
  end

end
