#!/bin/bash

# Set etcd endpoints and credentials if necessary
ETCD_ENDPOINTS="http://localhost:2379"  # Replace with your etcd endpoint

# Function to get value from etcd
get_etcd_value() {
  local key=$1
  etcdctl --endpoints=$ETCD_ENDPOINTS get "$key" --print-value-only
}

export $(grep -v '^#' .env | xargs)

# Fetch values from etcd and export them as environment variables
export NEXTCLOUD_MOUNT=$(get_etcd_value "/config/nextcloud/NEXTCLOUD_MOUNT")
export NEXTCLOUD_DATADIR=$(get_etcd_value "/config/nextcloud/NEXTCLOUD_DATADIR")
export MYSQL_DATA_MOUNT=$(get_etcd_value "/config/nextcloud/MYSQL_DATA_MOUNT")
export MYSQL_ROOT_PASSWORD=$(get_etcd_value "/config/nextcloud/MYSQL_ROOT_PASSWORD")
export MYSQL_DATABASE=$(get_etcd_value "/config/nextcloud/MYSQL_DATABASE")
export MYSQL_USER=$(get_etcd_value "/config/nextcloud/MYSQL_USER")
export MYSQL_PASSWORD=$(get_etcd_value "/config/nextcloud/MYSQL_PASSWORD")
