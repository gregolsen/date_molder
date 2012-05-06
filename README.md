# DateMolder
Generates format string for `strftime` from date string.

## Installation

    gem install date_molder

## Usage

    DateMolder.build_format("May 12, 2012, 07:34PM +0300") #=> "%B %e, %Y, %I:%M%p %z"

`DateMolder` heavily relies on `Time.parse` and `Date._parse` functions.
It means that `DateMolder` can generate format for every string that is correctly parsed by those methods.

### Alternatives

See [Stamp](https://github.com/jeremyw/stamp) gem that serves similar purpose. However `DateMolder` has several benefits:

* parses strings like '9pm'
* supports time zones
