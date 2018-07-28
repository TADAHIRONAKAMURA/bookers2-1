class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
     #:名前がdeviseの機能名, :パスワードリセット, :ログイン情報を保存する
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

 	#nameを必須・一意とする
  validates_uniqueness_of :name
  validates_presence_of :name

  # nameは必須 200字以内
  validates :name, presence: true
  validates :name, length: { minimum: 2, maximum: 20, }

#nameを利用してログインするようにオーバーライド
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      #認証の条件式を変更する
      where(conditions).where(["name = :value", { :value => name }]).first
    else
      where(conditions).first
    end
  end

  # captionは50字以内
  validates :caption, length: { maximum: 50 }



  # 登録時にemailを不要とする
  # def email_required?
  #   false
  # end

  # def email_changed?
  #   false
  # end


 	has_many :books
	attachment :image

end


