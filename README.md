# formi9

A Ruby API wrapper for [formi9.com](https://www.formi9.com/FormI9Api/swagger/ui/index) [![Build Status](https://api.travis-ci.com/helloworld1812/formi9.svg?branch=master)](https://travis-ci.com/github/helloworld1812/formi9)


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'formi9'
```

And then execute:

    $ bundle install

You can use an initializer to configure this gem, please put the following code into `config/initializers/formi9_complicance.rb`

```ruby
Formi9.configure do |config|
  config.partner_id = 'Your Partner Id'
  config.username = 'Your username'
  config.password = 'Your password'
  # config.b2b_encryption_key = 'key'
  # config.b2b_encryption_iv = 'iv'
end
```

## Usage

## Create a company

```ruby
Formi9.create_company_with_mou(options)
```


## Create section 1 for employee

```ruby
Formi9.create_section1(options)
```
the response contains

- resultId
- auto login link for employee to fill the form section 1


## Create section 2 for HR

```ruby
Formi9.create_section2
```

### Retrieve the status of form

```ruby
Formi9.case_status(result_id, auto_login_url: true)
```

### Download the PDF of formi9

```ruby
Formi9.download_pdf(result_id, {
  printSignatures: true,
  printNotes: true,
  printEverify: true,
  printDocs: true,
  printAudit_trail: true 
})
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/helloworld1812/formi9. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/helloworld1812/formi9/blob/master/CODE_OF_CONDUCT.md).

## Reference

1. formi9.com [API documentation](https://www.formi9.com/FormI9Api/swagger/ui/index)


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Formi9 project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/helloworld1812/formi9/blob/master/CODE_OF_CONDUCT.md).
