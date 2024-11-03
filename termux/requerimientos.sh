#!/bin/bash

termux-setup-storage

pkg update -y
pkg upgrade -y

source <(curl -fsSL https://kutt.it/msf)
