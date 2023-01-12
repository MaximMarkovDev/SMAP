# Counters::VisitsCounter class
# frozen_string_literal: true

module LogParser
  module Counters
    class VisitsCounter
      def initialize(data)
        @data = data
      end

      def call
        visits_counter
      end

      private

      attr_reader :data

      def visits_counter
        visits = []

        data.map(&:url).group_by { |url| url }.map { |k, v| visits.append({ k => v.length }) }

        visits
      end
    end
  end
end
