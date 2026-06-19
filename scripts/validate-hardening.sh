#!/bin/bash

# =====================================================
# validate-hardening.sh
# Linux Hardening Lab
#
# Performs read-only validation of the hardening controls
# implemented during the laboratory.
# =====================================================

echo "===== SSH ====="
systemctl status ssh --no-pager | head -n 5

echo
echo "===== UFW ====="
ufw status verbose

echo
echo "===== Fail2Ban ====="
fail2ban-client status

echo
echo "===== Journald ====="
systemctl status systemd-journald --no-pager | head -n 5