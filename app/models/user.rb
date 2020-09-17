# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :validatable,
         :confirmable,
         :lockable, :timeoutable, :trackable

  belongs_to :role, class_name: 'Role', optional: false
  has_one :profile
  accepts_nested_attributes_for :profile

  def admin?
    has_role? %i[club_admin super_admin]
  end

  def club_admin?
    has_role? [:club_admin]
  end

  def super_admin?
    has_role? [:super_admin]
  end

  # takes an array of role symbols
  def has_role?(role_sym_array)
    if role.present?
      role_sym_array.each do |role_sym|
        return true if role.system_name == role_sym.to_s
      end
    end
    false
  end
end
