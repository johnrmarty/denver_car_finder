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

