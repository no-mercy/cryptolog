class LogFetcher
  attr_reader :service_name

  def initialize(service_name)
    @service_name = service_name
  end

  def fetch
    `#{system_command}`
  end

  private

  def system_command
    "journalctl -ru #{service_name}.service -n #{Settings.log_lines}"
  end
end

