class FoodFacade
  def self.search_foods(search)
    FoodService.search_foods(search).map do |food|
      Food.new(food)
    end
  end

  def self.result_count(search)
    food_data = FoodService.result_count(search)
    food_data[:totalHits]
  end
end
