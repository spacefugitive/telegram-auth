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

    describe '.create' do
      let(:token) { 'foo' }
      let!(:configuration){ described_class.configure!{ |config| config.token = token } }

      it 'returns true if verified' do  # spec is implementation bound.
        allow_any_instance_of(Verification).to receive(:process){ true }
        expect(described_class.create("hash", {})).to eq(true)
      end

      it 'returns false when verification fails' do
        allow_any_instance_of(Verification).to receive(:process){ false }
        expect(described_class.create("hash", {})).to eq(false)
      end

      it 'logs auth failures' do
        expect(Telegram::Auth.logger).to receive(:debug).with("Authentication failed. Invalid hash")
        described_class.create("blah", {username: "foo"}) do |error|
          described_class.logger.debug(error.message)
        end
      end
    end

    describe '.logger' do
      let(:logger){ Logger.new(STDOUT) }

      it 'allows setting a logger' do
        expect{
          Telegram::Auth.logger = logger
        }.to change{ Telegram::Auth.logger }.to(logger)
      end
    end
  end
end