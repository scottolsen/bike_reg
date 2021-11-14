# frozen_string_literal: true

module BikeReg
  class Event < Object
    # "/Date(1637384400000-0500)/"
    def event_starts_at
      ConvertDate
        .new(event_date)
        .utc_date
        .to_s
    end

    def event_ends_at
      ConvertDate
        .new(event_end_date)
        .utc_date
        .to_s
    end
  end

  class ConvertDate
    def initialize(date)
      @date = date
    end

    def utc_date
      Time.at(epoch).getutc.to_date
    end

    private

    def epoch
      @date.split('(')[1].split('-')[0].to_i / 1000
    end
  end
end
