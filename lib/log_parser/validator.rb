# frozen_string_literal: true

require './lib/log_parser/validations/file_data'
require './lib/log_parser/validations/file_extention'
require './lib/log_parser/validations/arguments_amount'

module LogParser
  extend Validations
  class Validator
    def initialize(file_name)
      @file_name = file_name
    end

    def validate!
      arguments_amount.new.validate_arguments
      file_name_extention.new(file_name).validate_extention
      file_name_data.new(file_name).validate_data
    end

    private

    attr_reader :file_name

    def arguments_amount
      Validations::ArgumentsAmount
    end

    def file_name_extention
      Validations::FileExtention
    end

    def file_name_data
      Validations::FileData
    end
  end
end
