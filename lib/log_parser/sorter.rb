# frozen_string_literal: true

module LogParser
  class Sorter
    attr_reader :data

    def initialize(data)
      @data = data
    end

    def call
      sort_data
    end

    private

    def sort_data
      data.each { |_key, value| value.sort_by!(&:values).reverse! }
    end
  end
end
