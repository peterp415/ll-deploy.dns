from easyzone import easyzone
from os import listdir
from os.path import isfile, join
import time

#Run other script to append static.* zones to the end of db.* zones

mergedZonesPath = "./mergedzones/"

allZones = [f for f in listdir(mergedZonesPath) if isfile(join(mergedZonesPath, f))]

#import each zone then update serial and rname
for currentZoneFile in allZones:
    ez = easyzone.zone_from_file(currentZoneFile, mergedZonesPath+currentZoneFile)
    ez.root.soa.serial = time.strftime('%Y%m%d00')
    ez.root.soa.rname = currentZoneFile
    ez.save()
