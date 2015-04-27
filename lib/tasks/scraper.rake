namespace :scraper do
	desc "Craigslist post requests from 3Tap Denver - Cars"
	task scrape: :environment do

    require 'open-uri'
		require 'json'

		auth_token = "4c77c1fdabad9873ddec7823589e8d23"
		polling_url = "http://polling.3taps.com/poll"

    params = {
        auth_token: auth_token,
        anchor: 2077533882,
        source: "CRAIG",
        category_group: "VVVV",
        category: "VAUT",
        'location.city' => "USA-DEN-DEN",
        retvals: "location,heading,price,images,body,external_url,timestamp,annotations"
      }

    uri = URI.parse(polling_url)
    uri.query = URI.encode_www_form(params)
    result = JSON.parse(open(uri).read)

    # puts JSON.pretty_generate result
    # removing code below and running rake scraper:scrape will retrive the hash for the parameters above


    result["postings"].each do |posting|

        @posting = Listing.new
        @posting.heading = posting["heading"]
        @posting.body = posting["body"]
        @posting.price = posting["price"]
        @posting.external_url = posting["external_url"]
        @posting.timestamp = posting["timestamp"]

    #     @posting.x = posting["annotations"]["x"] if posting["annotations"]["x"].present?
       
        @posting.save

    end 
  end 
end 






