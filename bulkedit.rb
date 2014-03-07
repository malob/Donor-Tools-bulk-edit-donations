require 'rubygems' 
require 'bundler/setup'
Bundler.require(:default)

# Include DT url and credentials
require_relative 'config.rb'

# Setup REST resource
resource = RestClient::Resource.new(
	DTParams::Base_url, 
	user: DTParams::User, 
	password: DTParams::Pass
)

# Get donations
donations = REXML::Document.new resource['people/3070568/donations.xml'].get

# Extract ids
donation_ids = Array.new
donations.elements.each('donations/donation/id') do |donation_id|
	donation_ids.push donation_id.text
end

donation_ids.each do |donation_id|
	# Get individual donations
	donation_resource = resource['donations/' + donation_id + '.xml']
	donation = REXML::Document.new donation_resource.get

	# Change source-id
	donation.elements.each('donation/source-id') do |source_id|
		source_id.text = '42509'
	end
	
	# Update donation
	donation_resource.put(donation.to_s, content_type: 'application/xml')
end