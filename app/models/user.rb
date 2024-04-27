class User < ApplicationRecord
    has_many :posts, class_name: 'Post'

    validates :name, presence: {message: "must be present!!"}
    
    validates :email, presence: {message: "must be present!"},
                      uniqueness: {message: "is already registered.."},
                      format: {with: URI::MailTo::EMAIL_REGEXP, message: "format is invalid!"}
    
    validates :password, presence: {message: "can't be blank.."},
                         length: {minimum: 6, message: "must be at least 6 characters long"}
  
    validate :print_errors
    
    def print_errors
        puts errors.full_messages
    end
end
  