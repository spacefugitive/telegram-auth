# typed: false
require 'spec_helper'

module Telegram::Auth
  describe '.configure' do
    it 'accepts config' do
      Telegram::Auth.configure do |config|
        config.token = "foo"
      end
      expect(Configuration.instance).to be_a(Configuration)
    end

    it 'accepts token' do
      token = 'foo'
      Telegram::Auth.configure do |config|
        config.token = token
      end
      expect(Configuration.instance.token).to eql(token)
    end
  end

  describe '.configure!' do
    it 'throws on configuration error' do
      expect{
        Telegram::Auth.configure!{ |config| config.token = nil }
      }.to raise_error(ConfigurationError)
    end
  end

  describe '.create' do
    let(:token) { 'foo' }
    let!(:configuration){ Telegram::Auth.configure!{ |config| config.token = token } }
    let(:auth_data) do
      { hash: "foo", id: "id", auth_date: 120384308, username: "foo", first_name: "bar", last_name: "baz"}
    end 

    it 'returns true if verified' do  # spec is implementation bound.
      allow_any_instance_of(Verification).to receive(:process){ true }
      expect(Telegram::Auth.create(**auth_data)).to eq(true)
    end

    it 'returns false when verification fails' do
      allow_any_instance_of(Verification).to receive(:process){ false }
      expect(Telegram::Auth.create(**auth_data)).to eq(false)
    end

    it 'yields on auth failure' do
      error = ShaError.new('Nice try!')
      verification = double(error: error, process: false)
      allow(Verification).to receive(:new).and_return(verification)
      expect{|blk| Telegram::Auth.create(**auth_data, &blk) }.to yield_with_args(ShaError)
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