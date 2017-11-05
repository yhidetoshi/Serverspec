require 'spec_helper'
require 'date'

#check_month = Time.now.strftime("%Y%m")
#check_month = (Date.today - 2).strftime("%Y%m")
check_day = (Date.today - 1).strftime("%Y%m%d")

describe command("aws s3 ls s3://bucketname/hoge/#{check_day}.tar.gz | wc -l") do
  its(:stdout) { should match "1" }
end
