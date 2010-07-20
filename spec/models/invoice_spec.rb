require File.dirname(__FILE__) + '/../spec_helper'

describe Invoice do

  it { should have_many(:items) }
  it { should validate_presence_of(:ccy) }
  it { should validate_presence_of(:vat) }

  describe 'a new invoice' do
    before { @invoice = Invoice.new_or_from(nil) }

    it 'should have default_fee value' do
      @invoice.default_fee.should == 42
    end

    it 'should not have items' do
      @invoice.items.should == []
    end
  end

  describe 'an invoice' do
    before { @invoice = Factory(:invoice) }
    
    it 'should have common attributes' do
      @invoice.common_attributes.keys.sort.should == 
        %w(ccy client_info nr price provider_info title vat)
    end
  end

  describe 'a new invoice from older invoice with new items' do
    before do
      @old_invoice = Factory(:invoice)
      @comments = [Factory(:comment), Factory(:comment)]
      @invoice = Invoice.new_or_from(@old_invoice.id, :items => @comments)
    end

    it 'should copy common attributes' do
      @invoice.common_attributes == @old_invoice.common_attributes
    end

    it 'should have items' do
      @invoice.items.size.should == 2
    end
  end
end