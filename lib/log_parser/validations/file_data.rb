# frozen_string_literal: true

require './lib/log_parser/exceptions/data_format'

module LogParser
  module Validations
    class FileData
      def initialize(file_name)
        @file_name = file_name
      end

      def validate_data
        file_data_validation
      end

      private

      attr_reader :file_name

      def file_data_validation
        IO.foreach(file_name) do |data|
          url_valid?(data.split[0])
          ip_valid?(data.split[1])
          raise Exceptions::DataFormatException, 'Wrong amount of parameters in line!' unless data.split.length == 2
        end
      end

      def url_valid?(url)
        return unless (url =~ %r{^/[a-z0-9_]+(/[a-z0-9]+)*$}).nil?

        raise Exceptions::DataFormatException, 'Wrong url path format!'
      end

      def ip_valid?(ip)
        return unless (ip =~ /^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$/).nil?

        raise Exceptions::DataFormatException, 'Wrong ip address format!'
      end
    end
  end
end
