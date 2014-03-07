Donor-Tools-bulk-edit-source
============================

A ruby script to bulk edit the source on a list of donations in Donor Tools

Usage
=====

To use this script you must first create a file called `config.rb` which contains information about your Donor Tools configuration.
```ruby
module DTParams
	Base_url = 'https://yoursubdomain.donortools.com'
	User = 'yourusename'
	Pass = 'yourpassword'
end
```

Next run `$ bundle install` to install all required gems. If you do not have Bundler installed first run `$ gem install bundler`

Finally you can run the script, which would looks something like this:
```
$ ruby bulkeditsource.rb "people/3070568/donations.xml" "42509"
```

where 
- the first argument is a resource which contains a list of donations, in this case, the donations from a particular donor; and
- the second argument corresponds to the id of the source you want to assing to all those donations to.


