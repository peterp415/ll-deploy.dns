
### lldns host groups are
 - Clusters
   - These are clusters of redundant nameservers with one server that
     is master for any zones owned by the cluster, and zero or more
     slaves. All servers in a cluster serve the same set of zones and
     offer the same zones for slaving. 

 - Groups of clusters
   - These are arbitrary, arbitrarily deeply nested groupings of
     clusters. The graph of these must form a tree. Cycles and
     multiple parents are not allowed.

 - Worlds
   - These serves roots for the DNS graph.

### Variables specific to each group type:
 - Worlds
   - `dns_world`: Name of the DNS world
   
 - Clusters
   - `master`: String. Which server in the cluster is master. Should
     be FQDN.
   - `master_zones`: List of strings. Zones for which this cluster is
     authoritative master, i.e. the zones that get pushed to the
     cluster's master.
   - `offer_zones`: List of lists, whose elements are lists of two
     elements each. Each of these sublists has:
      - List of strings: Zones which are offered for slaving by
        nameservers outside this DNS world
      - List of strings: IP addresses of the nameservers slaving these
        zones

 - Clusters and groups of clusters
   - `slave_zones`: Dictionary. Each entry has
     - Key: String. Source to slave zones from. This may be a cluster or a
       group of clusters.
     - Value: List of strings. Which zones to slave. Each string may
       be a zone, a cluster, or a group of clusters. If a host group
       is specified, all the `master_zones` zones in that host group
       will be slaved from the cluster in the source specifier nearest
       the ultimate authoritative master.
