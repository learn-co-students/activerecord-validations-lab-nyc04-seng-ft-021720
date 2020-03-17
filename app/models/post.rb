class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates_inclusion_of :category, :in => %w(Fiction Non-Fiction)
    validate :clickbait
    



    def clickbait
        phrases = ["Won't", "Believe", "Secret", "Top", "Guess"]

        if title != nil
            if !phrases.any? {|w| title[w]} 
            errors.add(:title, "help")
            end
        end 

    end
    



end

