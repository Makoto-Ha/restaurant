require 'digest'
class User < ApplicationRecord
  validates :email, presence: true,
                    uniqueness: true,
                    format: { with: /.+\@.+\..+/}

  validates :password, presence: true,
                       confirmation: true

  
  before_create :encrypt_password
  
  module Encrypt
    def self.encrypt_password
      self.password = Digest::SHA1.hexdigest(salted)
    end
  
    def self.salted(password, head = '123', tail = 'xx')
      "#{head}#{password}#{tail}"
    end  
  end

  def self.login(params)
    # include Encrypt
    email = params[:email]
    password = params[:password]

    encrypted_password = Digest::SHA1.hexdigest(salted)
    find_by(email: email, password: encrypted_password)
  end
end
