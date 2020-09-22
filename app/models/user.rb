class User < ApplicationRecord
  before_destroy :destroy_admin
  before_update :update_admin

  validates :name,  presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 }, uniqueness: true, on: :create,
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  before_validation { email.downcase! }

  has_secure_password
  has_many :tasks, dependent: :destroy


  private
  def destroy_admin
    if User.where(admin: true).count == 1
      user = User.where(admin: true)
      throw :abort if user[0] == self
    end
  end

  def update_admin
    if User.where(admin: true).count == 1 && admin == false
      user = User.where(admin: true)
      if user[0] == self
        errors.add(:user, 'you are currently the only administrator. Please choose another administrator before ')
        throw :abort
      end
    end
  end
end
