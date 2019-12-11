namespace :eureka do
	desc 'register a new app instance to eureka'
	task register_instance: :environment do
		headers = {
			'Content-Type' => 'application/json'
		}

		body = {
			instance: {
				hostName: ENV['HOST_URL'],
				app: ENV['EUREKA_SERVICE_NAME'].upcase,
				vipAddress: ENV['EUREKA_SERVICE_NAME'],
				instanceId: 'main',
				ipAddr: ENV['HOST_URL'],
				status: 'UP',
				port: {
					"$" => 80,
					"@enabled" => true
				},
				dataCenterInfo: {
					"@class" => 'com.netflix.appinfo.InstanceInfo$DefaultDataCenterInfo',
					name: 'MyOwn'
				}
			}
		}.to_json

		response = HTTParty.post(
			"#{ENV['EUREKA_URL']}/apps/#{ENV['EUREKA_SERVICE_NAME']}",
			headers: headers,
			body: body
		)

		puts "#{response.code}: #{response.message}"
	end
end
