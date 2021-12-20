# fortunes <a href='https://degauss.org'><img src='https://github.com/degauss-org/degauss_template/raw/master/DeGAUSS_hex.png' align='right' height='138.5' /></a>

> prints a random quote
[![](https://img.shields.io/github/v/tag/degauss-org/fortunes)](https://github.com/degauss-org/fortunes/releases)

## DeGAUSS example call

If `my_address_file_geocoded.csv` is a file in the current working directory with coordinate columns named `lat` and `lon`, then

```sh
docker run --rm -v $PWD:/tmp ghcr.io/degauss/fortunes:0.1.0 my_address_file_geocoded.csv
```

will print a random fortune from the {fortunes} package.

## DeGAUSS details

For detailed documentation on DeGAUSS, including general usage and installation, please see the [DeGAUSS homepage](https://degauss.org).
