require File.expand_path(File.dirname(__FILE__) + '../../spec_helper')

describe "Ruby4Live::LiveConnection" do 

  before :all do 
    @conn = Ruby4Live::LiveConnection.new('localhost', 7402, 7403)
  end

  it "Live Connection should be an instance of Ruby4Live::LiveConnection" do 
    expect(@conn).to be_an_instance_of Ruby4Live::LiveConnection
  end

  it "Live set should return Ableton project detail" do
    binding.pry
    expect(Ruby4Live::LiveSet.new(@conn)).to return_hash
  end
end 