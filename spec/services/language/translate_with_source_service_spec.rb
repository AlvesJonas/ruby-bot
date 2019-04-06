require_relative './../../spec_helper.rb'

describe LanguageModule::TranslateWithSourceService do
  describe '#call' do
    it "translate one word from english" do
      @translate_service = subject.new({ word: "cachorro", source: "pt",target: "en" })

      response = @translate_service.call()
      expect(response).to match("dog")
    end 
  end
end