require 'spec_helper'

module Telegram
  describe Fields do
    FIELDS = [:auth_date, :id, :username, :first_name, :last_name, :username, :photo_url]

    describe '#auth_expired?' do
      let(:auth_date){ 1000 }
      let(:subject){ Fields.new({auth_date: auth_date}) }

      it 'returns false when configured off' do
        Configuration.instance.auth_expires_in = nil
        expect(subject.expired?(auth_date + 1000)).to eq(false)
      end

      it 'returns true when expired' do
        Configuration.instance.auth_expires_in = 10
        expect(subject.expired?(auth_date + Configuration.instance.auth_expires_in + 1)).to eq(true)
      end
      
      it 'returns false when valid' do
        Configuration.instance.auth_expires_in = 10
        expect(subject.expired?(auth_date + Configuration.instance.auth_expires_in - 1)).to eq(false)
      end
    end
    
    describe '#to_s' do
      FIELDS.each do |field|
        let(:value) { 'foo' } 
        it "contains #{field}" do
          fields = Fields.new({field => value})
          expect(fields.to_s).to include(value)
        end
      end

      it 'excludes fields not permitted' do
        fields = Fields.new({'illegal' => 'foo'})
        expect(fields.to_s).to be_empty
      end

      it "separates fields with \n" do
        fields = Fields.new({FIELDS[0] => 'foo', FIELDS[1] => 'bar'})
        expect(fields.to_s).to eq("#{FIELDS[0]}=foo\n#{FIELDS[1]}=bar")
      end
    end
  end
end