class User < ActiveRecord::Base
  # users.password_hash in the database is a :string
  include BCrypt

  has_many :questions
  has_many :answers
  has_many :votes
  has_many :comments

  validates_presence_of :password
  validates_presence_of :email
  validates_uniqueness_of :email
  
  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end