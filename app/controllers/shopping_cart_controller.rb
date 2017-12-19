class ShoppingCartController < ApplicationController
  protect_from_forgery with: :null_session
  def index
    @Cart = ShopCart.new
    puts "------------ in index ------------"
    @allItems = Item.all
    @allItems = @allItems.sort_by {|item| [item.price]}
    @ShopCart = ShopCart.all
    @user = params[:user]
  end

  def addToCart
    puts "--------------- in addToCart --------------"
    amount = params[:amountInput].to_f
    fruit = params[:shop_cart][:name]
    price = params[:shop_cart][:price].to_f
    username = params[:shop_cart][:user]
    total_price = amount * price
    map = {"amount" => amount, "fuirt" => fruit, "price" => total_price}
    newRow = ShopCart.new(map)
    if newRow.save
      puts "success"
      redirect_to controller: "shopping_cart", action: "index", user: username
    else
      redirect_to controller: "shopping_cart", action: "index", user: username
    end
    #respond_to do |format|
      #if newRow.save
        #puts "Success!"
        #format.html {redirect_to shopping_cart_url}
      #else
        #format.html {redirect_to "/"}
      #end
    #end
  end

  def removeFromCart
    fruit = params[:shop_cart][:name].to_s
    price = params[:shop_cart][:price]
    amount = params[:shop_cart][:amount]
    user = params[:shop_cart][:user]
    if ShopCart.delete(ShopCart.where(fuirt: fruit, amount:amount))
      puts "Sucess!"
      redirect_to controller: "shopping_cart", action: "index", user: user
    else
      redirect_to controller: "shopping_cart", action: "index", user: user
    end
  end

  def handlePost
    if params[:commit] == "add to cart"
      addToCart
    elsif params[:commit] = "remove From Cart"
      removeFromCart
    end
  end
end
