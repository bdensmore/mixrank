module	Mixrank
	
	# Publisher class file. 
	# Contains all methods associated with a publisher
	# based on the Mixrank API
	class Publisher < MixrankObject

		# Publisher
		# http://api.mixrank.com/v1/json/{api_key}/publisher/{publisher}
		# This will list information about a specific publisher
		# The publishers domain must not contain the "www." prefix
		# required parameter(s):
		# 	publisher
		# example:
		#   Mixrank.connect("Your API Key")
		#  	Mixrank::Publisher.list("freecreditreport.com")
		# returns:
		# 	{
	  #  "publisher": "guardian.co.uk", 
	  #  "gdn_banner_count": 1340, 
	  #  "gdn_banner_first_seen": "2011-11-30", 
	  #  "gdn_banner_last_seen": "2012-01-10",
	  #  "gdn_text_count": 3142, 
	  #  "gdn_text_first_seen": "2011-03-01", 
	  #  "gdn_text_last_seen": "2012-01-10"
		#		}
		def list(publisher)
			Mixrank.get("/publisher/#{publisher}")
		end

	end
end