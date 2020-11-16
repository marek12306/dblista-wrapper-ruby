# frozen_string_literal: true

describe DList::List::Server do
  it 'fetches top servers' do
    expect(DList::List::Server.top)
      .to include({
                    'status' => eq('success')
                  })
  end

  it 'fetches premium servers' do
    expect(DList::List::Server.premium)
      .to include({
                    'status' => eq('success')
                  })
  end

  it 'searches for servers' do
    expect(DList::List::Server.search('server'))
      .to include({
                    'status' => eq('success')
                  })
  end

  it 'fails if page is not an integer' do
    expect { DList::List::Server.top 'asdf' }
      .to raise_error(DList::Errors::PAGE_INTEGER)
  end

  it 'fails if query is not provided' do
    expect { DList::List::Server.search nil }
      .to raise_error(DList::Errors::QUERY_NOT_PROVIDED)
  end
end
