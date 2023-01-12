# frozen_string_literal: true

require './lib/log_parser/exceptions/file_extention'

module LogParser
  module Validations
    class FileExtention
      def initialize(file_name)
        @file_name = file_name
      end

      def validate_extention
        file_extention_validation
      end

      private

      attr_reader :file_name

      def file_extention_validation
        return if File.extname(file_name) == '.log'

        raise Exceptions::FileExtentionException, "File format is #{File.extname(file_name)}! Must be .log!"
      end
    end
  end
end
