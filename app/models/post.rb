class Post < ApplicationRecord
    belongs_to :user, class_name: 'User'

    has_many :post_tags, class_name: 'PostTag'
    has_many :tags, through: :post_tags
    
    # one-to-many relationship between post and sub_posts
    belongs_to :post, class_name: 'Post', optional: true
    has_many :sub_posts, class_name: 'Post', foreign_key: 'post_id'

    validates :title, presence: {message: "of the post must be present!!"}
    
    validates :content, presence: {message: "is not present! you didn't write anything!"}
    
    validates :user_id, presence: {message: "wasn't assigned to this post."}
    
    validates :answers_count, numericality: {greater_than_or_equal_to: 0, 
                                             message: "must be greater or equal than 0!"}
    validates :likes_count, numericality: {greater_than_or_equal_to: 0, 
                                           message: "must be greater or equal than 0!"}

    validate :print_errors
    
    before_save :set_published_at_time_to_now
    
    def print_errors
        puts errors.full_messages
    end

    def set_published_at_time_to_now
        if self.published_at == nil
            self.published_at = Time.zone.now
        end
    end

end