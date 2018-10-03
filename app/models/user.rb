# frozen_string_literal: true

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User

  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  def self.like_users(id, tags)
    return [] if tags.empty?
    select('DISTINCT(user.id), user.name, t.* AS tags, image')
    .joins('INNER JOIN taggings tg on tg.user_id = user.id
            INNER JOINE tags on t on t.id = tg.tag_id')
      .where('t.name in (?) AND users.id <> ?', tags, id)
  end
end
