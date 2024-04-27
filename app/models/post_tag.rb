class PostTag < ApplicationRecord
    belongs_to :post, class_name: 'Post'
    belongs_to :tag, class_name: 'Tag'

    validates :post_id, presence: {message: "the post's id must be present!!"}
    validates :tag_id, presence: {message: "the tag's id must be present!!"}
    
    before_save :print_errors

    def print_errors
        errors.each do |attribute, message|
            puts "#{attribute.capitalize} #{message}"
        end
    end
end