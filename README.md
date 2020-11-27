# formi9_compliance

A Ruby API wrapper for [formi9.com](https://www.formi9.com/FormI9Api/swagger/ui/index) [![Build Status](https://secure.travis-ci.org/helloworld1812/formi9_compliance.svg)](http://travis-ci.org/helloworld1812/formi9_compliance)


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'formi9_compliance'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install formi9_compliance

## Usage

## Create a company

Formi9Compliance.create_company_with_mou


## Create section 1 for employee

Formi9Compliance.create_section1

the response contains

- resultId
- auto login link for employee to fill the form section 1


## Create section 2 for HR

Formi9Compliance.create_section2


### Retrieve the status of form

Formi9Compliance.get(result_id, auto_login_url: true)


### Doweload the PDF of formi9

Formi9Compliance.download_pdf(result_id, {
  print_signature: true,
  print_notes: true,
  print_everify: true,
  print_docs: true,
  print_audit_trail: true 
})




get the auto 



## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/helloworld1812/formi9_compliance. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/helloworld1812/formi9_compliance/blob/master/CODE_OF_CONDUCT.md).

## Reference

1. formi9.com [API documentation](https://www.formi9.com/FormI9Api/swagger/ui/index)


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Formi9Compliance project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/helloworld1812/formi9_compliance/blob/master/CODE_OF_CONDUCT.md).
