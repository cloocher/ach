require 'example_helper'

describe ACH::Records::FileHeader do
  before(:each) do
    @record = ACH::Records::FileHeader.new
  end

  it "should allow 9 or 10 digits for #immediate_origin" do
    lambda { @record.immediate_origin = "123" }.should raise_error(RuntimeError)
    lambda { @record.immediate_origin = "abcdefghi" }.should raise_error(RuntimeError)
    lambda { @record.immediate_origin = "123456789" }.should_not raise_error(RuntimeError)
    lambda { @record.immediate_origin = "1234567890" }.should_not raise_error(RuntimeError)
  end

end
