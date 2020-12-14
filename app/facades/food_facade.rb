class FoodFacade
  def self.search_foods(search)
    FoodService.search_foods(search).map do |food|
      Food.new(food)
    end
  end
end
