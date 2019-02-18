#!usr/bin/bash

#directory containing the google takeout .json file (change me!)
dir=LocDir

#location of the google takeout .json file (change me!)
RawJSON=LocDir/location_history_02142019.json


filteredJSON=$dir/filtered_locations_.json

echo 'Filtering location history archive...'

`cat $RawJSON |jq "[.locations[] | {latitudeE7, longitudeE7, timestampMs}]" > $filteredJSON`

echo 'Converting archive to csv...'

python3 csvParser.py $filteredJSON $dir

echo 'Making your movie, this will take a long time...'

#select the resoltuion (choose between Ultra Low Res: '05k', Low Res: '15k', and Full Res: 'Full')
Resolution=05k

python3 coloranim.py $dir/FilteredLocations$Resolution.csv $dir/MyTravels_$Resolution.mp4