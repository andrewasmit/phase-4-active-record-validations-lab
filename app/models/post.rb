class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, acceptance: { accept: ["Fiction", "Non-Fiction"],  message: "is not included in the list" }
    validate :valid_clickbait

    def valid_clickbait
        unless title.present? && title.include?("Won't Believe" || "Secret" || "Top [number]" || "Guess")
            errors.add(:title, "not click bait-y enough")
        end
    end
 
end
