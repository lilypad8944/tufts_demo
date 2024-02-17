# Tufts Demo

[![GitHub Release](https://img.shields.io/github/v/release/UCO-HPC/buddy_jupyter?style=flat-square)](https://github.com/lilypad8944/tufts_demo/blob/main/CHANGELOG.md)
[![GitHub License](https://img.shields.io/github/license/lilypad8944/tufts_demo?style=flat-square)](https://opensource.org/licenses/MIT)
---

A series of scripts and config files to deploy a simple HPC demonstration. While the stackscripts designed for [Linode], this set of files could be convereted to run anywhere as most of them are agnostic.

[Linode]: linode.com
---
## Prerequisites
A system operating [Rocky] 8.9+ will be needed. These scripts have not been tested against other RHEL 8 compatibles or prior versions of Rocky. 

## Additional applications to be installed
- [Ansible]
- [Docker]

[Rocky]: https://rockylinux.org/download
[Ansible]: https://www.ansible.com
[Docker]: https://www.docker.com/

## Installation
---
### Initial Setup
- Copy the stackscripts into your linode account and update the user account information at the top of the scripts per the instruction located within the comment
- Build your headnode as the linode user and set your hostname accordingly
- Generate ssh keys as your user
- Repeat the stackscript steps for a compute node and copy your ssh keys using ssh-copy-id
- Update the ansible inventory manually and copy your ssh keys and the new inventory between systems

## Contributing

Please feel free to copy and use as needed according to the associated license.

## License

* Code, documentation, and content are licensed under MIT (see LICENSE.txt) at this time. License is subject to change without notice. 