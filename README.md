#Overview
DCRM installation using a puppet script

e.g. Update /etc/puppet/modules/osnailyfacter/manifest/cluster_simple.pp

In controller section

include dcrm
include dcrm::controller

In compute section

include dcrm
include dcrm::compute
