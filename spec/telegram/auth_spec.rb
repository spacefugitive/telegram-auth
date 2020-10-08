require 'spec_helper'

module Telegram
  describe Auth do
    describe '.configure' do
      it 'accepts config' do
        described_class.configure do |config|
          config.token = "foo"
        end
        expect(described_class.configuration).to be_a(Configuration)
      end

      it 'accepts token' do
        token = 'foo'
        described_class.configure do |config|
          config.token = token
        end
        expect(described_class.configuration.token).to eql(token)
      end
    end

    describe '.configure!' do
      it 'throws on confiration error' do
        expect{
          described_class.configure!{ |config| config.token = nil }
        }.to raise_error(ConfigurationError)
      end
    end
    
    describe '.configuration' do
      let(:token) { 'foo' }
      
      it 'returns configuration' do
        described_class.configure!{ |config| config.token = token }
        expect(described_class.configuration).to be_a(Telegram::Configuration)
        expect(described_class.configuration.token).to eq(token)
      end
    end
  end
end