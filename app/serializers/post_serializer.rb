class PostSerializer
  include JSONAPI::Serializer
  attributes :id, :image, :name, :description, :pricePerHr, :seating_capacity, :rental_duration, 
end
