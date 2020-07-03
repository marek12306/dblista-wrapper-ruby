# frozen_string_literal: true

describe DBLista::User::Client do
  it 'raises if token is not provided' do
    expect { DBLista::User::Client.new nil }
      .to raise_error(DBLista::Errors::TOKEN_NOT_PROVIDED)
  end

  it 'returns raw data with failed status if dummy data provided' do
    useless_client = DBLista::User::Client.new 'HHHHHH'
    expect(useless_client.vote(69))
      .to include({
        'status' => eq('error')
      })
  end
end
