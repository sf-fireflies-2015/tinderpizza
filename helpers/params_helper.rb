helpers do

  def params_whitelist(allowed_keys)
    selected = params.select do |key, value|
      allowed_keys.include? key.to_sym
    end
  end

end