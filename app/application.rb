class Application


    def call(env)
        @@item = Item.all

        resp = Rack::Response.new
        req = Rack::Request.new(env)

        if req.path.match(/items/)
            item_name = req.path.split("/items/").last
            item = @@item.find{|i| i.name == item_name}
            if item
                resp.write item.price
            else  
                resp.status = 400
                resp.write "Item not found"
            end
        else 
            resp.write "Route not found"
            resp.status = 404
        end
        resp.finish
    end

end