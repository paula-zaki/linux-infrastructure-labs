# linux-infrastructure-labs
Hands-on Linux infrastructure labs using Vagrant, KVM/libvirt, and Rocky Linux/Ubuntu. Covers virtualization, networking, storage, NFS, LVM, RAID, system administration, automation, and real-world troubleshooting.
# Linux Infrastructure Labs

This repository contains my work from a hands-on Linux infrastructure course focused on real-world projects and system administration scenarios.

The original course was developed around **Windows 11 and VirtualBox**, while my environment uses **Fedora 44 and KVM/libvirt**. Because of this difference, several parts of the original projects required modification or troubleshooting.

The course material was also last updated approximately two years ago, so some of the tools, configurations, and procedures required updating to work with a modern Linux environment.

Rather than simply following the original instructions, I adapted the projects to my environment and documented the problems I encountered, the troubleshooting process, and the solutions I implemented.

## What this repository demonstrates

* Linux system administration
* KVM/QEMU and libvirt virtualization
* Vagrant
* Linux networking
* NetworkManager
* NFS
* LVM and storage management
* RAID
* systemd
* SELinux
* Bash scripting and automation
* Troubleshooting and problem solving

## Environment

* **Host OS:** Fedora 44
* **Virtualization:** KVM/QEMU + libvirt
* **Automation:** Vagrant
* **Guest OS:** Rocky Linux / Ubuntu

## Troubleshooting Documentation

A significant part of this repository focuses on documenting real problems encountered while adapting the projects to my environment.

For each relevant issue, I aim to document:

1. The problem and error message
2. Initial investigation
3. Commands and tools used to diagnose the issue
4. Root cause
5. Solution
6. Lessons learned

The goal is not only to provide working configuration files, but also to demonstrate the troubleshooting and system-administration process behind them.
