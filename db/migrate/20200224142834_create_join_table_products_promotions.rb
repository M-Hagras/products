class CreateJoinTableProductsPromotions < ActiveRecord::Migration[5.2]
  def change
    create_join_table :products, :promotions do |t|
      # assuming that in our case we are getting promotions of product so indexing the product is the important
      t.index %i[product_id promotion_id]
      # t.index [:promotion_id, :product_id]
    end
  end
end
