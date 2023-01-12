# frozen_string_literal: true

require 'spec_helper'
require './lib/log_parser/counter'
require './lib/log_parser/log_record'

RSpec.describe LogParser::Counter do
  subject { described_class.new(logs).call }

  let(:logs) do
    [LogRecord.new('/first', '111.111.11.11'),
     LogRecord.new('/second', '111.111.11.11'),
     LogRecord.new('/third', '222.222.22.22'),
     LogRecord.new('/first', '222.222.22.22'),
     LogRecord.new('/second', '222.222.22.22'),
     LogRecord.new('/first', '222.222.22.22')]
  end

  it 'counts visits and unique views' do
    expect(subject).to eq({
                            visits: [{ '/first' => 3 }, { '/second' => 2 }, { '/third' => 1 }],
                            uniq_visits: [{ '/first' => 2 }, { '/second' => 2 }, { '/third' => 1 }]
                          })
  end
end
