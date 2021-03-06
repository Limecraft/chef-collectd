#
# Cookbook Name:: collectd
# Attributes:: default
#
# Copyright 2010, Atari, Inc
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
#

default[:collectd][:types_db] = ["/usr/share/collectd/types.db"]
default[:collectd][:interval] = 10
default[:collectd][:read_threads] = 5
default[:collectd][:server_role] = "collectd_server"
default[:collectd][:server_ip] = "127.0.0.1"

# To make the collectd web out of the box we need to
# activate the rrdtool plugin on the server
default[:collectd][:enable_rrdtool_plugin] = true

default[:collectd][:collectd_web][:path] = "/srv/collectd_web"
default[:collectd][:collectd_web][:hostname] = "collectd"
default[:collectd][:collectd_web][:http_port] = 80

case node.platform
when "debian","ubuntu"
  # This is where the plugins conf file is created
  default[:collectd][:conf_dir] = "/etc/collectd"
  # This is where the configfiles (collection.conf, collectd.conf, template.conf) reside
  default[:collectd][:configfile_dir] = "/etc/collectd"
  default[:collectd][:base_dir] = "/var/lib/collectd"
  default[:collectd][:plugin_dir] = "/usr/lib/collectd"
when "centos", "redhat"
  default[:collectd][:conf_dir] = "/etc/collectd.d"
  default[:collectd][:configfile_dir] = "/etc"
  default[:collectd][:base_dir] = "/var/lib/collectd"
  default[:collectd][:plugin_dir] = "/usr/lib64/collectd"
end
