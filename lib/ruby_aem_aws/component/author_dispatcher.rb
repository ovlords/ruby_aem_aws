# Copyright 2018 Shine Solutions
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

require 'aws-sdk'
require_relative 'mixins/healthy_instance_count_verifier'
require_relative 'abstract_component'
require_relative 'component_descriptor'

module RubyAemAws
  module Component
    # Interface to the AWS instances playing and supporting the AuthorDispatcher role in a full-set AEM stack.
    class AuthorDispatcher
      attr_reader :descriptor, :ec2_resource, :elb_client, :asg_client
      include AbstractComponent
      include HealthyInstanceCountVerifier

      EC2_COMPONENT = 'author-dispatcher'.freeze
      EC2_NAME = 'AuthorDispatcher'.freeze
      ELB_ID = 'AuthorDispatcherLoadBalancer'.freeze
      ELB_NAME = 'AEM Author Dispatcher Load Balancer'.freeze

      # @param stack_prefix AWS tag: StackPrefix
      # @param ec2_resource AWS EC2 resource
      # @param elb_client AWS ElasticLoadBalancer client
      # @param asg_client AWS AutoScalingGroup client
      # @return new RubyAemAws::FullSet::AuthorDispatcher
      def initialize(stack_prefix, ec2_resource, elb_client, asg_client)
        @descriptor = ComponentDescriptor.new(stack_prefix,
                                              EC2Descriptor.new(EC2_COMPONENT, EC2_NAME),
                                              ELBDescriptor.new(ELB_ID, ELB_NAME))
        @ec2_resource = ec2_resource
        @elb_client = elb_client
        @asg_client = asg_client
      end

      # def get_all_instances

      # def get_random_instance

      # def get_num_of_instances

      # def terminate_all_instances

      # def terminate_random_instance

      # def healthy?

      # def wait_until_healthy
    end
  end
end
