# frozen_string_literal: true

require_relative 'lib/log_parser/runner'

class Main
  extend LogParser

  def call
    LogParser::Runner.new(ARGV[0]).call
  end
end

Main.new.call
