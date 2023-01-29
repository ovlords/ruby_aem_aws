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

require_relative '../spec_helper'
require_relative '../../../lib/ruby_aem_aws/architecture/consolidated_stack'

describe 'ConsolidatedStack' do
  before do
    params = {
      CloudWatchClient: double('mock_cloud_watch'),
      CloudWatchLogsClient: double('mock_cloud_watch_logs'),
      Ec2Resource: double('mock_ec2')
    }
    @consolidated_stack = RubyAemAws::ConsolidatedStack.new(TEST_STACK_PREFIX,
                                                            params)
  end

  it 'should create author_publish_dispatcher' do
    expect(@consolidated_stack.author_publish_dispatcher).to_not be_nil
  end
end
