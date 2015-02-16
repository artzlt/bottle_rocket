bottle_rocket
=========

:construction: Work in progress!

Place a countdown on your view! It'll be updated by JavaScript.

Use the framework of your choice. A generator is only available for Rails, though.

## Installation
Add this line to your application's Gemfile:

    gem 'bottle_rocket'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install countdown

### Rails 3.1 or greater (with asset pipeline *enabled*)

Require the javascript file in `app/assets/javascripts/application.js`:

```js
//= require bottle_rocket
```

### Rails 3.0 (or greater with asset pipeline *disabled*)

Run the generator:

```sh
rails generate bottle_rocket:install
```

Running the generator will copy 'bottle_rocket.js' over to the `public\javascripts` directory.
Be sure to add `bottle_rocket.js` to your layout file:

```ruby
<%= javascript_include_tag 'countdown' %>
```

*To make Javascript updates work on other frameworks download the file from 'vendor/assets' manually and place it in the corresponding directory.*

## Usage

```ruby
 <%= countdown from: Time.now + 28.hours %>
```

results in a countdown like this:

<pre>
1d 03 h 59m 59s
</pre>

or to count down from another time than now:

```ruby
 <%= countdown to: Time.now - 2.months, from: Time.parse '2012-09-27 01:07:00' %>
```

The generated html looks like this:

```html
<div class="countdown">
  <span class="unit days">
    <span class="amount-1">1</span>
    <span class="separator">d</span>
  </span>
  <span class="unit hours">
    <span class="amount-0">0</span>
    <span class="amount-3">3</span>
    <span class="separator">h</span>
  </span>
  <span class="unit minutes">
    <span class="amount-5">5</span>
    <span class="amount-9">9</span>
    <span class="separator">m</span>
  </span>
  <span class="unit seconds">
    <span class="amount-5">5</span>
    <span class="amount-9">9</span>
    <span class="separator">s</span>
  </span>
</div>
```

###:units

Select which time units should be displayed. The given order affects the output of the result.

Available keys are:

<pre>:millenniums, :centuries, :decades, :years, :months, :weeks, :days, :hours, :minutes, :seconds, :milliseconds, :microseconds, :nanoseconds</pre>

Default is

```ruby
[:days, :hours, :minutes, :seconds]
```

Example with selected units using default options:

```ruby
 <%= countdown to: Time.now + 2.hours, units: [:minutes, :seconds] %>
```

results in a countdown like this:

<pre>
59m 59s
</pre>

### Options

When you want to modify a unit using options supply the unit as a Hash. Additional units supplied as symbols are not affected.

####:separators

Define how different time units are separated from each other.

Defaults to:

<pre>
millenniums:  'MN'
centuries:    'C'
decades:      'D'
years:        'Y'
months:       'M'
weeks:        'w'
days:         'd'
hours:        'h'
minutes:      'm'
seconds:      's'
milliseconds: 'ms'
microseconds: 'µs'
nanoseconds:  'ns'
</pre>

Example to overwrite the 'days' separator:

```ruby
<%= countdown to: Time.now + 2.months, units: [ { days: { separator: { title: 'T' } } ] %>
```

results in a countdown like this:

<pre>
61 T
</pre>

To singularize separators on '1' and '-1' pass an additional 'singular' option:

```ruby
<%= countdown to: Time.now + 1.day, units: [ { days: { separator: { title: 'days', singular: 'day' } } ] %>
```

results in a countdown like this:

<pre>
1 day
</pre>

####:leading_zeroes

You can add leading zeroes to units. Nice to have when using a 'clock-like' countdown.

Defaults to <pre>false</pre>

Example:

```ruby
 <%= countdown to: Time.now + 124.minutes, units: [ { hours: { separator: { title: ':' }, leading_zeroes: true }, minutes: { separator: { title: ':' }, leading_zeroes: true }, seconds: { leading_zeroes: true } ] %>
```

results in a countdown like this:

<pre>
02:04:00
</pre>

####:step

Define how often the countdown should be updated via Javascript.

Possible steps are:
<pre>:milliseconds, :seconds, :minutes, :hours, :days</pre>
Defaults to the smallest unit value specified (uses seconds when no step and no units are specified).

Example:
```ruby
<%= countdown to: Time.now + 1.day, step: :minutes %>
```
will update the countdown every minute.

## Countup

For a reverse countdown starting at 00:00:00 use the countup method using the same options:
```ruby
 <%= countup from: Time.now to: Time.now + 1.hour %>
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
