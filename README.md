# Livy

## Table of Contents

1. [Overview](#Overview)
1. [Support](#Support)
1. [Setup](#Setup)
    * [What the Livy class affects](#what-the-livy-class-affects)
1. [Usage](#Usage)
    * [Install default Livy server](#install-default-livy-server)
    * [Install Livy with custom spark_home](#install-livy-with-custom-spark_home)
    * [Install with custom binding and port](#Install-with-custom-binding-and-port)

## Overview

The Livy puppet module downloads, extracts and deploys the livy-server binary and all relevant configuration files.

## Support

This module is currently tested on:

* CentOS 6

* CentOS 7

## Setup

### What the Livy class affects

* Downloads and unpackages the livy-server package from livy.io
* Extracts download to `/opt/livy-server-{version}`
* Configures settings in /opt/livy-server/conf
* Creates startup scripts for livy-server

## Usage

### Install default Livy server

```puppet
class {'::livy':}
```

### Install Livy with custom SPARK_HOME

```puppet
class {'::livy':
  spark_home => '/opt/cloudera/parcels/CDH-5.4.2-1.cdh5.4.2.p0.2/lib/spark',
}
```

### Install with custom binding and port

```puppet
class {'::livy':
  conf_server_host => '127.0.0.1',
  conf_server_port => '8761',
}
```
