#
# Cookbook Name:: osl-logging
# Recipe:: default
#
# Copyright 2015 Oregon State University
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

package 'rsyslog-elasticsearch' do
    action :upgrade
end

node.override['rsyslog']['modules'] = node['rsyslog']['modules'] | ['mmnormalize', 'omelasticsearch']

template "#{node['rsyslog']['config_prefix']}/rsyslog.d/elasticsearch.conf" do
    source    "elasticsearch.conf.erb"
    owner     'root'
    group     'root'
    mode      '0644'
    notifies  :restart, "service[#{node['rsyslog']['service_name']}]"
end

template "#{node['rsyslog']['config_prefix']}/rsyslog.d/kibana.conf" do
    source    "rsyslog-kibana.conf.erb"
    owner     'root'
    group     'root'
    mode      '0644'
    notifies  :restart, "service[#{node['rsyslog']['service_name']}]"
end
