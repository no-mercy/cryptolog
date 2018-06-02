class ResponseBuilder
  attr_reader :services

  def initialize(*args)
    @services = args.any? ? args : default_services
  end

  def build
    response = {}
    services.each do |service|
      response[service] = stats(service)
    end
    response
  end

  private

  def stats(service)
    logs = LogFetcher.new(service).fetch
    Object.const_get("Parsers::#{service.capitalize}").new(logs).result
  rescue => e
    { error: e.message }
  end

  def default_services
    Settings.root_url_services || []
  end
end
