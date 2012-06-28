module Mixrank

	class Echo < MixrankObject
		
		# This will echo a response to make sure
		# you have a valid Mixrank API key.
		# example:
		# 	Mixrank.connect("Your API Key")
		#   Mixrank::Echo.status
		# returns:
		#   {"status": "Success"} - If valid 
		def status
			Mixrank.get("/echo")
		end

	end
end