require 'helper_spec'
require 'pry'


describe "js redirect to decode" do 

  before do 
    @url = "http://www.smzdm.com/URL/AA/HT/221F0C4DCEDBAC91"
    @redirect_to = "http://www.amazon.co.uk/dp/B00ZTYEP7G?t=smzdm-21&m=A3P5ROKL5A1OLE&tag=smzdm-21"
  end

  it "init object" do 
    @obj = JsCompile::Decode.new(@url)
    JsCompile::Decode.should_receive(:new).with(@url).and_return(@obj)
    JsCompile::Decode.run(@url)
  end

  it "get rediret url" do 
    expect(
      JsCompile::Decode.run(@url)
    ).to eq(@redirect_to)
  end

  
end