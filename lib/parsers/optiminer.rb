module Parsers
  class Optiminer
    attr_reader :log_data

    def initialize(log_data)
      @log_data = log_data
    end

    def result
      return {} unless parsed_line.any?
      {
        host: host,
        date: date,
        five_sec_stat: five_sec_stat,
        one_min_stat: one_min_stat,
        one_hour_stat: one_hour_stat,
        total: one_min_stat
      }
    end

    private

    def five_sec_stat
      parsed_line[12]
    end

    def one_min_stat
      parsed_line[17]
    end

    def one_hour_stat
      parsed_line[22]
    end

    def host
      parsed_line[3]
    end

    def date
      "#{parsed_line[5]} #{parsed_line[6]}".match(/\[(.+)\]/)[1]
    end

    def parsed_line
      @parsed_line ||= last_total_line.split(/\s/)
    end

    def last_total_line
      log_lines.select { |line| line =~ /Total/ }.first
    end

    def log_lines
      log_data.split("\n")
    end
  end
end
