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

require_relative 'abstract_single_component'
require_relative 'mixins/healthy_instance_state_verifier'
require_relative 'mixins/metric_verifier'

module RubyAemAws
  module Component
    # Interface to the AWS instance running the Orchestrator component of a full-set AEM stack.
    class Orchestrator
      attr_reader :descriptor, :ec2_resource, :cloud_watch_client
      include AbstractSingleComponent
      include HealthyInstanceStateVerifier
      include MetricVerifier

      EC2_COMPONENT = 'orchestrator'.freeze
      EC2_NAME = 'AEM Orchestrator'.freeze

      # @param stack_prefix AWS tag: StackPrefix
      # @param ec2_resource AWS EC2 resource
      # @return new RubyAemAws::FullSet::Orchestrator
      def initialize(stack_prefix, ec2_resource, cloud_watch_client)
        @descriptor = ComponentDescriptor.new(stack_prefix,
                                              EC2Descriptor.new(EC2_COMPONENT, EC2_NAME))
        @ec2_resource = ec2_resource
        @cloud_watch_client = cloud_watch_client
      end

      def healthy?
        raise NotYetImplementedError
      end

      # def terminate_all_instances

      # def terminate_random_instance

      # def wait_until_healthy
    end
  end
end
