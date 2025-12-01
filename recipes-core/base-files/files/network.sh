# Apply the saved rules manually
IPV4_RULES='/etc/iptables/iptables_v4.rules'
IPV4_RULES_FLAG='/tmp/var/iptables_rules'

if [ -f $IPV4_RULES ] && [ ! -f $IPV4_RULES_FLAG ]; then
    iptables-restore < /etc/iptables/iptables_v4.rules
    if [ $? -eq 0 ]; then
        echo "iptables rules is updated"
        mkdir -p /tmp/var/
        touch $IPV4_RULES_FLAG
    else
        echo "iptables rules update is failed"
    fi
fi
