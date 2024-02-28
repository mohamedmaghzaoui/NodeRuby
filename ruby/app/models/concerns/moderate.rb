require 'net/http'
require 'uri'

module Moderate
  extend ActiveSupport::Concern

  included do
    
    before_save :apply_moderation
  end
  #class methods function to get and set columns 
  class_methods do
    def set_columns(columns)
      @my_columns = columns
    end

    def get_columns
      @my_columns || []
    end
  end

  def apply_moderation
    columns_to_moderate = self.class.get_columns  
#added Array to not get error if it is single object
    Array(columns_to_moderate).each do |column|
        #check if current object has changed in db
      if self.changed?
        #get the content value from current object column 
        content = self.send(column)
        #send the content to the api call for moderation
        self.is_accepted = api_call(content)
      end
    end
  end
#api call function for moderation
  def api_call(content)
    #default language
    language="fr-FR"
    #prediction url
    base_url = 'https://moderation.logora.fr/predict'
    text_param = URI.encode_www_form('text' => content, 'language' => language)
    #url with pamas of content and lafnguage
    url = "#{base_url}?#{text_param}"
  #send request and get response
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = (uri.scheme == 'https')
  
    request = Net::HTTP::Get.new(uri)
    request['Accept'] = 'application/json'
  
    response = http.request(request)
  
    if response.code.to_i == 200
      moderation_result = JSON.parse(response.body)
      prediction = moderation_result['prediction']['0'].to_f
  #if predicction <0.5 return true else return false
      return prediction < 0.5 
    else
      # Handle error case
      return false
    end
  end
end
