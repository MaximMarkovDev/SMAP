# frozen_string_literal: true

require 'spec_helper'
require './lib/log_parser/presenter'

RSpec.describe LogParser::Presenter do
  subject { described_class.new(data).call }

  let(:data) do
    {
      visits: [{ '/first' => 3 }, { '/second' => 2 }, { '/third' => 1 }],
      uniq_visits: [{ '/first' => 2 }, { '/second' => 2 }]
    }
  end
  let(:expected_result) do
    "/first 3 visits\n/second 2 visits\n/third 1 visits\n/first 2 unique views\n/second 2 unique views\n"
  end

  it 'sorts data in descending order' do
    expect { subject }.to output(expected_result).to_stdout
  end
end
