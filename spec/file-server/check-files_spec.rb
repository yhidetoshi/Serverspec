require 'spec_helper'
require 'date'

today = Time.now.strftime("%Y%m%d") 

going_leaving_report_file = "/srv/www/file.beaconnect.jp/services/03180318/going_leaving_reports/#{today}/going_leaving_report.csv"
beacons_list_file = "/srv/www/file.beaconnect.jp/services/03180318/going_leaving_reports/#{today}/beacons_list.csv"

#puts going_leaving_report_path


describe file(going_leaving_report_file) do
  it { should be_file }
end

describe file(beacons_list_file) do
  it { should be_file }
end

