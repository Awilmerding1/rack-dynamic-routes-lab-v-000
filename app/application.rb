class Application

 def call(env)
  resp = Rack::Response.new
  req = Rack::Request.new(env)

  if req.path.match(/items/)
    item_name = req.path.split("/items/").last
    item = Item.find{|i| i.name == item_name}
    if item
      resp.write item_name.price
    else
      resp.write "Route not found"
      resp.status = 404
    end
  else
    resp.status = 400
  end
  resp.finish
end
end
