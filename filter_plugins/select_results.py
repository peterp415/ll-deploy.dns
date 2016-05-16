#
# Custom filter functions to give us nice reports on registered results
# of remote command runs.
#
# The filter select_results takes a key=value list in the form
#   display-name=attribute-name
# to select attribute names in a registered variable and lists
# their values with the display names.
# For example:
#
# - name: Check zone data digest
#   shell: |
#     host -l {{ item }} localhost|md5sum
#   register: zone_digest
#   with_items: '{{ master_zones }}'
#   changed_when: False
#
# - name: Digest results report
#   debug: var=zone_digest.results|select_results(zone='item',sum='stdout')


def select_results(results_list, **attrs):
    '''
    Take a results list of hashes and generate a list of strings showing
    the specified key,value pairs from each hash
    '''
    ret = []
    for i in results_list:
        s = ""
        for key, val in attrs.items():
            s += '%s: %s  ' % (str(key), i[val])
        ret.append(s)
    return ret


class FilterModule(object):
    def filters(self):
        return {
            'select_results': select_results,
        }
