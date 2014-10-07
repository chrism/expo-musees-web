# Orange Expo Musees Website

Built using [Ruby on Rails](http://rubyonrails.org/)

## Prerequisites

You will need the following things properly installed on your computer.

* [Ruby](https://www.ruby-lang.org)

### For Easier Binstubs
* [Homebrew](http://brew.sh/)
* [Direnv](https://github.com/zimbatm/direnv)


## Installation

* `git clone https://github.com/chrism/expo-musees-web` this repository
* change into the new directory
* `bundle install`
* copy `application.yml` (not kept in this repository) into the directory `config`
* `brew install direnv`
* Add it to your [shell](https://github.com/zimbatm/direnv#setup)

## Running / Development

* `foreman start`
* Visit your app at http://0.0.0.0:5000

## Testing

You can either run all tests or watch your tests to run automatically

### Running All Tests

* `rspec`

### Running Tests on Save

* `guard`
