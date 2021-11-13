# frozen_string_literal: true

module BikeReg
  class RegistrationResource < Resource
    def all(**params)
      reg_url = "https://www.bikereg.com/Registration/ConfirmedSingleRace.aspx?eid=&team=&RaceRecID=#{params[:category_id]}&EventID=#{params[:event_id]}"

      response = Scraper.parse!(:parse, url: reg_url)

      Collection.from_response(response, key: 'riders', type: Registration, start_page: params[:startpage])
    end
  end
end
