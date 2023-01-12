# frozen_string_literal: true

require 'spec_helper'
require './lib/log_parser/validator'

RSpec.describe LogParser::Validations::FileExtention do
  subject { described_class.new('./spec/fixtures/testing.txt').validate_extention }

  it 'raises DataFormatException when url format is wrong' do
    expect do
      subject
    end.to raise_error(LogParser::Exceptions::FileExtentionException, 'File format is .txt! Must be .log!')
  end
end
