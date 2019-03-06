require 'rest-client'
require 'json'

module LanguageModule
  class TranslateService
    def initialize(params)
      @word = params["word"]
      @target = params["target"]
    end 

    def call
      begin
        yandex_api_url = "https://translate.yandex.net/api/v1.5/tr.json/translate"
        yandex_api_key = ENV['YANDEX_KEY']

        url = "#{yandex_api_url}?key=#{yandex_api_key}&text=#{@word}&lang=#{@target}"
        res = RestClient.get url
        JSON.parse(res.body)['text'][0]
      rescue RestClient::ExceptionWithResponse => e
        e.response
      end
    end
  end
end