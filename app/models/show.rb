# Show class that inherits from ActiveRecord::Base.

class Show < ActiveRecord::Base
  #highest_rating: this method should return the highest value in the ratings column
  # hint: if there is a #minimum Active Record method, might there be a #maximum method?
  def self.highest_rating
    # puts "******************#{self.class}"  #why is self.class 'Class' and not show?
      #because we are in self.x so we are calling this class's class
    self.maximum(:rating)
  end
  #most_popular_show: this method should return the show with the highest rating.
  # hint: use the #highest_rating method as a helper method.
  def self.most_popular_show#(argument)
    # puts "******************what is being passed?:#{argument}"
    # self.columns(:name)#.where(self.class.highest_rating)
    # puts "**************#{self.highest_rating}"
    # self.where(:rating == self.highest_rating)
    self.where("rating == ?", self.highest_rating)[0]#.name
  end
  #lowest_rating: returns the lowest value in the ratings column.
  def self.lowest_rating
    self.minimum(:rating)
  end
  #least_popular_show: returns the show with the lowest rating.
  def self.least_popular_show
    self.where("rating == ?", self.lowest_rating)[0]
  end
  #ratings_sum: returns the sum of all of the ratings.
  def self.ratings_sum
    self.sum(:rating)
  end
  #popular_shows: returns an array of all of the shows that have a rating greater than 5.
  # hint: use the #where Active Record method.
  def self.popular_shows
    self.where("rating > 5")
  end
  #shows_by_alphabetical_order: returns an array of all of the shows sorted by alphabetical order
  #   according to their names. hint: use the #order Active Record method.
  def self.shows_by_alphabetical_order
    self.order(:name)
  end
end
