#!/usr/bin/ruby
# encoding: utf-8

require 'pp'

INDEX_HTML = <<"HTML"
<html>
  <body>
    <form method="POST">
      押す？
      <input type="submit" value="post" />
    </form>
  </body>
</html>
HTML

RESULT_HTML = <<"HTML"
<html>
  <body>
    <form method="GET">
      日本語化けらった？
      <input type="submit" value="return" />
    </form>
  </body>
</html>
HTML
        
class RackPractice
  def call(env)
    pp env
    case env['REQUEST_METHOD']
    when 'GET'
      [
        200,
        {"Content-Type" => "text/html", "charset" => "UTF-8"},
        [INDEX_HTML]
      ]
    when 'POST'
      [
        200,
        {"Content-Type" => "text/html", "charset" => "UTF-8"},
        [RESULT_HTML]
      ]
    end  
  end
end
