# java7

[![Build Status](https://travis-ci.org/Spantree/puppet-java7.svg?branch=master)](https://travis-ci.org/Spantree/puppet-java7)
[![Puppet Forge](https://img.shields.io/puppetforge/v/spantree/java7.svg)](https://forge.puppetlabs.com/spantree/java7)
[![Puppet Forge](https://img.shields.io/puppetforge/f/spantree/java7.svg)](https://forge.puppetlabs.com/spantree/java7)

#### Table of Contents

1. [Overview](#overview)
2. [Module Description](#module-description)
3. [Setup - The basics of getting started with java7](#setup)
    * [What java7 affects](#what-java7-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with java7](#beginning-with-java7)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

The module java7 installs the oracle java7 jdk on Ubuntu or Debian based system.

## Module Description

This module adds a new apt repository and then proceeds to install oracle jdk7

##### NOTE: This module may only be used if you agree to the Oracle license: http://www.oracle.com/technetwork/java/javase/terms/license/

## Setup

### What java7 affects

* Install oracle jdk using the 'https://launchpad.net/~webupd8team/+archive/ubuntu/java' deb package
* Sets up a system wide `JAVA_HOME`

### Setup Requirements

None at the moment.

### Beginning with java7

`include java7` is enough to get you up and running.

##Usage

All interaction with the java7 module can be done through the main java7 class.

###I just want Oracle java 7 jdk, what's the minimum I need?
```puppet
include java7
```

##Reference

###Classes

####Public Classes

* java7: Main class

###Parameters

###Facts

##Limitations

This module has been built on and tested against Puppet 3.2 and higher.

The module has been tested on:

* Ubuntu 12.04
* Ubuntu 14.04

Testing on other platforms has been light and cannot be guaranteed.

## Development

## Release Notes/Contributors/Etc
