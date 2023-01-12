# frozen_string_literal: true

require 'spec_helper'
require './lib/log_parser/validator'

RSpec.describe LogParser::Validations::FileData do
  subject { described_class.new(file_path).validate_data }

  context 'there are more than 2 agrs in line' do
    let(:file_path) { './spec/fixtures/wrong_arguments_test.log' }
    it 'raises DataFormatException' do
      expect do
        subject
      end.to raise_error(LogParser::Exceptions::DataFormatException, 'Wrong amount of parameters in line!')
    end
  end

  context 'url format is wrong' do
    let(:file_path) { './spec/fixtures/bad_url_test.log' }
    it 'raises DataFormatException' do
      expect do
        subject
      end.to raise_error(LogParser::Exceptions::DataFormatException, 'Wrong url path format!')
    end
  end

  context 'ip format is wrong' do
    let(:file_path) { './spec/fixtures/bad_ip_test.log' }
    it 'raises DataFormatException' do
      expect do
        subject
      end.to raise_error(LogParser::Exceptions::DataFormatException, 'Wrong ip address format!')
    end
  end
end
