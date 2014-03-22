class Item < ActiveRecord::Base
	validates :price, numericality: { greater_than: 0, allow_nil: true } 
    validates :name, :description, presence: true	
    
    belongs_to :category

    after_initialize {  } # Item.new Item.first
    after_save       {  }      # Item.save; Item.create; item.update_atributes()
    after_create     { category.inc(:items_count, 1) }
    after_update     {  }
    after_destroy    { category.inc(:items_count, -1) }  # Item.destroy
end
