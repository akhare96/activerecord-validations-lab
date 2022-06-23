class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
    validate :check_clickbait


    def check_clickbait
        a = [/Won't Believe/i, /Secret/i, /Top [0-9]*/i, /Guess/i]
        if a.none? {|b| b.match title }
            errors.add(:title, "You need a clickbait title")
        end
    end
end
