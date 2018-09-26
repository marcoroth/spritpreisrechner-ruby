# Spritpreisrechner

This is a Ruby Wrapper for the [e-Control.at Spritpreisrechner HTTP API](https://www.spritpreisrechner.at). Have a look at the [Swagger docs](https://api.e-control.at/sprit/1.0/doc/index.html?url=https://api.e-control.at/sprit/1.0/api-docs%3Fgroup%3Dpublic-apiT) for detailed info about the API. 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'spritpreisrechner'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install spritpreisrechner

## Usage

Getting stations by LAT/LNG coordinates. The available Fuel Types are: `DIE` , `SUP` and `GAS`. The `closed` parameter is optional. 

```ruby
response = Spritpreisrechner::Station.by_address(lat: 48.208, lng: 16.373, fuel_type: 'DIE', closed: 'true')
# => #<Spritpreisrechner::Response @stations=[#<Spritpreisrechner::Station @id=692206, @name="SPRIT-INN" ...>, #<Spritpreisrechner::Station @id=5093, @name="Turmöl" ...>, ... ] ... >

```

Getting stations by region:

```ruby
response = Spritpreisrechner::Station.by_region(code: 1, region_type: "BL", fuel_type: 'DIE', closed: 'true')
# => #<Spritpreisrechner::Response @stations=[#<Spritpreisrechner::Station @id=394, @name="Avanti" ...>, #<Spritpreisrechner::Station @id=7586, @name="Landestankstelle Rdf. Partner Luisser" ...>, ... ] ... >

```


Getting all available regions:

```ruby
regions = Spritpreisrechner::Region.all
# => [#<Sprtpreisrechner::Region @code=1, @type="BL", @name="Burgenland" ...>, #<Spritpreisrechner::Region @code=2, @type="BL", @name="Kärnten" ...> ...]
```

Getting a specific region:

```ruby
region = Spritpreisrechner::Region.find(1)
# => #<Sprtpreisrechner::Region @code=1, @type="BL", @name="Burgenland" ...>
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/marcoroth/spritpreisrechner.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
