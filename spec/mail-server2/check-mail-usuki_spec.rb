require 'spec_helper'
require 'date'

describe service('postfix') do
  it { should be_running}
end


describe port(25) do
  it { should be_listening}
  it { should be_listening.with('tcp') }
end

describe port(587) do
  it { should be_listening}
  it { should be_listening.with('tcp') }
end


describe host('8.8.8.8') do
  it { should be_reachable}
end

describe service('zabbix-agent') do
  it {should be_running}
end
