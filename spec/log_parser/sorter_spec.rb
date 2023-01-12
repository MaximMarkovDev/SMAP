# frozen_string_literal: true

require 'spec_helper'
require './lib/log_parser/sorter'

RSpec.describe LogParser::Sorter do
  subject { described_class.new(data).call }

  let(:data) { { some_hash: [{ '1st' => 10 }, { '2nd' => 15 }, { '3rd' => 1 }, { '4th' => 100 }] } }

  it 'sorts data in descending order' do
    expect(subject).to eq({ some_hash: [{ '4th' => 100 }, { '2nd' => 15 }, { '1st' => 10 }, { '3rd' => 1 }] })
  end
end
