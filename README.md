# SimpleScope

Allows you to define magic `scope`s on an ActiveRecord model without having to provide `where` conditions. The conditions are derived from the name of the `scope`. Multiple conditions can be defined via the name by separating them with `and` much like the magic `find_by_attribute1_and_attribute2` methods.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'simple_scope'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install simple_scope

## Usage

Simply define a scope:

```ruby
class Color < ActiveRecord::Base
  scope :color_red
end
```

Now, calling `Color.color_red` will build the query: `where 'color' => 'red'`. Multiple conditions can be separated by `_and_`:

```ruby
class Color < ActiveRecord::Base
  scope :color_red_and_status_enabled
end
```

Calling `Color.color_red_and_status_enabled` will build the query: `where 'color' => 'red', 'status' => 'enabled'`.

## Contributing

1. Fork it ( https://github.com/DiegoSalazar/simple_scope/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
