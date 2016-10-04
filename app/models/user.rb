class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :group_users
  has_many :groups, through: :group_users
 
  has_one :address

  belongs_to :group
  belongs_to :department
  belongs_to :position

  after_initialize :init

  #validates :name, :last_name, :mid_name, :email, presence: true
 # validates :email, uniqueness: true
  validates :enabled, :admin, inclusion: {in: [true, false]}

  accepts_nested_attributes_for :address, allow_destroy: true, update_only: true

  def full_name
    [name, mid_name, last_name].join(' ').gsub('  ', ' ')
  end

  def init
    self.address ||= build_address if self.new_record?
  end

end
