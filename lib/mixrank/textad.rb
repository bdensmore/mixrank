module Mixrank
	
	class TextAd < MixrankObject

		# Text Ad > Publishers
		# http://api.mixrank.com/v2/json/{api_key}/advertisers/{advertiser}/gdn/textads/{hash}/publishers
		# Use this endpoint to request the publishers for a given text ad.
		# required parameter(s):
		#   advertiser, id
		# please see http://mixrank.com/api/documentation#textad_publishers for
		# a description of all optional parameters 
		#  Mixrank.connect("Your API key")
		#  Mixrank::TextAd.publishers("coupons.com", "c80695ea166f1a221448c0241335cb5a" [:offset => 0, :page_size => 10])
		#  returns:
		# {
		#    "total":699,
		#    "results":[
		#       {
		#          "publisher":"cashpak.com",
		#          "monthly_uniques":0,
		#          "times_seen":41,
		#          "avg_position":"21.00",
		#          "first_seen":"2011-08-10",
		#          "last_seen":"2012-01-15"
		#       },
		#       {
		#          "publisher":"allcerealcoupons.com",
		#          "monthly_uniques":1175,
		#          "times_seen":41,
		#          "avg_position":"19.00",
		#          "first_seen":"2011-08-06",
		#          "last_seen":"2012-05-20"
		#       },
		#       {
		#          "publisher":"getcouponsonline.com",
		#          "monthly_uniques":0,
		#          "times_seen":40,
		#          "avg_position":"17.00",
		#          "first_seen":"2011-08-07",
		#          "last_seen":"2012-05-04"
		#       },
		#       {
		#          "publisher":"gracefullysaving.com",
		#          "monthly_uniques":423,
		#          "times_seen":37,
		#          "avg_position":"25.00",
		#          "first_seen":"2011-08-08",
		#          "last_seen":"2012-01-16"
		#       }
		#    ],
		#    "page_size":4,
		#    "offset":0
		# }
		def publishers(advertiser, id, opts={})
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

			Mixrank.get("/advertisers/#{advertiser}/gdn/textads/#{id}/publishers", :query => params) 
		end

		# Text Ad > Destinations
		# http://api.mixrank.com/v2/json/{api_key}/advertisers/{advertiser}/gdn/textads/{hash}/destinations
		# Use this endpoint to request the destinations for a given text ad.
		# required parameter(s):
		#   advertiser, id
		# please see http://mixrank.com/api/documentation#textad_destinations for
		# a description of all optional parameters 
		#  Mixrank.connect("Your API key")
		#  Mixrank::TextAd.destinations("coupons.com", "c80695ea166f1a221448c0241335cb5a" [:offset => 0, :page_size => 10])
		#  returns:
		# {
		#    "total":113,
		#    "results":[
		#       {
		#          "times_seen":5915,
		#          "first_seen":"2011-11-17",
		#          "destination_url":"http://tracker.marinsm.com/rd?cid=mantqcv9l0&mkwid=coqMCQCeU&pcrid=9329868065&kwd=coupons%20for%20free&mt=&lp=http%3A//print.coupons.com/alink.asp%3Fgo%3D13101pt8210%26PLID%3DGOGCNTB00028%26CRID%3DCNTB00028",
		#          "avg_position":"14.23",
		#          "last_seen":"2012-03-15"
		#       },
		#       {
		#          "times_seen":4427,
		#          "first_seen":"2011-09-16",
		#          "destination_url":"http://tracker.marinsm.com/rd?cid=mantqcv9l0&mkwid=c71xneHaz&pcrid=9329495105&kwd=print%20coupons&mt=&lp=http%3A//print.coupons.com/alink.asp%3Fgo%3D13101pt8210%26PLID%3DGOGCNTB00001%26CRID%3DCNTB00001",
		#          "avg_position":"13.02",
		#          "last_seen":"2012-03-13"
		#       },
		#       {
		#          "times_seen":2819,
		#          "first_seen":"2011-08-04",
		#          "destination_url":"http://print.coupons.com/alink.asp?go=13101pt8210&PLID=GOGCNTB00001&CRID=CNTB00001",
		#          "avg_position":"13.89",
		#          "last_seen":"2011-09-15"
		#       },
		#       {
		#          "times_seen":2237,
		#          "first_seen":"2012-03-19",
		#          "destination_url":"http://tracker.marinsm.com/rd?cid=mantqcv9l0&mkwid=cqjg1Asxl&pcrid=9330248585&kwd=&mt=&lp=http%3A//print.coupons.com/alink.asp%3Fgo%3D13101pt8210%26PLID%3DGOGCNTB00011%26CRID%3DCNTB00011",
		#          "avg_position":"8.54",
		#          "last_seen":"2012-06-09"
		#       }
		#    ],
		#    "page_size":4,
		#    "offset":0
		# }

		def destinations(advertiser, id, opts={})
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

			Mixrank.get("/advertisers/#{advertiser}/gdn/textads/#{id}/destinations", :query => params)			
		end

	end

end