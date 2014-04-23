# Donor-Tools-bulk-edit-source

A ruby script to bulk edit attributes on a list of donations in [Donor Tools](http://donortools.com).

## Usage

To use this script you must first create a file called “config.rb” which contains information about your Donor Tools configuration. An example has been provided named “config_example.rb”

Next run `$ bundle install` to install all required gems. If you do not have Bundler installed first run `$ gem install bundler`

Finally you can run the script, which would looks something like this,
```
$ ruby bulkeditdonations.rb "people/3070568/donations.xml?per_page=500" "donation-type-id" "8"
```
where 

* the first argument is a resource which contains a list of donations,
* the second argument is the attribute that will be modified, and
* the final argument corresponds to the new attribute value.

In the example above the script will change the *donation-type-id* attribute, for the first *500* donations from the donor with id *3070568*, to *8*.