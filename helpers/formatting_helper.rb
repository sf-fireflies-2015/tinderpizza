helpers do 

  def formating_price(price_cents)
    "$#{'%.2f' % (price_cents.to_i / 100.0)}"
  end

  def formating_diameter(inches)
    "#{inches.to_i} inches"
  end
end