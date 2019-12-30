class User < ApplicationRecord
  #データベースに渡される直前に小文字に変換（コールバックメソッドを使う）
  before_save { email.downcase! }
  
  #ユーザ属性の制限
  validates:name, presence:true, length:{ maximum:50 }

  #メール属性の制限
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates:email,presence:true, length:{ maximum:255},
           format: { with: VALID_EMAIL_REGEX },
           uniqueness: { case_sensitive: false }
  
  #パスワード
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
end
