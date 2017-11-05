require 'spec_helper'
require 'date'

describe service('nginx') do
  it { should be_running}
end

describe service('sendmail') do
  it { should be_running}
end

describe port(443) do
  it { should be_listening}
  it { should be_listening.with('tcp') }
end

describe port(80) do
  it { should be_listening}
  it { should be_listening.with('tcp') }
end

describe port(25) do
  it { should be_listening}
  it { should be_listening.with('tcp') }
end

describe host('8.8.8.8') do
  it { should be_reachable}
end

describe service('zabbix-agent') do
  it {should be_running}
end

describe command("ps -ef | grep beaconnect_log_subscriber | grep -cv grep") do
  its(:stdout) { should match "3" }
end

describe command("ps -ef | grep unix:///srv/www/mail_notification_service/shared/tmp/sockets/puma.sock | grep -cv grep") do
  its(:stdout) { should match "1" }
end
