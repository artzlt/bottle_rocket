bottle_rocket
=========

Work in progress!
Adds a countdown to your views. Countdown is updated via JavaScript.

## Installation

Add this line to your application's Gemfile:

    gem 'countdown'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install countdown

### Rails 3.1 or greater (with asset pipeline *enabled*)

Add the countdown javascript file to `app/assets/javascripts/application.js`:

```js
//= require countdown
```

### Rails 3.0 (or greater with asset pipeline *disabled*)

Run the generator:
```sh
rails generate countdown:install
```
Running the generator will copy 'countdown.js' over to the `public\javascripts` directory.
Be sure to add `countdown.js` to your layout file:
```ruby
<%= javascript_include_tag 'countdown' %>
```

## Usage

```ruby
 <%= countdown from: Time.now + 28.hours %>
```
results in a countdown like this:

<pre>
1d03h59m59s
</pre>

or to count down from another time than now:
```ruby
 <%= countdown to: Time.now - 2.months, from: Time.parse '2012-09-27 01:07:00' %>
```

The countdown is updated every second and the generated html looks like this:

```html
<div class="countdown">
  <span class="days">
    <span class="day unit-1">1</span>
    <span class="separator days">d</span>
  </span>
  <span class="hours">
    <span class="hour unit-0">0</span>
    <span class="hour unit-3">3</span>
    <span class="separator hours">h</span>
  </span>
  <span class="minutes">
    <span class="minute unit-5">5</span>
    <span class="minute unit-9">9</span>
    <span class="separator minutes">m</span>
  </span>
  <span class="seconds">
    <span class="second unit-5">5</span>
    <span class="second unit-9">9</span>
    <span class="separator seconds">s</span>
  </span>
</div>
```

### Options

####:step

Define how often the counter should be updated via Javascript.
Possible steps are:
<pre>:milliseconds, :seconds, :minutes, :hours, :days</pre>

Defaults to the smallest unit value specified.

####:units

Define which time units should be displayed and how they should be ordered.

Available keys are:
<pre>:millenniums, :centuries, :decades, :years, :months, :weeks, :days, :hours, :minutes, :seconds, :milliseconds, :microseconds, :nanoseconds</pre>

Default is
```ruby
[:days, :hours, :minutes, :seconds]
```
####:separators

Define how different time units are separated from each other.

Available keys are:
<pre>:millenniums, :centuries, :decades, :years, :months, :weeks, :days, :hours, :minutes, :seconds, :milliseconds, :microseconds, :nanoseconds</pre>

Default is
```ruby
{ millenniums: {value: 'MN'},
  centuries: {value: 'C'},
  decades: {value: 'D'},
  years: {value: 'Y'},
  months: {value: 'M'},
  weeks: {value: 'w'},
  days: {value: 'd'},
  hours: {value: 'h'},
  minutes: {value: 'm'},
  seconds: {value: 's'},
  milliseconds: {value: 'ms'},
  microseconds: {value: 'µs'},
  nanoseconds: {value: 'ns'} }
```
You can singularize separators by supplying a hash e.g
```ruby
days: {value: 'days', singular: 'day'}
```
By default separators are displayed after the corresponding time unit.
To display them before to the units use this option:
```ruby
seconds: {value: 'seconds:', align: :before}
```
results in this:

<pre>
seconds:1
</pre>

####:leading_zeroes

Set to false to remove leading zeroes (e.g 08:00:00 => 8:00:00)

Defaults to <pre>true</pre>.

## Countup

For a reverse countdown starting at 00:00:00 use the countup method using the same options:

```ruby
 <%= countup from: Time.now to: Time.now + 1.hour %>
```

## TODO:

- Everything
- Note to me: How to define a callback, which happens after a complete countdown/-up? 

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
