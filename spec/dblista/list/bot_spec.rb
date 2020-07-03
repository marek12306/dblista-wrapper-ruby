# frozen_string_literal: true

describe DBLista::List::Bot do
  it 'fetches top bots' do
    expect(DBLista::List::Bot.top)
      .to include({
                    'status' => eq('success')
                  })
  end

  it 'fetches premium bots' do
    expect(DBLista::List::Bot.premium)
      .to include({
                    'status' => eq('success')
                  })
  end

  it 'fetches unverified bots' do
    expect(DBLista::List::Bot.unverified)
      .to include({
                    'status' => eq('success')
                  })
  end

  it 'fetches rejected bots' do
    expect(DBLista::List::Bot.rejected)
      .to include({
                    'status' => eq('success')
                  })
  end

  it 'searches for bots' do
    expect(DBLista::List::Bot.search('bot'))
      .to include({
                    'status' => eq('success')
                  })
  end
end
