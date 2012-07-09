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
		#    "advertiser":"coupons.com",
		#    "gdn_display_ad_count":253,
		#    "gdn_text_ad_first_seen":"2011-03-01",
		#    "gdn_display_ad_last_seen":"2012-06-08",
		#    "gdn_display_ad_first_seen":"2011-06-14",
		#    "gdn_text_ad_last_seen":"2012-06-10",
		#    "gdn_text_ad_count":930
		# }	
		def list(advertiser)
			Mixrank.get("/advertisers/#{advertiser}")
		end

		# Text Ads by Advertiser
		# http://api.mixrank.com/v2/json/{api_key}/advertisers/{advertiser}/gdn/textads
		# returns relevant information about an advertisers Text Ads
		# required parameter(s):
		#   advertiser
		# example:
		#  Mixrank.connect("Your API key")
		#  Mixrank::Advertiser.text_ads("mint.com", [:offset => 0, :page_size => 10])
		# please see http://mixrank.com/api/documentation#advertiser_textads for
		# a description of all optional parameters 
		# returns:
		# {
		#    "total":400,
		#    "results":[
		#       {
		#          "body":"Choose as Many Coupons As You Wish. Print Free Coupons At Home Today!",
		#          "avg_position":"12.21",
		#          "hash":"c80695ea166f1a221448c0241335cb5a",
		#          "title":"Free Grocery Coupons",
		#          "first_seen":"2011-08-02",
		#          "display_url":"www.coupons.com",
		#          "times_seen":13639,
		#          "last_seen":"2012-05-24"
		#       },
		#       {
		#          "body":"Redeem at your local supermarket. Save money on household brands.",
		#          "avg_position":"10.17",
		#          "hash":"9a37d0a3d3168c90c514c19a44b88fcb",
		#          "title":"Print Grocery Coupons",
		#          "first_seen":"2011-08-02",
		#          "display_url":"www.coupons.com",
		#          "times_seen":9694,
		#          "last_seen":"2012-05-23"
		#       },
		#       {
		#          "body":"Print Free Coupons, Redeem At Your Local Store. Save Money Today!",
		#          "avg_position":"11.65",
		#          "hash":"25e13f20c8cb7ebed6fba5c717ceeeab",
		#          "title":"Free Coupons - Print Now",
		#          "first_seen":"2011-08-02",
		#          "display_url":"www.Coupons.com",
		#          "times_seen":7691,
		#          "last_seen":"2012-05-27"
		#       },
		#       {
		#          "body":"Redeem at your local supermarket. Save money on household brands.",
		#          "avg_position":"10.02",
		#          "hash":"060e16a6bc7d4990ebc0760fe3b1f24c",
		#          "title":"Print Grocery Coupons",
		#          "first_seen":"2011-08-15",
		#          "display_url":"www.Coupons.com",
		#          "times_seen":5811,
		#          "last_seen":"2012-05-27"
		#       }
		#    ],
		#    "page_size":4,
		#    "offset":0
		# }
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

			Mixrank.get("/advertisers/#{advertiser}/gdn/textads", :query => params)   			
		end

		# Display Ads by Advertiser
		# http://api.mixrank.com/v2/json/{api_key}/advertisers/{advertiser}/gdn/displayads
		# returns relevant information about an advertisers Display Ads
		# required parameter(s):
		#   advertiser
		# example:
		#  Mixrank.connect("Your API key")
		#  Mixrank::Advertiser.display_ads("mint.com", [:offset => 0, :page_size => 10])
		# please see http://mixrank.com/api/documentation#advertiser_displayads for
		# a description of all optional parameters 
		# returns:
		# {
		#    "total":144,
		#    "results":[
		#       {
		#          "last_seen":"2011-10-18",
		#          "hash":"5484b680f0f1d2a280b310561f6f9b47",
		#          "content_type":"gif",
		#          "format":{
		#             "width":120,
		#             "type":"Skyscraper",
		#             "height":600
		#          },
		#          "first_seen":"2011-08-10",
		#          "file_size":27072,
		#          "times_seen":224,
		#          "media_url":"http://media.mixrank.com/5484b680f0f1d2a280b310561f6f9b47.gif"
		#       },
		#       {
		#          "last_seen":"2011-10-17",
		#          "hash":"c2f4e6f7f04cf44c16c01575171d7e94",
		#          "content_type":"gif",
		#          "format":{
		#             "width":120,
		#             "type":"Skyscraper",
		#             "height":600
		#          },
		#          "first_seen":"2011-08-02",
		#          "file_size":28283,
		#          "times_seen":147,
		#          "media_url":"http://media.mixrank.com/c2f4e6f7f04cf44c16c01575171d7e94.gif"
		#       },
		#       {
		#          "last_seen":"2011-10-17",
		#          "hash":"163dfdf217cc9811b373d6e253488c6e",
		#          "content_type":"gif",
		#          "format":{
		#             "width":468,
		#             "type":"Banner",
		#             "height":60
		#          },
		#          "first_seen":"2011-08-03",
		#          "file_size":12823,
		#          "times_seen":146,
		#          "media_url":"http://media.mixrank.com/163dfdf217cc9811b373d6e253488c6e.gif"
		#       },
		#       {
		#          "last_seen":"2011-10-18",
		#          "hash":"084eb31735977947ff6f03f9d6e47e83",
		#          "content_type":"gif",
		#          "format":{
		#             "width":120,
		#             "type":"Skyscraper",
		#             "height":600
		#          },
		#          "first_seen":"2011-09-06",
		#          "file_size":23767,
		#          "times_seen":123,
		#          "media_url":"http://media.mixrank.com/084eb31735977947ff6f03f9d6e47e83.gif"
		#       }
		#    ],
		#    "page_size":4,
		#    "offset":0
		# }
		def display_ads(advertiser, opts={})
		  params = {
		        :offset => opts[:offset],
		        :page_size => opts[:page_size],
		        :min_times_seen => opts[:min_times_seen],
		        :max_times_seen => opts[:max_times_seen],
		        :first_seen_before => opts[:first_seen_before],
		        :first_seen_after => opts[:first_seen_after],
		        :last_seen_before => opts[:last_seen_before],
		        :last_seen_after => opts[:last_seen_after],
		        :sort_field => opts[:sort_field],
		        :sort_order => opts[:sort_order]
		      }.reject {|k,v| v == nil} unless opts.empty?	

			Mixrank.get("/advertisers/#{advertiser}/gdn/displayads", :query => params) 			
		end
		# Advertiser Keywords
		# http://api.mixrank.com/v2/json/{api_key}/advertisers/{advertiser}/gdn/keywords
		# returns relevant information about an advertiser's Google Display Network keywords
		# required parameter(s):
		#   advertiser
		# example:
		#  Mixrank.connect("Your API key")
		#  Mixrank::Advertiser.keywords("mint.com", [:offset => 0, :page_size => 10])
		# please see http://mixrank.com/api/documentation#advertiser_publishers for
		# a description of all optional parameters 
		# returns:
		# {
		#    "total":1413,
		#    "results":[
		#       {
		#          "first_seen":"2011-08-07",
		#          "times_seen":61,
		#          "keyword":"grocery coupons to print",
		#          "last_seen":"2011-08-07"
		#       },
		#       {
		#          "first_seen":"2011-08-07",
		#          "times_seen":51,
		#          "keyword":"apple coupons",
		#          "last_seen":"2011-08-07"
		#       },
		#       {
		#          "first_seen":"2011-08-07",
		#          "times_seen":51,
		#          "keyword":"coupons online",
		#          "last_seen":"2011-08-07"
		#       },
		#       {
		#          "first_seen":"2011-08-07",
		#          "times_seen":51,
		#          "keyword":"justice coupons",
		#          "last_seen":"2011-08-07"
		#       }
		#    ]
		# }
		def keywords(advertiser, opts={})
		  params = {
		        :offset => opts[:offset],
		        :page_size => opts[:page_size],
		        :min_times_seen => opts[:min_times_seen],
		        :max_times_seen => opts[:max_times_seen],
		        :first_seen_before => opts[:first_seen_before],
		        :first_seen_after => opts[:first_seen_after],
		        :last_seen_before => opts[:last_seen_before],
		        :last_seen_after => opts[:last_seen_after],
		        :sort_field => opts[:sort_field],
		        :sort_order => opts[:sort_order]
		      }.reject {|k,v| v == nil} unless opts.empty?
			Mixrank.get("/advertisers/#{advertiser}/gdn/keywords", :query => params) 
		end

		# Publishers by Advertiser
		# http://api.mixrank.com/v2/json/{api_key}/advertisers/{advertiser}/gdn/publishers
		# returns relevant information about an advertisers Publisher
		# required parameter(s):
		#   advertiser
		# example:
		#  Mixrank.connect("Your API key")
		#  Mixrank::Advertiser.publishers("mint.com", [:offset => 0, :page_size => 10])
		# please see http://mixrank.com/api/documentation#advertiser_publishers for
		# a description of all optional parameters 
		# returns:

		# {
		#    "total":1941,
		#    "results":[
		#       {
		#          "publisher":"kraftcoupons.net",
		#          "first_seen":"2011-06-14",
		#          "times_seen":267,
		#          "monthly_uniques":1205,
		#          "last_seen":"2012-05-27"
		#       },
		#       {
		#          "publisher":"generalmillscoupons.net",
		#          "first_seen":"2011-06-14",
		#          "times_seen":256,
		#          "monthly_uniques":0,
		#          "last_seen":"2012-05-23"
		#       },
		#       {
		#          "publisher":"cerealcoupons.org",
		#          "first_seen":"2011-06-14",
		#          "times_seen":248,
		#          "monthly_uniques":974,
		#          "last_seen":"2012-05-27"
		#       },
		#       {
		#          "publisher":"winndixiecoupons.com",
		#          "first_seen":"2011-06-14",
		#          "times_seen":214,
		#          "monthly_uniques":163,
		#          "last_seen":"2012-05-22"
		#       }
		#    ],
		#    "page_size":4,
		#    "offset":0
		# }
		def publishers(advertiser, opts={})
			params = {
		        :offset => opts[:offset],
		        :page_size => opts[:page_size],
		        :min_days_seen => opts[:min_days_seen],
		        :max_days_seen => opts[:max_days_seen],
		        :min_monthly_uniques => opts[:min_monthly_uniques],
		        :max_monthly_uniques => opts[:max_monthly_uniques],
		        :last_seen_before => opts[:last_seen_before],
		        :last_seen_after => opts[:last_seen_after],
		        :sort_field => opts[:sort_field],
		        :sort_order => opts[:sort_order]
		      }.reject {|k,v| v == nil} unless opts.empty?

			Mixrank.get("/advertisers/#{advertiser}/gdn/publishers", :query => params)
		end

	end
end