require_relative './../spec_helper.rb'

describe InterpretService do
  describe '#call' do
    context 'Invalid command' do
      it "return don't find message" do
        response = InterpretService.call('', {})
        expect(response).to match("Não compreendi o seu desejo")
      end
    end
  end
end