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
  a=cart.map do |k, v|
    if v[:clearance]
      num=(v[:price]* 0.8).round(3)
      v[:price] =num
      [k,v]
    else
      [k,v]
    end
  end
  p a.to_h
  a.to_h
end

def checkout(cart, coupons)
  
end
