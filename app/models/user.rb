class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :departamento, optional: true
  def admin?
    role == 'admin'
  end

  def gestor_de_rh?
    role == 'gestor de RH'
  end
end
