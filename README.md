# ansible_role_openstack_common

This is an Ansible role. This role executes OpenStack common setting.

## Processing
This role executes the following settings.

* network setting
  * set hostname
  * set entries of hosts
  * set firewalld service disabled and stopped
* NTP setting
  * install chrony package
  * set time servers to synchronize clock
  * set address to be syncronized clock from the outside
  * set chrony service enabled and started
* OpenStack packages setting
  * register openstack repository
  * install necessary packages
  * set packages latest

## Caution!!
* This role assumpts a part of network settings (nics, default gateway and dns server) is completed.
* This role assumpts NetworkManager service is disabled and stopped.
* If hostname is changed or at least one package is installed, this role will reboot target.

## Support OpenStack release
* Ocata

## Support OS

| OS | version |
|----|---------|
|CentOS|7|

## Role variables
```
openstack_common:
  hostname: controller                     # hostname to set
  allowed_sync: yes                        # whether allow for the others to sync clock from this server
  hosts:                                   # hosts entries
    - name: controller                     # name
      ip: 192.168.1.115                    # ip associated with name
    - name: compute                        # name
      ip: 192.168.1.116                    # ip associated with name
  ntp_servers:                             # NTP servers to synchronize clock
    - '0.jp.pool.ntp.org'                  # NTP server's ip
    - '1.jp.pool.ntp.org'                  # NTP server's ip
  allowed_addr_for_chrony: 192.168.1.0/25  # address allowed to be synchronized from outside
  exec_yum_update: yes                     # whether 'yum update' is executed or not
```

## Dependencies
None

## Build status
|branch|status|
|------|------|
|master|[![Build Status](http://jenkins.bbrfkr.mydns.jp:8088/job/ansible_role_openstack_common_master/badge/icon)](http://jenkins.bbrfkr.mydns.jp:8088/job/ansible_role_openstack_common_master/)|
|ocata |[![Build Status](http://jenkins.bbrfkr.mydns.jp:8088/job/ansible_role_openstack_common_ocata/badge/icon)](http://jenkins.bbrfkr.mydns.jp:8088/job/ansible_role_openstack_common_ocata/)|

## Retest
This role is tested by serverspec, then its test codes are included in repository. Users can retest this role by using the test codes. To retest this role, follow the steps described below.

1. Prepare targets (Here, targets ip are X.X.X.X, Y.Y.Y.Y)
2. Install serverspec in local machine
3. Modify spec/inventory.yml
```
---
- conn_name: target15  # never change!
  conn_host: X.X.X.X   # target ip
  conn_port: 22        # target's ssh port
  conn_user: vagrant   # user to connect
  conn_pass: vagrant   # password of user
  conn_idkey:          # path of identity key 
                       # (absolute path or relative path from the location of Rakefile)
  sudo_pass:           # sudo password of user

- conn_name: target16  # never change!
  conn_host: Y.Y.Y.Y   # target ip
  conn_port: 22        # target's ssh port
  conn_user: vagrant   # user to connect
  conn_pass: vagrant   # password of user
  conn_idkey:          # path of identity key
                       # (absolute path or relative path from the location of Rakefile)
  sudo_pass:           # sudo password of user
```
4. Run `rake`

## License
MIT

## Author
Name: bbrfkr  
MAIL: bbrfkr@gmail.com

