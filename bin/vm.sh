#!/bin/bash

qemu-system-aarch64 -machine virt -cpu cortex-a57 -smp 2 -m 4096 \
                        -bios /usr/share/AAVMF/AAVMF_CODE.fd \
                        -netdev user,id=net0,hostfwd=tcp::8022-:22 \
                        -device virtio-net-pci,netdev=net0 \
                        -drive if=virtio,file="../pc.img",format=raw \
                        -device virtio-gpu-pci \
                        -device virtio-keyboard \
                        -device virtio-mouse \
                        -serial mon:stdio