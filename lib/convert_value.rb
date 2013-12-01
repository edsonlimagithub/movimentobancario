module ConvertValue

	def self.convertFormat valor
	    while valor["."]
	      valor["."] = ""  
	    end
	    valor[","]   = "."
	    return valor
  	end 

  	def self.convertPriceFormat valor
	    valor["R$ "] = ""
	    while valor["."]
	      valor["."] = ""  
	    end
	    valor[","]   = "."
	    return valor
  	end 

end