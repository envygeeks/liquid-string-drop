<p align=center>
  <a href=https://goo.gl/BhrgjW>
    <img src=https://envygeeks.io/badges/paypal-large_1.png alt=Donate>
  </a>
  <br>
  <a href=https://travis-ci.org/envygeeks/liquid-string-drop>
    <img src="https://travis-ci.org/envygeeks/liquid-string-drop.svg?branch=master">
  </a>
</div>

# Liquid String Drop

Provides a drop that is both a string and a drop so that you can embed them in hashes, replace pieces of of build systems with drops and optimize your code for speed/efficiency.

## Usage

```ruby
require "liquid/drop/str"
class MyDrop < Liquid::Drop::Str
  attr_reader :other

  def initialize(val, other:)
    @other = other
    super(val)
  end
end

a = {
  MyDrop.new("hello", other: "world") => "Yup."
}

# pry(main) > a["hello"] # => "Yup."
# pry(main) > a.keys.fetch(0).other
#   => "world"
```

## Usefulness

This Gem is particularly useful for replacing parts of Jekyll's core with drops of your own.  Here I use it to replace Jekyll's tags with my own tag generator and a set of drops.  This makes it so that anybody who uses `Jekyll::Site#tags` can continue to use string keys (as expected) but internally when I use it in Liquid, I have all the data that I embedded.
