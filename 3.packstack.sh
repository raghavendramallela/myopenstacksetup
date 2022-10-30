# get packstack answerfile (omit "--osron-ovs-bridge-interfaces=br-ex:eth0 " if error with Mitaka  https://bugzilla.redhat.com/show_bug.cgi?id=1316856 )
sudo packstack --default-password=admin \
--os-compute-hosts=$(hostname -i) \
--os-neutron-ml2-mechanism-drivers=openvswitch \
--os-neutron-ml2-tenant-network-types=vxlan \
--os-neutron-ml2-type-drivers=vxlan,flat \
--os-neutron-l2-agent=openvswitch \
--os-neutron-ovs-bridge-mappings=extnet:br-ex \
--os-neutron-ovs-bridge-interfaces=br-ex:eth0 \
--provision-demo=n \
--mariadb-pw=admin \
--keystone-db-passwd=admin \
--keystone-admin-passwd=admin \
--keystone-demo-passwd=admin --glance-db-passwd=admin \
--glance-ks-passwd=admin --cinder-db-passwd=admin \
--cinder-ks-passwd=admin \
--nova-db-passwd=admin \
--nova-ks-passwd=admin \
--os-neutron-ks-password=admin \
--os-neutron-db-password=admin \
--os-neutron-metadata-pw=admin \
--os-swift-ks-passwd=admin \
--os-heat-mysql-password=admin \
--os-heat-ks-passwd=admin \
--os-heat-domain-password=admin \
--ceilometer-ks-passwd=admin \
--os-heat-install=y \
--gen-answer-file=~/answer.txt

# run Packstack using answer file
sudo packstack --answer-file=~/answer.txt
