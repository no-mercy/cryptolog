class Cryptolog < Roda
  plugin :json

  route do |r|
    r.root do
      ResponseBuilder.new.build
    end

    r.get do
      ResponseBuilder.new(name_from_path).build.fetch(name_from_path)
    end
  end

  private

  def name_from_path
    request.path.match(/^\/(\w+)\b/)[1]
  end
end
