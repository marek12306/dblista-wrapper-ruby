# frozen_string_literal: true

require 'dblista'
require 'dblista_spec'

describe DBLista::Information do
  before :all do
    top = DBLista::List::Bot.top
    @bot = top['data'][0]['id']
    top = DBLista::List::Server.top
    @server = top['data'][0]['id']

    @user = 680_907_935_345_541_219
  end

  it 'successfuly returns bot data' do
    expect(DBLista::Information.bot(@bot))
      .to include({
                    'status' => eq('success')
                  })
  end

  it 'successfuly returns server data' do
    expect(DBLista::Information.server(@server))
      .to include({
                    'status' => eq('success')
                  })
  end

  it 'successfuly returns user data' do
    expect(DBLista::Information.user(@user))
      .to include({
                    'status' => eq('success')
                  })
  end
end
