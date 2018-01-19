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

require_relative '../../spec_helper'
require_relative 'examples/check_methods_exist'
require_relative '../../../../lib/ruby_aem_aws/component/author'

author = RubyAemAws::Component::Author.new(nil, nil, nil)

describe author do
  it_behaves_like 'a health flagged component'
end

describe 'Author.healthy?' do
  before do
    @instance_component = RubyAemAws::Component::Author::EC2_COMPONENT
    @instance_name = RubyAemAws::Component::Author::EC2_NAME
    @instance_filter = [
      { StackPrefix: TEST_STACK_PREFIX },
      { Component: @instance_component },
      { Name: @instance_name }
    ].freeze
    @instance_1_id = 'i-00525b1a281aee5b9'.freeze

    @mock_ec2 = double('mock_ec2')
    @mock_cloud_watch = double('mock_cloud_watch')

    @instances = []

    @author = RubyAemAws::Component::Author.new(TEST_STACK_PREFIX, @mock_ec2, @mock_cloud_watch)
  end

  it 'verifies EC2 running instance' do
    add_instance(@instances, @instance_1_id, INSTANCE_STATE_HEALTHY)

    expect(@author.healthy?).to equal true
  end

  it 'verifies metric exists' do
    expect(@author.metric?('bob')).to equal true
  end
end
