class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_and_belongs_to_many :departamentos

  validates :name, presence: true
  validates :nivel, presence: true, inclusion: { in: %w(admin gestor_rh) }
       
  def admin?
    nivel == 'admin'
  end
       
  def gestor_rh?
    nivel == 'gestor_rh'
  end
end
