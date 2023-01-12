# frozen_string_literal: true

require_relative 'validator'
require_relative 'file_reader'
require_relative 'counter'
require_relative 'sorter'
require_relative 'presenter'

module LogParser
  class Runner
    def initialize(file_name)
      @file_name = file_name
    end

    def call
      Validator.new(file_name).validate!
      counted = Counter.new(read_file).call
      sorted = Sorter.new(counted).call
      Presenter.new(sorted).call
    end

    private

    attr_reader :file_name

    def read_file
      FileReader.new(file_name).read
    end
  end
end
