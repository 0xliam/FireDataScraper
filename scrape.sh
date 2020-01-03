# set timestamp
timestamp=$(echo -n `date "+%Y-%m-%d %H:%M:%S"`)
# get nsw data
curl http://www.rfs.nsw.gov.au/feeds/majorIncidents.json > "/var/www/firedata/nsw/${timestamp}.json"  
# to generate diff
# diff "${timestamp}.json" latest.json > latest_diff.json --report-identical-files  
# symlink with most recent
ln -sf "/var/www/firedata/nsw/${timestamp}.json" /var/www/firedata/nsw/latest.json

## get vic data
curl --compressed 'http://emergency.vic.gov.au/public/osom-geojson.json' > "/var/www/firedata/vic/${timestamp}.json"
# symlink with most recent
ln -sf "/var/www/firedata/vic/${timestamp}.json" /var/www/firedata/vic/latest.json