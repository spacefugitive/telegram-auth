require 'spec_helper'

module Telegram
  describe Fields do
    FIELDS = [:auth_date, :id, :username, :first_name, :last_name, :username, :photo_url]
    
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