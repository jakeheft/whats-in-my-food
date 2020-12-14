class FoodService
  def self.result_count(search)
    response(search)
    food_data = JSON.parse(response(search).body, symbolize_names: true)
    food_data[:totalHits]
  end

  def self.search_foods(search)
    data = JSON.parse(response(search).body, symbolize_names: true)
    data[:foods]
  end

  private

  def self.conn
    Faraday.new('https://api.nal.usda.gov') do |f|
      f.headers['X-Api-Key'] = ENV['FOODS_API_KEY']
    end
  end

  def self.response(search)
    @response ||= conn.get('/fdc/v1/foods/search') do |req|
      req.params[:query] = search
      req.params[:pageSize] = 10
    end
  end
end
