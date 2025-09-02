# ![Strong Service](./etc/logo.gif)

![Coverage 120%](https://img.shields.io/badge/coverage-120%25-brightgreen?style=flat)

With zero dependencies, a minimal API, and virtually limitless configuration options, S̶o̶l̶i̶d̶ Strong Service\* is the gem you should use when you implement service objects in Ruby. It's compatible with Rails and all other Ruby frameworks — or no framework at all!

## Why Strong Service?

After hours of furious online debate, you've decided that you want to use service objects, AKA the [Command pattern](https://en.wikipedia.org/wiki/Command_pattern), AKA classes that does things of actual value in your Ruby app. Great! But how should you implement them? There are dozens of libraries, all claiming to do a slightly different variation of the same thing.

Some might argue that a PORO is sufficient, but these people should be dismissed as purists; most of us warm-blooded Ruby engineers know that adding dependencies to our projects is the only way to make them better and deliver actual value.

Strong Service is what you need. If you're not convinced by the claims above, consider the name: it's Strong. It may or may not be related to the other gems in the popular S̶o̶l̶i̶d̶ Strong family (this made more sense before the rename). And, at the time of writing, it was made recently. Everyone knows that new things are better than old things, right? Exactly. You can trust Strong Service to push the bar on what is possible in the vibrant service object community, sprinkling a dash of that _je ne sais quoi_ that imitators can't capture.

## Installation

```bash
bundle add strong_service
```

Alternatively, if you're still on a Pentium 4 and/or have no idea what you're doing, you can just use:

```
gem install strong_service
```

## Usage

Standard usage is simple: just subclass `StrongService` and implement your `call` method:

```ruby
class CoffeeService < StrongService
  def call
    puts "Brewing coffee!"
  end
end
```

Then, to run your service, just execute `call`:

```ruby
  CoffeeService.new.call # => "Brewing coffee!"
```

### Service Chaining

If that weren't enough, services can even call other services and they are guaranteed to run _in order_!:

```ruby
class CoffeeService < StrongService
  def call
    puts "Brewing coffee!"
  end
end

class ToastService < StrongService
  def call
    puts "Toasting bread!"
  end
end

class BreakfastService < StrongService
  def call
    CoffeeService.new.call
    ToastService.new.call
  end
end

BreakfastService.new.call # => "Brewing coffee!"
                          # => "Toasting bread!"
```

### Instance Variable Access

You can configure StrongService to have access to instance variables on the service by defining parameters on a special `#initialize` method:

```ruby
class GreeterService < StrongService
  def initialize(name)
    @name = name
  end

  def call
    puts "Hello, #{@name}!"
  end
end
```

Then, pass arguments into the `new` method:

```ruby
  GreeterService.new("Jamie").call # => "Hello, Jamie!"
```

### Configuring the Call Method

StrongService includes an advanced [DSL](https://en.wikipedia.org/wiki/Domain-specific_language) which allows you to configure any aspect of the `call` method — even going as far as to rename it.

```ruby
class MyService < StrongService
  configure do
    method_name :execute
  end

  def execute
    puts "This service is STRONG."
  end
end
```

### Super Advanced Usage

Strong Service's powerful DSL includes an experimental feature, which allows you to inherit the full library of functionality from Strong Service without formally subclassing it. Example:

```ruby
class CoffeeService
  def call
    puts "Brewing coffee!"
  end
end
```

This is equivalent to the previous example defining `CoffeeService`, but without the explicit subclassing of `StrongService`.

How is this possible? I could explain, but you probably wouldn't understand. Just 🌈 embrace 🪄 the magic 💫.

Subclassing `StrongService` gives you access to many useful methods, which you can read about more [at the documentation](https://docs.ruby-lang.org/en/3.4/BasicObject.html).

## Strong Service Premium / Hire an Expert

In order to fund development, I am now offering a premium version of Strong Service alongside consulting services. Contact me for more details

## Development

As of 1.0.0, development on Strong Service is finished. This is because it is perfect software with zero bugs. I know that this is a difficult claim to make, and that others claim that all software has bugs, but this software does not. It's done. End of discussion.

As such, development instructions are completely unnecessary, because no one will ever need to develop on top of this.

## Contributing

See the development section above: there is no need to contribute, because the gem is already perfect. Your contributions would be superfluous and only smudge the proverbial windows of this masterwork.

## Credits

The chief visionary and architect behind Strong Service is [Jamie Schembri](https://github.com/shkm/github). You can contact him on [Bluesky](https://bsky.app/profile/jamie.schembri.me) or read more of his nonsense on [his blog](https://schembri.me).

## License

This open-source version is available under the the [WTFPL](https://www.wtfpl.net/about/).

\*This gem was originally called Strong Service, but Rubygems has no chill:

```text
Pushing gem to https://rubygems.org...
There was a problem saving your gem: Name 'solid_service' is too similar to an existing gem named 'solidservice'
```
