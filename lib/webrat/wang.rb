require 'wang'

module Webrat
  WangResponse = Struct.new(:body, :session)
  class WangSession < Session
    def get(url, data, h = {})
      data = data.map {|k,v| "#{WANG::Utils.escape(k)}=#{WANG::Utils.escape(v)}"}.join("&") if data.is_a?(Hash)
      if data
        url += url.include?('?') ? "&#{data}" : "?#{data}"
      end
      # wang doesn't allow passing custom headers, only passing referers
      @response_status, @response_headers, @response_body = wang.get(url, h['HTTP_REFERER'])
    end

	def response
		WangResponse.new(response_body, self)
	end

    def post(url, data, h = {})
      @response_status, @response_headers, @response_body = wang.post(url, data, h['HTTP_REFERER'])
    end

    def response_body
      @response_body
    end

    def response_code
      @response_status
    end
      
	def wang 
	  @wang ||= WANG.new
	end
  end
end
