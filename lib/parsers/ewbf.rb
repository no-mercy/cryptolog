module Parsers
  class Ewbf
    attr_reader :log_data

    def initialize(log_data)
      @log_data = log_data
    end

    def result
      return {} unless parsed_line.any?
      {
        host: host,
        date: date,
        total: total
      }
    end

    private

    def host
      parsed_line[3]
    end

    def date
      "#{parsed_line[0]} #{parsed_line[1]} #{parsed_line[2]}"
    end

    def total
      parsed_line[7]
    end

    def parsed_line
      @parsed_line ||= last_total_line.split(/\s/)
    end

    def last_total_line
      log_lines.select { |line| line =~ /Total speed/ }.first
    end

    def log_lines
      log_data.split("\n")
    end
  end
end
