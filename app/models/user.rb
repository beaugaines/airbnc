class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  include Gravtastic
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: [:guest, :host]
  has_many :rooms
  has_gravatar
  has_many :reviews
  has_many :helpfuls
  
  def helpful_for(review)
    helpfuls.where(review_id: review.id).first
  end
end
