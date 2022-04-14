docker network create datadog-network
curl -O https://minecraft.us-southeast-1.linodeobjects.com/conf.d.tar.gz
tar zxvf conf.d.tar.gz
docker run -d --name datadog-agent -e DD_HOSTNAME="blackdog8.cloud.chrisdemahy.com" -e DD_TAGS="project:blackdog location:frankfurt" -v /root/datadog-logs:/var/log/:rw -v /var/run/docker.sock:/var/run/docker.sock:ro -v /proc/:/host/proc/:ro -v /sys/fs/cgroup/:/host/sys/fs/cgroup:ro -v /etc/os-release:/host/etc/os-release:ro -e DD_API_KEY=8b0f41b3b28248e31e5dee061b7da98e -e DD_SITE="us3.datadoghq.com" -e DD_APM_ENABLED=true -e DD_APM_NON_LOCAL_TRAFFIC=true -e DD_LOGS_ENABLED=true -e DD_LOGS_CONFIG_CONTAINER_COLLECT_ALL=true -v /var/lib/docker/containers:/var/lib/docker/containers:ro -v /var/log:/host/var/log:ro -v /opt/datadog-agent/run:/opt/datadog-agent/run:rw -v /etc/passwd:/etc/passwd:ro -v /root/conf.d/debug.d:/etc/datadog-agent/conf.d/debug.d:ro -v /root/datadog/conf.d/fail2ban.d:/etc/datadog-agent/conf.d/fail2ban.d:ro -v /root/datadog/conf.d/systemd.d:/etc/datadog-agent/conf.d/systemd.d:ro -v /root/datadog/conf.d/prometheus.d:/etc/datadog-agent/conf.d/prometheus.d:ro -v /root/datadog/conf.d/jmx.d:/etc/datadog-agent/conf.d/jmx.d:ro -v /root/datadog/conf.d/auth.d:/etc/datadog-agent/conf.d/auth.d:ro -v /run/systemd/private:/host/run/systemd/private:rw -e DD_PROCESS_AGENT_ENABLED=true -v /sys/kernel/debug:/sys/kernel/debug --security-opt apparmor:unconfined --cap-add=SYS_ADMIN --cap-add=SYS_RESOURCE --cap-add=SYS_PTRACE --cap-add=NET_ADMIN --cap-add=NET_BROADCAST --cap-add=NET_RAW --cap-add=IPC_LOCK --cap-add=CHOWN -e DD_SYSTEM_PROBE_ENABLED=true -v /etc/group:/etc/group:ro -v /:/host/root:ro -e DD_COMPLIANCE_CONFIG_ENABLED=true -e DD_RUNTIME_SECURITY_CONFIG_ENABLED=true -e HOST_ROOT=/host/root -e DD_APPSEC_ENABLED=true --network datadog-network --disable-content-trust --restart=always gcr.io/datadoghq/agent:7
service fail2ban stop
# 