describe DList::Stats do
  it 'returns raw data with failed status if dummy data provided' do
    useless_stats = DList::Stats.new 'HHHHHH'
    expect(useless_stats.update_stats 69, 69)
      .to include({
        'status' => eq('error')
      })
  end
end