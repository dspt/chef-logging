#
# Cookbook Name:: osl-logging
# Recipe:: kibana
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

#node.default['osl-logging']['kibana']['download_url'] = "https://download.elastic.co/kibana/kibana/kibana-4.3.0-linux-x64.tar.gz"
#node.default['osl-logging']['kibana'['sha1'] = 'd64e1fc0ddeaaab85e168177de6c78ed82bb3a3b'
#node.default['osl-logging']['kibana']['version'] = '4.3.0'

#include_recipe 'simple-kibana::install'
#include_recipe 'simple-kibana::configure'

node.override['kibana']['download_url'] = "https://download.elastic.co/kibana/kibana/kibana-4.3.0-linux-x64.tar.gz"
node.override['kibana']['checksum'] = 'd64e1fc0ddeaaab85e168177de6c78ed82bb3a3b'
node.override['kibana']['version'] = '4.3.0'
