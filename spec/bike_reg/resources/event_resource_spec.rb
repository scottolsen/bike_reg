# frozen_string_literal: true

RSpec.describe BikeReg::EventResource do
  describe 'Event Search' do
    it 'returns an event for The Grand' do
      VCR.use_cassette('the_grand') do
        client = BikeReg::Client.new

        events = client.event.search(states: 'IA', year: 2021, name: 'The Grand')

        expect(events.class).to eq(BikeReg::Collection)
        expect(events.data.first.class).to eq(BikeReg::Event)
        expect(events.total).to eq(1)
        expect(events.data.first.EventName).to eq('The Grand')
      end
    end

    it 'retrievs the next page of results' do
      VCR.use_cassette('next_page') do
        client = BikeReg::Client.new

        events = client.event.search(states: 'IA,MN', year: 2021)
        expect(events.total).to eq(100)
        events = client.event.search(states: 'IA,MN', year: 2021, startpage: events.next_page)
        expect(events.total).to eq(11)
      end
    end
  end
end
