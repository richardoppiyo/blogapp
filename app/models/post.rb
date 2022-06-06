class Post < ApplicationRecord
    has_many :comments
    has_many :likes
    belongs_to :author, class_name: 'User'


    def display_comments
        comments.limit(5).order(created_at: :desc)
    end

    after_save :update_posts_counter_add
    
    def update_posts_counter_add
        author.increment!(:posts_counter)
    end
end