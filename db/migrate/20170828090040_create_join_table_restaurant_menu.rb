class CreateJoinTableRestaurantMenu < ActiveRecord::Migration[5.0]
  def change
    create_join_table :restaurants, :menus do |t|
      # t.index [:restaurant_id, :menu_id]
      # t.index [:menu_id, :restaurant_id]
    end
  end
end
