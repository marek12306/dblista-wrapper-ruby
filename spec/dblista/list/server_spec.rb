# frozen_string_literal: true

describe DBLista::List::Server do
  it 'fetches top servers' do
    expect(DBLista::List::Server.top)
      .to include({
                    'status' => eq('success')
                  })
  end

  it 'fetches premium servers' do
    expect(DBLista::List::Server.premium)
      .to include({
                    'status' => eq('success')
                  })
  end

  it 'searches for servers' do
    expect(DBLista::List::Server.search('server'))
      .to include({
                    'status' => eq('success')
                  })
  end

  it 'fails if page is not an integer' do
    expect { DBLista::List::Server.top 'asdf' }
      .to raise_error(DBLista::Errors::PAGE_INTEGER)
  end

  it 'fails if query is not provided' do
    expect { DBLista::List::Server.search nil }
      .to raise_error(DBLista::Errors::QUERY_NOT_PROVIDED)
  end
end
