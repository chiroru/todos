require 'webrick'

m = WEBrick::HTTPUtils::DefaultMimeTypes.merge({"js"=>"application/javascript"})

server = WEBrick::HTTPServer.new({
  :DocumentRoot => './public',
  :BindAddress => '127.0.0.1',
  :Port => 3000,
  :MimeTypes => m
})

server.start
