require_relative './../../spec_helper.rb'

describe LanguageModule::TranslateService do
  describe '#call' do
    it "translate one word from english" do
      @translate_service = subject.new({ word: "cachorro", target: "en" })

      response = @translate_service.call()
      expect(response).to match("dog")
    end 
  end
end