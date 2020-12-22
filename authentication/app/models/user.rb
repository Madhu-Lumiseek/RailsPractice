class User
  attr_writer :login
  # attr_accessor :email, :password, :password_confirmation
  include Mongoid::Document
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # scope :all_active, -> { where(deleted_at: nil) }

  field :name,            type: String, default: ""
  field :username,        type: String, default: ""
  ## Database authenticatable
  field :email,              type: String, default: ""
  field :encrypted_password, type: String, default: ""

  ## Recoverable
  field :reset_password_token,   type: String
  field :reset_password_sent_at, type: Time

  ## Rememberable
  field :remember_created_at, type: Time

  validates_presence_of     :name # required
  validates_presence_of     :email # optional
  validates_presence_of     :username # required
  validates_uniqueness_of   :username # required    
  validates_presence_of     :password, if: :password_required? # recommended
  validates_confirmation_of :password, if: :password_required? # recommended
  validates_length_of       :password, within: password_length, allow_blank: true # recommended

  ## Trackable
  # field :sign_in_count,      type: Integer, default: 0
  # field :current_sign_in_at, type: Time
  # field :last_sign_in_at,    type: Time
  # field :current_sign_in_ip, type: String
  # field :last_sign_in_ip,    type: String

  ## Confirmable
  # field :confirmation_token,   type: String
  # field :confirmed_at,         type: Time
  # field :confirmation_sent_at, type: Time
  # field :unconfirmed_email,    type: String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, type: Integer, default: 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    type: String # Only if unlock strategy is :email or :both
  # field :locked_at,       type: Time

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      self.any_of({ :username => /^#{::Regexp.escape(login)}$/i}, { :email =>  /^#{::Regexp.escape(login)}$/i }).first
    else
      super
    end
  end 

  def login
    @login || self.username || self.email
  end

end
