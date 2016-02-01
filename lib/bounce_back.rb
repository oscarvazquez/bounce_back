require "bounce_back/version"
# special characters
# email
# 
module BounceBack
	module_function
	def check_email(email)
		if email =~ /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
			return true
		else 
			return false
		end
	end

	def no_special(string)
		if string =~ /[^A-Za-z0-9]/
			return false
		else
			return true
		end
	end

	def escape_special(string)
    	pattern = /(\'|\"|\.|\*|\/|\-|\\)/
   		string.gsub(pattern){|match|"\\"  + match}
   	end

   	def pass_the_same(pass1, pass2)
   		if pass1 == pass2
   			return true
   		else
   			return false
   		end
   	end
end