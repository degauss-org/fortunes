#!/usr/local/bin/Rscript

dht::qlibrary(sf)

dht::greeting()

doc <- "
      Usage:
      entrypoint.R <filename>
      "

opt <- docopt::docopt(doc)

## for interactive testing
## opt <- docopt::docopt(doc, args = 'test/my_address_file_geocoded.csv')

message("reading input file...")
d <- dht::read_lat_lon_csv(opt$filename, nest_df = T, sf = T, project_to_crs = 5072)

dht::check_for_column(d$raw_data, "lat", d$raw_data$lat)
dht::check_for_column(d$raw_data, "lon", d$raw_data$lon)

## add code here to calculate geomarkers

fortunes::fortune()

## merge back on .row after unnesting .rows into .row
dht::write_geomarker_file(d = d$d, raw_data = d$raw_data, filename = opt$filename)
