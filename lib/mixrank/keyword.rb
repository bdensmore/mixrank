require 'uri'
module	Mixrank

	# Keyword class file. 
	# Contains all methods associated with keywords
	# based on the Mixrank API
	class Keyword < MixrankObject

		# Keyword
		# http://api.mixrank.com/v2/json/{api_key}/keywords/{keyword}
		# returns summary information for a given keyword
		# required parameter(s):
		#   keyword
		# example:
		#  Mixrank.connect("Your API key")
		#  Mixrank::Keyword.search("affordable life insurance", "cheap auto insurance") 
		# returns:
		# {
		#    "gdn_display_ad_count":66,
		#    "gdn_text_ad_first_seen":"2011-08-07T00:00:00",
		#    "keyword":"affordable life insurance",
		#    "gdn_display_ad_last_seen":"2012-06-09T00:00:00",
		#    "gdn_display_ad_first_seen":"2011-08-07T00:00:00",
		#    "gdn_text_ad_last_seen":"2012-06-10T00:00:00",
		#    "gdn_text_ad_count":147
		# }
		def search(keyword)
			escaped_keyword = URI.escape(keyword)
			Mixrank.get("/keywords/#{escaped_keyword}")
		end

		# Text Ads by Keyword
		# http://api.mixrank.com/v2/json/{api_key}/keywords/{keyword}/gdn/textads
		# Google Display Network text ads targeted at a given keyword
		# required parameter(s):
		#   keyword
		# please see http://mixrank.com/api/documentation#keyword_textads for
		# a description of all optional parameters 
		#  Mixrank.connect("Your API key")
		#  Mixrank::Keyword.text_ads("refinance", [:offset => 0, :page_size => 10])
		def text_ads(keyword, opts={})
			escaped_keyword = URI.escape(keyword)
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
			
			Mixrank.get("/keywords/#{escaped_keyword}/gdn/textads", :query => params)
		end

		# Advertisers by Keyword
		# http://api.mixrank.com/v2/json/{api_key}/keywords/{keyword}/gdn/advertisers
		# request the advertisers that show ads for a given keyword.
		# required parameter(s):
		#   keyword
		# please see http://mixrank.com/api/documentation#keyword_advertisers for
		# a description of all optional parameters 
		#  Mixrank.connect("Your API key")
		#  Mixrank::Keyword.advertisers("refinance", [:offset => 0, :page_size => 10])
		#  returns:
		# {
		#    "total":51,
		#    "results":[
		#       {
		#          "advertiser":"gohealthinsurance.com",
		#          "first_seen":"2011-08-07",
		#          "times_seen":264,
		#          "last_seen":"2012-05-31"
		#       },
		#       {
		#          "advertiser":"individualhealthquotes.com",
		#          "first_seen":"2011-08-07",
		#          "times_seen":53,
		#          "last_seen":"2012-05-31"
		#       },
		#       {
		#          "advertiser":"healthcare.com",
		#          "first_seen":"2011-08-08",
		#          "times_seen":42,
		#          "last_seen":"2012-05-31"
		#       },
		#       {
		#          "advertiser":"healthinsurancesort.com",
		#          "first_seen":"2011-08-07",
		#          "times_seen":42,
		#          "last_seen":"2012-05-31"
		#       }
		#    ],
		#    "page_size":4,
		#    "offset":0
		# }
		def advertisers(keyword, opts={})
			escaped_keyword = URI.escape(keyword)
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
			
			Mixrank.get("/keywords/#{escaped_keyword}/gdn/advertisers", :query => params)
		end

		# Display Ads by Keyword
		# http://api.mixrank.com/v2/json/{api_key}/keywords/{keyword}/gdn/displayads
		# request display ads targeting a given keyword
		# required parameter(s):
		#   keyword
		# please see http://mixrank.com/api/documentation#keyword_displayads for
		# a description of all optional parameters 
		#  Mixrank.connect("Your API key")
		#  Mixrank::Keyword.display_ads("refinance", [:offset => 0, :page_size => 10])
		# {
		#    "total":35,
		#    "results":[
		#       {
		#          "last_seen":"2012-05-30",
		#          "hash":"23cc5676980ee42cd10cf4800d1fcd05",
		#          "content_type":"swf",
		#          "format":{
		#             "width":468,
		#             "type":"Banner",
		#             "height":60
		#          },
		#          "first_seen":"2011-08-08",
		#          "file_size":14000,
		#          "times_seen":54,
		#          "media_url":"http://media.mixrank.com/23cc5676980ee42cd10cf4800d1fcd05.swf"
		#       },
		#       {
		#          "last_seen":"2012-05-31",
		#          "hash":"471075b65f8b5425af245e9380954943",
		#          "content_type":"swf",
		#          "format":{
		#             "width":250,
		#             "type":"Square",
		#             "height":250
		#          },
		#          "first_seen":"2011-08-07",
		#          "file_size":32908,
		#          "times_seen":47,
		#          "media_url":"http://media.mixrank.com/471075b65f8b5425af245e9380954943.swf"
		#       },
		#       {
		#          "last_seen":"2012-05-31",
		#          "hash":"6b24805612e0828a9d8dbe71626234b9",
		#          "content_type":"swf",
		#          "format":{
		#             "width":200,
		#             "type":"Small square",
		#             "height":200
		#          },
		#          "first_seen":"2011-08-08",
		#          "file_size":51169,
		#          "times_seen":47,
		#          "media_url":"http://media.mixrank.com/6b24805612e0828a9d8dbe71626234b9.swf"
		#       },
		#       {
		#          "last_seen":"2012-05-29",
		#          "hash":"636ff82d8f1e81aaa68dc3abc016992e",
		#          "content_type":"swf",
		#          "format":{
		#             "width":160,
		#             "type":"Wide skyscraper",
		#             "height":600
		#          },
		#          "first_seen":"2011-08-08",
		#          "file_size":15152,
		#          "times_seen":45,
		#          "media_url":"http://media.mixrank.com/636ff82d8f1e81aaa68dc3abc016992e.swf"
		#       }
		#    ],
		#    "page_size":4,
		#    "offset":0
		# }
		def display_ads(keyword, opts={})
			escaped_keyword = URI.escape(keyword)
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
			
			Mixrank.get("/keywords/#{escaped_keyword}/gdn/displayads", :query => params)
		end

	end
end