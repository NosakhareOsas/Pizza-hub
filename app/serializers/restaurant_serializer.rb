class RestaurantSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :pizzas
  def pizzas 
    self.object.pizzas.map do |pizza|
      {
        id: pizza.id, 
        name: pizza.name,
        ingredients: pizza.ingredients
  }
    end 
  end 
end
