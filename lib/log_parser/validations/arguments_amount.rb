# frozen_string_literal: true

module LogParser
  module Validations
    class ArgumentsAmount
      def initialize; end

      def validate_arguments
        arguments_amount_validation
      end

      private

      def arguments_amount_validation
        raise StandardError, 'Required only one argument' if ARGV.length != 1
      end
    end
  end
end
