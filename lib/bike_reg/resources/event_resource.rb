# frozen_string_literal: true

module BikeReg
  class EventResource < Resource
    def search(**params)
      response = get_request('search', params: params)
      Collection.from_response(response, key: 'MatchingEvents', type: Event, start_page: params[:startpage])
    end
  end
end
