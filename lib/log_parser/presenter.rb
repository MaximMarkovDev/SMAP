# frozen_string_literal: true

module LogParser
  class Presenter
    def initialize(processed_data)
      @processed_data = processed_data
    end

    def call
      print_visits
      print_unique_views
    end

    private

    attr_reader :processed_data

    def print_visits
      result = []
      processed_data[:visits].each do |element|
        result.append "#{element.keys[0]} #{element.values[0]} visits"
      end
      puts result
    end

    def print_unique_views
      result = []
      processed_data[:uniq_visits].each do |element|
        result.append "#{element.keys[0]} #{element.values[0]} unique views"
      end
      puts result
    end
  end
end
