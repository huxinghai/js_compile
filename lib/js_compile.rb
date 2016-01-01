require 'open-uri'
require 'execjs'

module JsCompile 
  VERSION = "0.0.1"

  class Decode
    attr_accessor :url, :body, :script

    def initialize(url)
      @url = url
    end

    def generate
      request
      dispose_eval
    end

    def request
      @body = open(url, headers).read 
    end

    def self.run(url)
      new(url).generate
    end

    private
    def dispose_eval
      @script = gen_eval_plus @body.match(/eval.*\)$/).to_s
      code = ExecJS.compile(@script).call("bridging")
      code.match(/smzdmhref='(.*?)'/)[1] || ""
    end

    def gen_eval_plus(script)
      "bridging=null;eval_plus=function(code){bridging=function(){ return code } };#{script.gsub('eval', 'eval_plus')}"
    end

    def headers 
      {'User-Agent' => 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/536.5 (KHTML, like Gecko) Chrome/19.0.1084.54 Safari/536.5'}
    end
  end
end
