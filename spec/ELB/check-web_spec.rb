require 'spec_helper'
require 'date'

# puma shared api
describe command("aws elb describe-load-balancers --load-balancer-name beaconnect-lb-1 | jq '.LoadBalancerDescriptions[].Instances[]' | grep -c InstanceId") do
  its(:stdout) { should match "4" }
end

describe command("aws elb describe-load-balancers --load-balancer-name beaconnect-lb-1 | jq '.LoadBalancerDescriptions[].Instances[]'") do
  its(:stdout) { should match "i-206258af" }
  its(:stdout) { should match "i-8c660413" }
  its(:stdout) { should match "i-a916c737" }
  its(:stdout) { should match "i-b83de136" }
end
