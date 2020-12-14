class FoodService
  def self.search_foods(search)
    response = conn.get('/fdc/v1/foods/search') do |req|
      req.params[:query] = search
      req.params[:pageSize] = 10
    end
    food_data = JSON.parse(response.body, symbolize_names: true)
    food_data[:foods]
  end

  private

  def self.conn
    Faraday.new('https://api.nal.usda.gov') do |f|
      f.headers['X-Api-Key'] = ENV['FOODS_API_KEY']
    end
  end
end
