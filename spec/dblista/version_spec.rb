# frozen_string_literal: true

require 'dblista'
require 'dblista_spec'

describe DList do
  it 'have version' do
    expect(DList::VERSION).to be_an(String)
  end
end
