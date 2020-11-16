# frozen_string_literal: true

describe DList::User::Client do
  it 'raises if token is not provided' do
    expect { DList::User::Client.new nil }
      .to raise_error(DList::Errors::TOKEN_NOT_PROVIDED)
  end

  it 'returns raw data with failed status if dummy data provided' do
    useless_client = DList::User::Client.new 'HHHHHH'
    expect(useless_client.vote(69))
      .to include({
        'status' => eq('error')
      })
  end
end
