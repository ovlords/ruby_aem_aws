# Copyright 2018-2021 Shine Solutions Group
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require 'aws-sdk-autoscaling'
require 'aws-sdk-cloudformation'
require 'aws-sdk-cloudwatch'
require 'aws-sdk-cloudwatchlogs'
require 'aws-sdk-dynamodb'
require 'aws-sdk-ec2'
require 'aws-sdk-elasticloadbalancingv2'
require 'aws-sdk-sns'
require 'aws-sdk-s3'
require 'simplecov'
SimpleCov.start

require_relative 'aws_mocker'
require_relative 'aem_environment'

RSpec.configure do |config|
  config.mock_with :rspec do |mocks|
    # This option should be set when all dependencies are being loaded
    # before a spec run, as is the case in a typical spec helper. It will
    # cause any verifying double instantiation for a class that does not
    # exist to raise, protecting against incorrectly spelt names.
    mocks.verify_doubled_constant_names = true
  end

  # Improve test output
  config.alias_it_should_behave_like_to :it_has_behaviour, 'has behaviour:'

  config.include AwsMocker
  config.include AwsAutoScalingMocker
  config.include AwsElasticLoadBalancerMocker
  config.include AwsEc2Mocker
  config.include AwsCloudWatchMocker
end

require_relative '../../lib/ruby_aem_aws/constants'

TEST_STACK_PREFIX = 'test-prefix'.freeze
TEST_REGION = 'test-region'.freeze

INSTANCE_STATE_HEALTHY = RubyAemAws::Constants::INSTANCE_STATE_HEALTHY
INSTANCE_STATE_CODE_RUNNING = RubyAemAws::Constants::INSTANCE_STATE_CODE_RUNNING
INSTANCE_STATE_CODE_UNHEALTHY = RubyAemAws::InstanceStateCode::TERMINATED
INSTANCE_STATE_UNHEALTHY = 'not-so-good'.freeze
