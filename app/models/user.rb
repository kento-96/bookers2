class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  has_many :favorites,dependent: :destroy

  has_many :follower,class_name:"Relationship",foreign_key:"follower_id",dependent: :destroy #フォロー取得
  has_many :followings,through: :follower,source: :followed #自分がフォローしている人

  has_many :followed,class_name:"Relationship",foreign_key:"followed_id",dependent: :destroy #フォロワー取得
  has_many :followers,through: :followed, source: :follower #自分をフォローしている人
  attachment :profile_image

 def follow(user_id)
   relationships.create(followed_id: user_id)
 end
 def unfollow(user_id)
   relationships.find_by(followed_id: user_id).destroy
 end
 def following?(user)
   followings.include?(user)
 end
  validates :name, uniqueness:true , presence:true, length: {maximum:20, minimum:2}
  validates :introduction,  length:{maximum:50}

end
