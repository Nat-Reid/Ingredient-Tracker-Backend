class UserIngredientSerializer < ActiveModel::Serializer
  attributes :id, :expiration_date, :quantity
  belongs_to :ingredient
end
