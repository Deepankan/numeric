require 'rest-client'

task :pull_data => [:environment] do
  api = Api.find_by_url("api.amp.cisco.com/v1/computers")
  base_url = "#{SiteSetting.last.api_client_id}:#{SiteSetting.last.api_key}@"
  query_params = { params: { offset: api.offset, limit: 500 }}

  data = RestClient.get "https://#{base_url}#{api.url}", query_params
  if data.code == 200
    results = JSON.parse(data.body)
    offset = CGI::parse(results['metadata']['links']['next'])['offset']
    api.update(offset: offset.join(','))

    results['data'].each do |result|
      computer = Computer.create(connector_guid: result['connector_guid'], hostname: result['hostname'], active: result['active'], links: result['links'], connector_version: result['connector_version'], operating_system: result['operating_system'], external_ip: result['external_ip'], policy: result['external_ip'], isolation: result['isolation'], group_guid: result['group_guid'], install_date: result['install_date'])
      result['network_addresses'].each do |network_address|
        computer.network_addresses.create(network_address: network_address)
      end

      result['faults'].each do |fault|
        computer.faults.create(fault: fault)
      end

      result['internal_ips'].each do |internal_ip|
        computer.internal_ips.create(ips: internal_ip)
      end
    end
  end
end