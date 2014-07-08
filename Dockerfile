# Copyright 2014 Joukou Ltd
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
FROM quay.io/joukou/base
MAINTAINER Isaac Johnston <isaac.johnston@joukou.com>

ENV DEBIAN_FRONTEND noninteractive
ENV RABBITMQ_VERSION 3.3.5
ENV RABBITMQ_NODE_PORT 5672
ENV RABBITMQ_DIST_PORT 25672

# Add the RabbitMQ public key to the trusted key list
ADD rabbitmq-signing-key-public.asc /tmp/rabbitmq-signing-key-public.asc

# Add the RabbitMQ apt repository to the apt data sources
ADD etc/apt/sources.list.d/rabbitmq.list /etc/apt/sources.list.d/rabbitmq.list

# Install RabbitMQ
RUN apt-key add /tmp/rabbitmq-signing-key-public.asc && \
    apt-get update -qq && \
    apt-get install --no-install-recommends -y rabbitmq-server && \
	  rabbitmq-plugins enable rabbitmq_management && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Add custom RabbitMQ scripts to enable long names for distributed Erlang nodes; i.e. FQDNs
ADD usr/lib/rabbitmq/lib/rabbitmq_server-${RABBITMQ_VERSION}/sbin/rabbitmq-defaults /usr/lib/rabbitmq/lib/rabbitmq_server-${RABBITMQ_VERSION}/sbin/
ADD usr/lib/rabbitmq/lib/rabbitmq_server-${RABBITMQ_VERSION}/sbin/rabbitmq-env /usr/lib/rabbitmq/lib/rabbitmq_server-${RABBITMQ_VERSION}/sbin/
ADD usr/lib/rabbitmq/lib/rabbitmq_server-${RABBITMQ_VERSION}/sbin/rabbitmq-plugins /usr/lib/rabbitmq/lib/rabbitmq_server-${RABBITMQ_VERSION}/sbin/
ADD usr/lib/rabbitmq/lib/rabbitmq_server-${RABBITMQ_VERSION}/sbin/rabbitmq-server /usr/lib/rabbitmq/lib/rabbitmq_server-${RABBITMQ_VERSION}/sbin/
ADD usr/lib/rabbitmq/lib/rabbitmq_server-${RABBITMQ_VERSION}/sbin/rabbitmqctl /usr/lib/rabbitmq/lib/rabbitmq_server-${RABBITMQ_VERSION}/sbin/

# Make RabbitMQ's data and log directories volumes
VOLUME [ "/var/lib/rabbitmq", "/var/log/rabbitmq" ]

# Expose ports
#   4369    Erlang Port Mapper Daemon (epmd)
#   5672    RabbitMQ
#   15672   RabbitMQ Management Plugin
#   25672   Erlang Distributed Node Protocol
EXPOSE 4369 5672 15672 25672

ADD bin/boot /bin/
CMD [ "/bin/boot" ]
