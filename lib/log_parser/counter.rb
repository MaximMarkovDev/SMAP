# frozen_string_literal: true

require './lib/log_parser/counters/visits_counter'
require './lib/log_parser/counters/uniq_visits_counter'

module LogParser
  extend Counters
  class Counter
    def initialize(logs)
      @logs = logs
    end

    def call
      result = {}
      result[:visits] = visits_counter
      result[:uniq_visits] = uniq_visits_counter
      result
    end

    private

    attr_reader :logs

    def visits_counter
      Counters::VisitsCounter.new(logs).call
    end

    def uniq_visits_counter
      Counters::UniqVisitsCounter.new(logs).call
    end
  end
end
