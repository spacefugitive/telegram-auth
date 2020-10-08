require 'spec_helper'

module Telegram
  describe Auth do
    describe '.configure' do
      it 'accepts config' do
        described_class.configure do |config|
          config.domain = "foo"
        end
        expect(described_class.configuration).to be_a(Configuration)
      end

      it 'accepts domain' do
        domain = 'foo'
        described_class.configure do |config|
          config.domain = domain
        end
        expect(described_class.configuration.domain).to eql(domain)
      end
    end

    describe '.configure!' do
      it 'throws on confiration error' do
        expect{
          described_class.configure!{ |config| config.domain = nil }
        }.to raise_error(ConfigurationError)
      end
    end
    
    describe '.configuration' do
      let(:domain) { 'foo' }
      
      it 'returns configuration' do
        described_class.configure!{ |config| config.domain = domain }
        expect(described_class.configuration).to be_a(Telegram::Configuration)
        expect(described_class.configuration.domain).to eq(domain)
      end
    end
  end
end