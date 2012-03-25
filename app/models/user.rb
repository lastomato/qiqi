class User
  include Mongoid::Document
  include Mongoid::Timestamps

  attr_accessor :password
  attr_accessible :username, :email, :password, :password_confirmation

  field :username
  field :email

  field :password_hash
  field :password_salt

  field :points, :type => Integer, :default => 0

  auto_increment :number
  index :number, :unique => true

  validates_presence_of :password, :on => :create
  validates_length_of :password, :in => 8..20
  validates_confirmation_of :password

  validates_uniqueness_of :username
  validates_format_of :username, :with => %r/\A[a-z0-9][a-z0-9_-]{1,14}\Z/

  validates_uniqueness_of :email
  validates_format_of :email, :with => %r/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/

  has_many :topics, :dependent => :nullify
  has_many :replies, :dependent => :nullify

  before_save :encrypt_password

  def self.authenticate(username, password)
    user = where(:username => username).first
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  def self.find_by_number(number)
    where(:number => number).first
  end
end
