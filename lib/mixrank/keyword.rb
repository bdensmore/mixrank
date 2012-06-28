module	Mixrank

	# Keyword class file. 
	# Contains all methods associated with keywords
	# based on the Mixrank API
	class Keyword < MixrankObject

		# Keyword
		# http://api.mixrank.com/v1/json/{api_key}/keyword/{keyword}
		# returns summary information for a given keyword
		# required parameter(s):
		#   keyword
		# example:
		#  Mixrank.connect("Your API key")
		#  Mixrank::Keyword.search("refinance") 
		# returns:
		# {
		#    "gdn_text_count": 8,
		#    "gdn_banner_count": 9,
		#    "keyword": "refinance"
		# }
		def search(keyword)
			Mixrank.get("/keyword/#{keyword}")
		end

		# Text Ads by Keyword
		# http://api.mixrank.com/v1/json/{api_key}/keyword/{keyword}/adsense/textads
		# returns summary information for a given keyword based on AdSense text ads
		# required parameter(s):
		#   keyword
		# please see http://mixrank.com/api/documentation#keyword_textads for
		# a description of all optional parameters 
		#  Mixrank.connect("Your API key")
		#  Mixrank::Keyword.text_ads("refinance", [:offset => 0, :page_size => 10])
		def text_ads(keyword, opts={})
			 params = {
	      :offset => opts[:offset],
	      :page_size => opts[:page_size],
	      :min_avg_position => opts[:min_avg_position],
	      :max_avg_position => opts[:max_avg_position],
	      :min_times_seen => opts[:min_times_seen],
	      :max_times_seen => opts[:max_times_seen],
	      :first_seen_before => opts[:first_seen_before],
	      :first_seen_after => opts[:first_seen_after],
	      :last_seen_before => opts[:last_seen_before],
	      :last_seen_after => opts[:last_seen_after],
	      :sort_field => opts[:sort_field],
	      :sort_order => opts[:sort_order]
	    }.reject {|k,v| v == nil} unless opts.empty?	
			
			Mixrank.get("/keyword/#{keyword}/adsense/textads", :query => params)
		end

	end
end