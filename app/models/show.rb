class Show < ActiveRecord::Base
    def self.highest_rating
        #returns highest rating
        self.maximum(:rating)
    end

    def self.most_popular_show
        #returns TV show with highest rating
        self.where("rating = ?", self.maximum(:rating)).first
        #Show.where("rating = ?", self.highest_rating).first
    end

    def self.lowest_rating
        #returns lowest rating
        self.minimum(:rating)
    end

    def self.least_popular_show
        #returns lowest rated tvv show
        self.where("rating = ?", self.lowest_rating).first
    end

    def self.ratings_sum
        #returns sum of all ratings
        #self.sum(:rating)
        self.sum("rating")
    end

    def self.popular_shows
        #returns array of all shows with rating>5
        self.where("rating >= ?", 5)
    end

    def self.shows_by_alphabetical_order
        #returns array of all shows in alpha order
        self.order("name ASC")
        # or self.order(:name)
    end
end