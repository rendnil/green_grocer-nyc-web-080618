def consolidate_cart(cart)
  new_hash = {  }
  
  count_array = [ ]
  cart.each do |item|
    #print item
    item.each do |item_name, traits|
      count_array.push(item_name)
  
  
  cart.each do |item|
    #print item
    item.each do |item_name, traits|
      #puts item_name
      #puts traits
      traits.each do |key, value|
        #puts key
        #puts value
        if new_hash[item_name] ==nil
           new_hash[item_name] = { } 
           new_hash[item_name][key] = value
        else
          new_hash[item_name][key] = value
          new_hash[item_name][:count] = count_array.count(item_name)
end        
end
end
end
end  
end 
#puts count_array
#puts new_hash
new_hash
end

def apply_coupons(cart, coupons)
  
  #coupon count
  coupon_count = [ ]
  coupons.each do |coupon|
    coupon_count.push(coupon[:item])
  end
  
  
  coupons.each do |coupon|
    #puts coupon[]
    if cart.keys.include?(coupon[:item]) == true
    
    cart["#{coupon[:item]} W/COUPON"] = {:price => coupon[:cost], :clearance => cart[coupon[:item]][:clearance], :count => coupon_count.count(coupon[:item])}
    coupon.each do |key, value|
      #puts key
      #puts value
      cart.each do |item_name, attributes|
        #puts item_name
        #puts attributes
        if key == :item && value == item_name
          #puts item_name
          cart[item_name][:count] = cart[item_name][:count] - coupon[:num]
         
end      
end       
end  
end  
end
 #puts cart
 cart
end

def apply_clearance(cart)
 
 cart.each do |item_name, attributes|
   if attributes[:clearance] == true
     attributes[:price] = (0.8*attributes[:price]).round(2)
   end
 end
 cart
end

def checkout(cart, coupons)
  updated_cart = apply_coupons(cart, coupons)
  updated_cart = apply_clearance(updated_cart)
  
  cost_array = [ ]
  
  updated_cart.each do |item_name, attributes|
    cost_array.push(attributes[:price]*attributes[:count])
  
  end  
  puts cost_array
end

items = [
      {"AVOCADO" => {:price => 3.00, :clearance => true}},
      {"AVOCADO" => {:price => 3.00, :clearance => true}},
      {"BLACK_BEANS" => {:price => 2.50, :clearance => false}},
      {"ALMONDS" => {:price => 9.00, :clearance => false}},
      {"TEMPEH" => {:price => 3.00, :clearance => true}},
      {"CHEESE" => {:price => 6.50, :clearance => false}},
      {"BEER" => {:price => 13.00, :clearance => false}},
      {"PEANUTBUTTER" => {:price => 3.00, :clearance => true}},
      {"BEETS" => {:price => 2.50, :clearance => false}},
      {"SOY MILK" => {:price => 4.50, :clearance => true}}
    ]
    
cart = consolidate_cart(items)

coupons = [
      {:item => "AVOCADO", :num => 2, :cost => 5.00},
      {:item => "BEER", :num => 2, :cost => 20.00},
      {:item => "CHEESE", :num => 3, :cost => 15.00}
    ]    
  #consolidate_cart(items) 
  
#apply_clearance(cart)
checkout(cart, coupons)