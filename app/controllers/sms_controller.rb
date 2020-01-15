class SmsController < ApplicationController
    def index 
      
    end


    def sender
        puts params[:phone]

        require 'net/http'
        require 'uri'
        require 'json'

        uri = URI.parse("https://api.orange.com/smsmessaging/v1/outbound/tel:+224624127136/requests")
        request = Net::HTTP::Post.new(uri)
        request.content_type = "application/json"
        request["Authorization"] = "Bearer 7qFC2v9tPNjYfeprEmNMxqVKCgYR"
        request.body = JSON.dump({
        "outboundSMSMessageRequest" => {
            "address" => "tel:+224"+params[:phone],
            "senderAddress" => "tel:+224624127136",
            "outboundSMSTextMessage" => {
            "message" => "Salut Jules ton api est prete!"
            }
        }
        })

        req_options = {
        use_ssl: uri.scheme == "https",
        }

        response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
        http.request(request)
        end

        puts response.code
        puts response.body


    end

end




