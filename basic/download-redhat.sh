#!/usr/bin/env bash

#reposync -r rhel-7-server-extras-rpms/x86_64 -p rhel-7-server-extras-rpms


#reposync -ndl -r rhel-7-server-openstack-11-rpms  -p /mnt/
#reposync -ndl -r rhel-7-server-rh-common-rpms  -p  /mnt/
#reposync -ndl -r rhel-7-server-rpms -p /mnt/
#reposync -ndl -r rhel-ha-for-rhel-7-server-rpms   -p /mnt/

repo_list="rhel-7-server-openstack-11-rpms rhel-7-server-rh-common-rpms rhel-7-server-rpms rhel-ha-for-rhel-7-server-rpms"
for repo in $repo_list 
do
	reposync -ndl -p /mnt -r $repo
done


