require 'spec_helper'
require 'date'

describe service('nginx') do
  it { should be_running}
end

describe port(80) do
  it { should be_listening}
  it { should be_listening.with('tcp') }
end

describe port(443) do
  it { should be_listening }
end

describe host('8.8.8.8') do
  it { should be_reachable}
end

# puma shared api
describe command("ps -ef | grep puma | grep unix:///srv/www/BeaconnectAPI/shared/tmp/sockets/puma.sock | grep -cv grep") do
  its(:stdout) { should match "1" }
end

# puma shared admin
describe command("ps -ef | grep puma | grep unix:///srv/www/BeaconnectAdmin/shared/tmp/sockets/puma.sock | grep -cv grep") do
  its(:stdout) { should match "1" }
end

describe service('zabbix-agent') do
  it {should be_running}
end

