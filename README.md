RabbitMQ Dockerfile for CoreOS 
==============================
[![Build Status](https://circleci.com/gh/joukou/joukou-docker-rabbitmq/tree/develop.png?circle-token=43a9599ac7721345c0399b090046b2b995910960)](https://circleci.com/gh/joukou/joukou-docker-rabbitmq/tree/develop) [![Docker Repository on Quay.io](https://quay.io/repository/joukou/rabbitmq/status?token=f64c8e9b-3108-4ec6-8ca1-6faa4329f9ea "Docker Repository on Quay.io")](https://quay.io/repository/joukou/rabbitmq) [![Apache 2.0](http://img.shields.io/badge/License-apache%202.0-brightgreen.svg)](#license) [![Stories in Ready](https://badge.waffle.io/joukou/joukou-docker-rabbitmq.png?label=ready&title=Ready)](http://waffle.io/joukou/joukou-docker-rabbitmq) [![IRC](http://img.shields.io/badge/IRC-%23joukou-blue.svg)](irc://irc.freenode.org:6667/#joukou)

RabbitMQ 3.3.x. Includes RabbitMQ Management Plugin.

## Goal

To create a production ready RabbitMQ Dockerfile and associated image, that may
be used for commercial purposes.

There are many different ways of doing things within the Docker eco-system. This
project was started by users of [CoreOS](https://coreos.com) and as such will
always prefer solutions based around the associated technology such as
[fleet](https://github.com/coreos/fleet), [etcd](https://github.com/coreos/etcd)
and [rudder](https://coreos.com/blog/introducing-rudder/).

## Usage

Upload the template units to the cluster without starting them:

`fleetctl submit rabbitmq\@.service`

Start as many instances as you require:

`fleetctl start rabbitmq@1.service rabbitmq@2.service rabbitmq@3.service`

## Base Image

See [`quay.io/joukou/base`](https://github.com/joukou/joukou-docker-base).

## Volumes

| Location | Purpose |
| -------- | ------- |
| `/var/log/rabbitmq` | RabbitMQ logs |
| `/var/lib/rabbitmq` | RabbitMQ data. The ephemeral nature of Docker containers aside, it is simply not efficient to store data on the union file system. |

## Exposed Ports

| Port      | Purpose                               |
| --------- | ------------------------------------- |
| 4369      | Erlang Port Mapper Daemon (epmd)      |
| 5672      | RabbitMQ (AMQP) |
| 15672     | RabbitMQ Management Plugin (HTTP) |
| 25672     | Erlang Distributed Node Protocol |

## Contributors

[Isaac Johnston](https://github.com/superstructor) ([Joukou Ltd](https://joukou.com))

## License

Copyright &copy; 2009-2014 Joukou Ltd.

RabbitMQ Dockerfile for CoreOS is under the Apache 2.0 license. See the
[LICENSE](LICENSE) file for details.

[![Analytics](https://ga-beacon.appspot.com/UA-41911221-2/joukou-docker-rabbitmq/readme)](https://github.com/igrigorik/ga-beacon)