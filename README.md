# BikeReg API Rubygem

[![Build Status](https://github.com/scottolsen/bike_reg/workflows/Specs/badge.svg)](https://github.com/scottolsen/bike_reg/actions)

Simple gem to hit the [BikeReg
API](https://www.bikereg.com/api/EventSearchDoc.aspx) to search for events.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'bike_reg'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install bike_reg

## Usage

```ruby
client = BikeReg::Client.new
```

### Events

```ruby
events = client.event.search(states: 'IA', eventtype: 'cyclocross')
#=> BikeReg::Collection

events.total
#=> 61

events.data
#=> [#<BikeReg::Event>, #<BikeReg::Event>]

events.data[0].event_name
#=> 'The Grand'
```

### Registrations

You need both the event id and category id.

```ruby
registrations = client.registrations.all(event_id: 123, category_id: 456)
#=> BikeReg::Collection

registrations.total
#=> 43

registrations.data
#=> [#<BikeReg::Registration>, #<BikeReg::Registration>]

registrations.data[0].name
#=> 'Lance Armstrong'
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/scottolsen/bike_reg.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
