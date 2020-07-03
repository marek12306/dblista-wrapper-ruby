# frozen_string_literal: true

require 'dblista'
require 'dblista_spec'

describe DBLista do
  it 'have version' do
    expect(DBLista::VERSION).to be_an(String)
  end
end
