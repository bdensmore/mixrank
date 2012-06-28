module Mixrank
  class MixrankObject  #:nodoc: all        
    def initialize
    end
    
    class << self
      def method_missing(method_id, *args) #:nodoc:
        o = self.new
        o.send(method_id, *args)
      rescue HTTParty::UnsupportedURIScheme
        raise "You must set Mixrank.connect before calling #{self.inspect}##{method_id}"
      end
    end
    
    def connected?
      self.class.base_uri
    end
  end
end