require 'net/http'
require 'json'
require 'uri'

initial_url = 'https://www.letsrevolutionizetesting.com/challenge.json'
url = URI.parse(initial_url)

loop do
  response = Net::HTTP.get(url)
  parsed_response = JSON.parse(response)

  if parsed_response['message'] != 'This is not the end'
    puts 'Response: ' + response
    break  # Exit the loop if the condition is met
  else
    follow_url = parsed_response['follow']
    follow_url.sub!('challenge', 'challenge.json')
    url = URI.parse(follow_url)
    puts 'Response does not match the expected condition. Retrying...'
  end

  sleep 1  # Pause for 1 second before sending the next request
end
