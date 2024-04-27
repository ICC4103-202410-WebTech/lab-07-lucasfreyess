class Tag < ApplicationRecord
    has_many :post_tags, class_name: 'PostTag'
    has_many :posts, through: :post_tags

    validates :name, presence: {message: "must be present.."}, 
                    uniqueness: {message: "must be unique! there's already a tag named like that.."}

    validate :print_errors
    
    def print_errors
        puts errors.full_messages
    end
end