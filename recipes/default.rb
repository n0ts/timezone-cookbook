#
# Cookbook Name:: timezone
# Recipe:: default
#
# Copyright 2014, Naoya Nakazawa
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'timezone-ii'

require 'chef/util/file_edit'


if ['rhel','centos','scientific','amazon'].member? node[:platform]
  clock = Chef::Util::FileEdit.new("/etc/sysconfig/clock")
  clock.search_file_replace_line(/^ZONE=.*$/, "ZONE=\"#{node[:tz]}\"")
  clock.write_file
end
