#!/bin/bash
qemu-system-x86_64 -m 512M -drive format=raw,file=build/tmp/deploy/images/tannhauseros-image.qcow2 -nographic -net nic -net user,hostfwd=tcp::9000-:9000