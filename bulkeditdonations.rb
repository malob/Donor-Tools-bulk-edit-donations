require 'rubygems'
require 'bundler/setup'
Bundler.require :default

# Include DT url and credentials
require_relative 'config.rb'

# Setup REST resource
resource = RestClient::Resource.new(
  DTParams::BASE_URL,
  user: DTParams::USER,
  password: DTParams::PASS
)

# Get donations
donations = REXML::Document.new resource[ARGV[0]].get

# Extract ids
donation_ids = []
donations.root.elements.each 'donation/id' do |donation_id|
  donation_ids.push donation_id.text
end

donation_ids.each do |donation_id|
  # Get donation
  donation_resource = resource['donations/' + donation_id + '.xml']
  donation = REXML::Document.new donation_resource.get

  # Change attribute
  donation.root.elements.each ARGV[1] do |attribute|
    attribute.text = ARGV[2]
  end

  # Hack to avoid API bug
  donation.root.elements.each 'soft-credits' do |soft_credit|
    donation.root.delete_element soft_credit unless soft_credit.has_elements?
  end

  # Update donation
  donation_resource.put(donation.to_s, content_type: 'application/xml')
  puts 'Donation ' + donation_id + ' updated'
end
