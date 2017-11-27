require 'spec_helper'

describe service('nginx') do
  it { should be_running}
end

describe port(80) do
  it { should be_listening }
  it { should be_listening.with('tcp')}
end

describe port(443) do
  it { should be_listening }
  it { should be_listening.with('tcp')}
end

describe file("/etc/ssl/certs/ca_and_hoge.jp.crt") do
  it { should be_file }
  it { should be_owned_by('root') }
  it { should be_grouped_into('root')}
  it { should be_mode '400' }
end

describe file("/etc/ssl/private/hoge.jp.key") do
  it { should be_file }
  it { should be_owned_by('root') }
  it { should be_grouped_into('root')}
  it { should be_mode '400' }
end

describe command('curl https://hoge.com -o /dev/null -w "%{http_code}\n" -s') do
  its(:stdout) { should match /^302$/ }
end
