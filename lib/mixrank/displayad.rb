module Mixrank
	
	class DisplayAd < MixrankObject

		# Display Ad > Publishers
		# http://api.mixrank.com/v2/json/{api_key}/advertisers/{advertiser}/gdn/displayads/{hash}/publishers
		# Use this endpoint to request the publishers for a display ad.
		# required parameter(s):
		#   advertiser, id
		# please see http://mixrank.com/api/documentation#displayad_publishers for
		# a description of all optional parameters 
		#  Mixrank.connect("Your API key")
		#  Mixrank::DisplayAd.publishers("coupons.com", "c80695ea166f1a221448c0241335cb5a" [:offset => 0, :page_size => 10])
		#  returns:
		# {
		#    "total":32,
		#    "results":[
		#       {
		#          "publisher":"starbuckscoffeecoupon.com",
		#          "first_seen":"2011-06-17",
		#          "monthly_uniques":0,
		#          "times_seen":13,
		#          "last_seen":"2011-09-01"
		#       },
		#       {
		#          "publisher":"fruitoftheloomcoupons.com",
		#          "first_seen":"2011-06-17",
		#          "monthly_uniques":0,
		#          "times_seen":11,
		#          "last_seen":"2011-08-29"
		#       },
		#       {
		#          "publisher":"allbabydiapercoupons.com",
		#          "first_seen":"2011-06-17",
		#          "monthly_uniques":493,
		#          "times_seen":9,
		#          "last_seen":"2011-08-24"
		#       },
		#       {
		#          "publisher":"littlepeoplewealth.com",
		#          "first_seen":"2011-06-17",
		#          "monthly_uniques":2901,
		#          "times_seen":9,
		#          "last_seen":"2011-08-24"
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

			Mixrank.get("/advertisers/#{advertiser}/gdn/displayads/#{id}/publishers", :query => params) 
		end

		# Display Ad > Destinations
		# http://api.mixrank.com/v2/json/{api_key}/advertisers/{advertiser}/gdn/displayads/{hash}/destinations
		# Use this endpoint to request the destinations for a display ad.
		# required parameter(s):
		#   advertiser, id
		# please see http://mixrank.com/api/documentation#displayad_destinations for
		# a description of all optional parameters 
		#  Mixrank.connect("Your API key")
		#  Mixrank::DisplayAd.destinations("coupons.com", "c80695ea166f1a221448c0241335cb5a" [:offset => 0, :page_size => 10])
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

		def destinations(advertiser, id, opts={})
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

			Mixrank.get("/advertisers/#{advertiser}/gdn/displayads/#{id}/destinations", :query => params)			
		end

	end

end