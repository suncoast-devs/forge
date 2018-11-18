host = Rails.env.production? ? "forge.suncoast.io" : "localhost:3000"
Rails.application.routes.default_url_options[:host] = host
