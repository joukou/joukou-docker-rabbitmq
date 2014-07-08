RabbitMQ Dockerfile for Joukou 
==============================
[![Build Status](https://circleci.com/gh/joukou/joukou-docker-rabbitmq/tree/develop.png?circle-token=43a9599ac7721345c0399b090046b2b995910960)](https://circleci.com/gh/joukou/joukou-docker-rabbitmq/tree/develop) [![Docker Repository on Quay.io](https://quay.io/repository/joukou/rabbitmq/status?token=f64c8e9b-3108-4ec6-8ca1-6faa4329f9ea "Docker Repository on Quay.io")](https://quay.io/repository/joukou/rabbitmq) [![Apache 2.0](http://img.shields.io/badge/License-Apache%202.0-brightgreen.svg)](#license) [![Stories in Ready](https://badge.waffle.io/joukou/joukou-docker-rabbitmq.png?label=ready&title=Ready)](http://waffle.io/joukou/joukou-docker-rabbitmq) [![IRC](http://img.shields.io/badge/IRC-%23joukou-blue.svg)](http://webchat.freenode.net/?channels=joukou)

[RabbitMQ](http://www.rabbitmq.com/) 3.3.x Dockerfile for
[Joukou](https://joukou.com).

Includes the RabbitMQ Management Plugin.

## Usage

Executed via [Joukou Fleet Units](https://github.com/joukou/joukou-fleet).

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

Copyright &copy; 2014 Joukou Ltd.

RabbitMQ Dockerfile for Joukou is under the Apache 2.0 license. See the
[LICENSE](LICENSE) file for details.