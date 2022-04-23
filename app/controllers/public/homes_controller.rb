class Public::HomesController < ApplicationController
  def about
  end

  def top
    @items = Item.all.order(id: "DESC")
    
    @genres = Genre.all
  end
end
