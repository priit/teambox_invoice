require File.dirname(__FILE__) + '/../spec_helper'

describe InvoiceItem do

  it { should belong_to(:invoice) }
  it { should validate_presence_of(:fee) }
  it { should validate_presence_of(:hours) }
end
