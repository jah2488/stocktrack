require 'http'
module IEX
  def Stock(symbol)
    HTTP.get("")
  end
  IEX::Stock(:AAPL).tops

  class Client
    TEST_ENDPOINT = "https://sandbox.iexapis.com/v1/"
    PROD_ENDPOINT = "https://cloud.iexapis.com/v1/"

    def initialize(token)
      @token = token 
    end

    def get(resource)
      HTTP.get(endpoint + resource + token)
    end

    private

    def endpoint
      Rails.env.development? ?
        TEST_ENDPOINT :
        PROD_ENDPOINT
    end

    def token
      "?token=#{@token}"
    end
  end
end