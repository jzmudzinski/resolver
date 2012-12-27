#
# Author:: Joshua Timberman <joshua@opscode.com>
# Copyright:: Copyright (c) 2009-2012, Opscode, Inc.
# License:: Apache License, Version 2.0
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
#


default['resolver']['search'] = domain
default['resolver']['nameservers'] = []
default['resolver']['options'] = {}
default['resolver']['server_role'] = 'nameserver'
case platform
when "ubuntu"
  if platform_version.to_f >= 12.04
    # append to the tail of resolvconf's generated files
    default['resolver']['config_file'] = '/etc/resolvconf/resolv.conf.d/tail'
  else
    default['resolver']['config_file'] = '/etc/resolv.conf'
  end
else
  default['resolver']['config_file'] = '/etc/resolv.conf'
end
