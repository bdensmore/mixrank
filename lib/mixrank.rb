module Mixrank

	include HTTParty
	MIXRANK_URL = "http://api.mixrank.com/v1/json/"

	def self.connect(api_key)
		self.base_uri "#{MIXRANK_URL}/#{api_key}"
	end

end

require 'mixrank/version'
require 'httparty'
require 'mixrank/mixrank_object'
require 'mixrank/echo'
require 'mixrank/publisher'
require 'mixrank/advertiser'
require 'mixrank/keyword'