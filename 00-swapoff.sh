#!/bin/bash

# Verifica se o swap está ativo
if [ $(swapon --show) ]; then
    echo "Swap está ativo. Desativando..."
    sudo swapoff -a
else
    echo "Swap não está ativo."
fi

# Mostra o estado atual do swap
free -gh

# Comenta a linha do swap no arquivo /etc/fstab
if [ -f "/etc/fstab" ]; then
    # Comenta a linha referete ao swap
    sudo sed -i '/swap/ s/^/#/' /etc/fstab
    
    echo "Linha do swap comentada no arquivo /etc/fstab"
else
    echo "O arquivo /etc/fstab não foi encontrado."
fi