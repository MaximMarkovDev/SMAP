# frozen_string_literal: true

require 'csv'
require_relative 'log_record'

module LogParser
  class FileReader
    def initialize(file_name)
      @file_name = file_name
    end

    def read
      read_file
    end

    private

    attr_reader :file_name

    def read_file
      return [] if file_name.nil?

      logs = []
      IO.foreach(file_name) do |log|
        logs.append(LogRecord.new(log.split[0], log.split[1]))
      end
      logs
    end
  end
end
