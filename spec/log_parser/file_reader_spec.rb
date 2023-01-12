# frozen_string_literal: true

require 'spec_helper'
require './lib/log_parser/file_reader'

RSpec.describe LogParser::FileReader do
  subject { described_class.new('./spec/fixtures/testing.log').read }

  it 'reads a log file' do
    expect(subject).to include(LogRecord.new('/first', '111.111.11.11'))
  end
end
