require 'helper_spec'
require 'pry'


describe "js redirect to decode" do 


  it "Decode url" do 
    url = "http://www.amazon.co.uk/dp/B00ZTYEP7G?t=smzdm-21&m=A3P5ROKL5A1OLE&tag=smzdm-21"
    
    expect(
      JsCompile::Decode.run("http://www.smzdm.com/URL/AA/HT/221F0C4DCEDBAC91")
    ).to eq(url)
  end
end