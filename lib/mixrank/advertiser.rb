module Mixrank
	
	# Advertiser class file. 
	# Contains all methods associated with an advertiser
	# based on the Mixrank API
	class Advertiser < MixrankObject

		# Advertiser
		# This will list information about a specific advertiser
		# The advertisers domain must not contain the "www." prefix
		# required parameter(s):
		# 	advertiser
		# example:
		#   Mixrank.connect("Your API Key")
		#  	Mixrank::Advertiser.list("google.com")
		# returns:
		#   Returns a single result with the following properties:
		# {
		#     "advertiser": "freecreditreport.com", 
		#     "gdn_banner_count": 1340, 
		#     "gdn_banner_first_seen": "2011-11-30", 
		#     "gdn_banner_last_seen": "2012-01-10", 
		#     "gdn_publisher_count": 5224, 
		#     "gdn_text_count": 3142, 
		#     "gdn_text_first_seen": "2011-03-01", 
		#     "gdn_text_last_seen": "2012-01-10"
		# }		
		def list(advertiser)
			Mixrank.get("/advertiser/#{advertiser}")
		end

		# Text Ads by Advertiser
		# http://api.mixrank.com/v1/json/{api_key}/advertiser/{advertiser}/adsense/textads
		# returns relevant information about an advertisers Text Ads
		# required parameter(s):
		#   advertiser
		# example:
		#  Mixrank.connect("Your API key")
		#  Mixrank::Advertiser.text_ads("mint.com", [:offset => 0, :page_size => 10])
		# please see http://mixrank.com/api/documentation#advertiser_textads for
		# a description of all optional parameters 
		# returns:
		# [
    #  {
    #    "avg_position": "9.88", 
    #    "display_url": "www.Mint.com", 
    #    "first_seen": "2011-03-01", 
    #    "last_seen": "2011-10-01", 
    #    "publisher_count": 261, 
    #    "text": "Create a personal budget & track your expenses for free with Mint!", 
    #    "times_seen": 3158, 
    #    "title": "Personal Budget Worksheet"
    #  }, 
    # ]
		def text_ads(advertiser, opts={})
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

			Mixrank.get("/advertiser/#{advertiser}/adsense/textads", :query => params)   			
		end

		# Publishers by Advertiser
		def publishers
					  params = {
		        :offset => opts[:offset],
		        :page_size => opts[:page_size],
		        :min_avg_position => opts[:min_avg_position],
		        :max_avg_position => opts[:max_avg_position],
		        :min_days_seen => opts[:min_days_seen],
		        :max_days_seen => opts[:max_days_seen],
		        :min_monthly_uniques => opts[:min_monthly_uniques],
		        :max_monthly_uniques => opts[:max_monthly_uniques],
		        :last_seen_before => opts[:last_seen_before],
		        :last_seen_after => opts[:last_seen_after],
		        :sort_field => opts[:sort_field],
		        :sort_order => opts[:sort_order]
		      }.reject {|k,v| v == nil} unless opts.empty?

			Mixrank.get("/advertiser/#{advertiser}/adsense/publishers", :query => params)
		end

	end
end