#!/bin/bash

sudo mkdir -p /etc/containerd && containerd config default | sudo tee /etc/containerd/config.toml 