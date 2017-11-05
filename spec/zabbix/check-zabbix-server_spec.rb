require 'spec_helper'
require 'date'

describe service('httpd') do
  it { should be_running}
end

describe service('mysqld') do
  it { should be_running}
end

describe service('zabbix-server') do
  it { should be_running}
end

describe service('zabbix-agent') do
  it { should be_running}
end

describe service('postfix') do
  it { should be_running}
end

describe port(80) do
  it { should be_listening}
  it { should be_listening.with('tcp') }
end

describe port(25) do
  it { should be_listening }
end

describe port(3306) do
  it { should be_listening }
end

describe host('8.8.8.8') do
  it { should be_reachable}
end

