# Mixrank Gem

This gem gives you access to the Mixrank API and all of its  associated methods. At this time, Mixrank is in a closed beta and 
the API could potentially change.

Please see http://mixrank.com/api/documentation for more information.

## Installation

Add this line to your application's Gemfile:

    gem 'mixrank'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mixrank

## Usage

 You must first connect to the Mixrank API with your API key.

 	Mixrank.connect("Your API Key")

 You can now call any of the Mixrank methods. All responses are returned in JSON format.


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
