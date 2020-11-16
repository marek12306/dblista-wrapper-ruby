# frozen_string_literal: true

describe DList::List::Bot do
  it 'fetches top bots' do
    expect(DList::List::Bot.top)
      .to include({
                    'status' => eq('success')
                  })
  end

  it 'fetches premium bots' do
    expect(DList::List::Bot.premium)
      .to include({
                    'status' => eq('success')
                  })
  end

  it 'fetches unverified bots' do
    expect(DList::List::Bot.unverified)
      .to include({
                    'status' => eq('success')
                  })
  end

  it 'fetches rejected bots' do
    expect(DList::List::Bot.rejected)
      .to include({
                    'status' => eq('success')
                  })
  end

  it 'searches for bots' do
    expect(DList::List::Bot.search('bot'))
      .to include({
                    'status' => eq('success')
                  })
  end
end
