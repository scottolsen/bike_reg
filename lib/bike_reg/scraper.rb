# frozen_string_literal: true

require 'kimurai'
class Scraper < Kimurai::Base
  @name = 'github_spider'
  @engine = :mechanize
  @start_urls = ["https://example.com/"]

  def parse(response, url: '', data: {})
    riders = []
    trs = response.css('tr.event-participant')
    trs.each do |tr|
      state = tr.css('.state').text
      last_name = tr.css('.lastname').text
      name = "#{tr.css('#tdFirstName').text} #{last_name}"
      team = tr.css('.team div').text.gsub("\r", '').gsub("\n", '').strip
      riders << { name: name, team: team, state: state }
    end

    OpenStruct
      .new(
        body: {
          riders: riders,
          ResultCount: riders.count
        }.with_indifferent_access
      )
  end
end
