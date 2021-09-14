# frozen_string_literal: true

module BikeReg
  class Collection
    attr_reader :data, :total, :next_page, :prev_page

    def self.from_response(response, key:, type:, start_page:)
      body = response.body
      new(
        data: body[key].map { |attrs| type.new(attrs) },
        total: body['ResultCount'],
        start_page: start_page
      )
    end

    def initialize(data:, total:, start_page:)
      @data = data
      @total = total
      @next_page = start_page.nil? ? 1 : start_page + 1
      @prev_page = start_page.nil? ? 0 : start_page - 1
    end
  end
end
