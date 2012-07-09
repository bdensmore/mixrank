module	Mixrank
	
	# Publisher class file. 
	# Contains all methods associated with a publisher
	# based on the Mixrank API
	class Publisher < MixrankObject

		# Publisher
		# http://api.mixrank.com/v2/json/{api_key}/publishers/{publisher}
		# This will list information about a specific publisher
		# The publishers domain must not contain the "www." prefix
		# required parameter(s):
		# 	publisher
		# example:
		#   Mixrank.connect("Your API Key")
		#  	Mixrank::Publisher.list("guardian.co.uk")
		# returns:
		# {
		#    "publisher":"guardian.co.uk",
		#    "gdn_display_ad_count":561,
		#    "gdn_text_ad_first_seen":"2011-08-01T14:00:06.934974",
		#    "gdn_display_ad_last_seen":"2012-06-09T14:01:03.970283",
		#    "gdn_display_ad_first_seen":"2011-06-14T15:06:16.531731",
		#    "gdn_text_ad_last_seen":"2012-06-10T14:00:29.233902",
		#    "gdn_text_ad_count":2375
		# }
		def list(publisher)
			Mixrank.get("/publishers/#{publisher}")
		end

		# Publisher >> Advertisers
		# http://api.mixrank.com/v2/json/{api_key}/publishers/{publisher}/gdn/advertisers
		# returns relevant information about advertisers that have run ads on this publisher.
		# required parameter(s):
		#   publisher
		# example:
		#  Mixrank.connect("Your API key")
		#  Mixrank::Publisher.advertisers("guardian.co.uk", [:offset => 0, :page_size => 10])
		#  please see http://mixrank.com/api/documentation#publisher_advertisers for
		# a description of all optional parameters 
		# returns:
		# {
		#    "total":732,
		#    "results":[
		#       {
		#          "advertiser":"lumosity.com",
		#          "first_seen":"2011-06-23",
		#          "times_seen":76,
		#          "last_seen":"2012-05-20"
		#       },
		#       {
		#          "advertiser":"ongo.com",
		#          "first_seen":"2011-08-14",
		#          "times_seen":40,
		#          "last_seen":"2011-10-02"
		#       },
		#       {
		#          "advertiser":"yahoo.com",
		#          "first_seen":"2011-06-18",
		#          "times_seen":40,
		#          "last_seen":"2011-10-05"
		#       },
		#       {
		#          "advertiser":"norwich.edu",
		#          "first_seen":"2011-06-14",
		#          "times_seen":37,
		#          "last_seen":"2011-10-09"
		#       }
		#    ],
		#    "page_size":4,
		#    "offset":0
		# }
		def advertisers(publisher, opts={})
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
			Mixrank.get("/publishers/#{publisher}/gdn/advertisers", :query => params) 
		end

		# Text Ads by Publisher
		# http://api.mixrank.com/v2/json/{api_key}/publishers/{publisher}/gdn/textads
		# returns relevant information about Google Display Network text ads for a publisher.
		# required parameter(s):
		#   publisher
		# example:
		#  Mixrank.connect("Your API key")
		#  Mixrank::Publisher.text_ads("guardian.co.uk", [:offset => 0, :page_size => 10])
		# please see http://mixrank.com/api/documentation#publisher_textads for
		# a description of all optional parameters 
		# returns:
		# {
		#    "total":831,
		#    "results":[
		#       {
		#          "body":"We Can Help! Let experienced attorneys represent you.",
		#          "advertiser":"wealthplan.com",
		#          "avg_position":"12.26",
		#          "title":"Guardianship",
		#          "first_seen":"2011-08-03",
		#          "display_url":"www.WealthPLAN.com",
		#          "times_seen":19,
		#          "last_seen":"2012-01-14"
		#       },
		#       {
		#          "body":"BP continues their work in the Gulf. Visit BP.com to learn how.",
		#          "advertiser":"bp.com",
		#          "avg_position":"4.33",
		#          "title":"BP's Work in the Gulf",
		#          "first_seen":"2011-08-02",
		#          "display_url":"www.BP.com/GulfOfMexicoResponse",
		#          "times_seen":12,
		#          "last_seen":"2011-10-16"
		#       },
		#       {
		#          "body":"Games You Didn't Know Existed to Fight Brain Decline and Aging.",
		#          "advertiser":"lumosity.com",
		#          "avg_position":"4.00",
		#          "title":"Exercise Your Brain",
		#          "first_seen":"2012-01-08",
		#          "display_url":"www.lumosity.com",
		#          "times_seen":11,
		#          "last_seen":"2012-05-20"
		#       },
		#       {
		#          "body":"Insurance Advice, Tools, Articles & Quotes. Find What's Best for You.",
		#          "advertiser":"yahoo.com",
		#          "avg_position":"11.56",
		#          "title":"Car Insurance: Free Info",
		#          "first_seen":"2011-08-14",
		#          "display_url":"autos.yahoo.com",
		#          "times_seen":9,
		#          "last_seen":"2011-09-27"
		#       }
		#    ],
		#    "page_size":4,
		#    "offset":0
		# }
		def text_ads(publisher, opts={})
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

			Mixrank.get("/publishers/#{publisher}/gdn/textads", :query => params)   			
		end

		# Display Ads by Publisher
		# http://api.mixrank.com/v2/json/{api_key}/publishers/{publisher}/gdn/displayads
		# returns relevant information about Google Display Network display ads for a publisher.
		# required parameter(s):
		#   publisher
		# example:
		#  Mixrank.connect("Your API key")
		#  Mixrank::Publisher.display_ads("guardian.co.uk", [:offset => 0, :page_size => 10])
		# please see http://mixrank.com/api/documentation#publisher_displayads for
		# a description of all optional parameters 
		# returns:
		# {
		#    "total":276,
		#    "results":[
		#       {
		#          "last_seen":"2012-05-30",
		#          "hash":"d5d6621595dd560812f0ae9cb9d44c94",
		#          "content_type":"swf",
		#          "format":{
		#             "width":250,
		#             "type":"Square",
		#             "height":250
		#          },
		#          "first_seen":"2011-06-23",
		#          "file_size":19971,
		#          "times_seen":44,
		#          "media_url":"http://media.mixrank.com/d5d6621595dd560812f0ae9cb9d44c94.swf"
		#       },
		#       {
		#          "last_seen":"2011-10-16",
		#          "hash":"96a908e3ca50f6ae0d062718b885b017",
		#          "content_type":"jpg",
		#          "format":{
		#             "width":200,
		#             "type":"Small square",
		#             "height":200
		#          },
		#          "first_seen":"2011-06-17",
		#          "file_size":30928,
		#          "times_seen":35,
		#          "media_url":"http://media.mixrank.com/96a908e3ca50f6ae0d062718b885b017.jpg"
		#       },
		#       {
		#          "last_seen":"2012-01-08",
		#          "hash":"08b12d5490e06f846aa1025271701403",
		#          "content_type":"gif",
		#          "format":{
		#             "width":200,
		#             "type":"Small square",
		#             "height":200
		#          },
		#          "first_seen":"2011-08-19",
		#          "file_size":42915,
		#          "times_seen":31,
		#          "media_url":"http://media.mixrank.com/08b12d5490e06f846aa1025271701403.gif"
		#       },
		#       {
		#          "last_seen":"2012-01-08",
		#          "hash":"d634e8edfc29e4a67fd91c6fd472c37f",
		#          "content_type":"jpg",
		#          "format":{
		#             "width":120,
		#             "type":"Skyscraper",
		#             "height":600
		#          },
		#          "first_seen":"2011-06-15",
		#          "file_size":30236,
		#          "times_seen":30,
		#          "media_url":"http://media.mixrank.com/d634e8edfc29e4a67fd91c6fd472c37f.jpg"
		#       }
		#    ],
		#    "page_size":4,
		#    "offset":0
		# }
		def display_ads(publisher, opts={})
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

			Mixrank.get("/publishers/#{publisher}/gdn/displayads", :query => params) 			
		end

	end
end