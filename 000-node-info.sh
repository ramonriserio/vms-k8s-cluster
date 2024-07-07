#!/bin/bash

echo "Interfaces de Rede:"
echo "---------------------"

# Lista todas as interfaces
for interface in $(ip link | awk -F: '$0 !~ "lo|vir|wl|^[^0-9]"{print $2}' | sed 's/ //g'); do
    echo "Interface: $interface"
    echo "  Endereço IP: $(ip addr show dev $interface | grep -oP 'inet \K[\d.]+')"
    echo "  Endereço MAC: $(ip link show $interface | awk '/ether/ {print $2}')"
done

# Exibe o product_uuid
echo ""
echo "Product UUID:"
echo "--------------"
sudo cat /sys/class/dmi/id/product_uuid