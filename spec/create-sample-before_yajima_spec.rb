require 'spec_helper'

# サービスが起動&自動起動設定されているかを確認
describe service('nginx') do
  it { should be_enabled }
  it { should be_running }
end

# iptablesが止まっていることを確認
describe service('iptables') do
  it { should_not be_running }
  it { should_not be_enabled }
end

# packageがインストールされているか確認
describe package('python') do
 it { should be_installed }
end

# gemとして指定のバージョンがインストールされているか確認
describe package('bundler') do
  it { should be_installed.by('gem').with_version('1.11.2') }
end

# インストールしたパッケージのバージョン確認
describe package('nginx') do
  it { should be_installed.with_version('1.8.1')}
end

# ポートがListenしているかを確認
describe port(80) do
  it { should be_listening}
  it { should be_listening.with('tcp') }
end

# コマンドを使って確認
describe command('which perl') do
  its(:exit_status){should eq 0}
end

# dnsの確認
describe command('cat /etc/resolv.conf') do
  its(:stdout) { should match /X.X.X.X/ }
end

# ユーザの確認
describe command('whoami') do
  its(:stdout) { should eq "root\n" }
end

# インストールされているrubyのバージョンを確認
describe command('ruby -v') do
  its(:stdout) { should match /ruby 2\.3\.0p0/ }
end

# リーチャビリティのテスト
describe host('8.8.8.8') do
  it { should be_reachable}
end

# 名前解決のテスト
describe host('www.google.com') do
  it { should be_resolvable}
end

# デフォゲのテスト
describe default_gateway do
  its(:interface) { should eq 'eth0'}
  its(:ipaddress) { should eq 'X.X.X.X'}
end

# 実行可能かテスト
describe file('/etc/init.d/nginx') do
  it { should be_executable}
end

# config設定の確認テスト
describe file('/etc/nginx/conf.d/default.conf') do
  it { should contain 'server_name localhost'}
end

# ディレクトリが存在するか
describe file('/var/log/nginx') do
  it { should exist}
  it { should be_directory }
end

# インターフェースの確認
describe interface('eth0') do
  it { should exist }
  it { should be_up }
  it { should have_ipv4_address('X.X.X.X') }
end

# selinuxの状態確認
describe selinux do
  it { should be_disabled}
#  it { should be_enforcing }
#  it { should be_permissive }
end

describe cron do
  it { should have_entry '<  -l で出力されるものを書く>' }
end

# ホームディレクトリがあるか確認
describe user('root') do
  it { should have_home_directory '/root' }
end

# ログインシェルの確認
describe user('root') do
  it { should have_login_shell '/bin/bash' }
end

# yum-repoの確認
describe yumrepo('epel') do
  it { should exist}
  it { should be_enabled}
end
