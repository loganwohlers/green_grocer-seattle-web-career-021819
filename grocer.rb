def consolidate_cart(cart)
  newcart={}
  cart.each do |hashcart|
    hashcart.each do |k,v|
      if(!newcart.has_key?(k))
        newcart[k]={}
        v.each do |k2, v2|
          newcart[k][k2]=v2
        end
        newcart[k][:count]=1
      else
        newcart[k][:count]+=1
      end
    end
  end
  newcart
end

def apply_coupons(cart, coupons)
  newcart= {}
  #apply=false
  coupons.each do |save|
    word=save[:item]
    if cart.has_key?(word)
      cart[word][:count]-=save[:num]
      newword="#{word} W/COUPON"
      if !newcart.has_key?(newword)
        newcart[newword]={price: save[:cost],
        clearance: cart[word][:clearance], count: 1}
      else
        newcart[newword][:count]+=1
      end
    end
  end
  newcart.merge(cart)
end
  

def apply_clearance(cart)
  p cart
  cart.map do |k, v|
    puts cart[k]
    #puts v[:clearance]
    #puts  v[:price]
    if cart[k][:clearance]==true
      cart[k][:price] *= 0.8
    else
      v
    end
  end
    
end

def checkout(cart, coupons)
  # code here
end
