# fortunes <a href='https://degauss.org'><img src='https://github.com/degauss-org/degauss_hex_logo/raw/main/PNG/degauss_hex.png' align='right' height='138.5' /></a>

> random quotes

[![](https://img.shields.io/github/v/release/degauss-org/fortunes?color=469FC2&label=version&sort=semver)](https://github.com/degauss-org/fortunes/releases)
[![container build status](https://github.com/degauss-org/fortunes/workflows/build-deploy-release/badge.svg)](https://github.com/degauss-org/fortunes/actions/workflows/build-deploy-release.yaml)

## DeGAUSS example call

If `my_address_file_geocoded.csv` is a file in the current working directory with coordinate columns named `lat` and `lon`, then

```sh
docker run --rm -v $PWD:/tmp ghcr.io/degauss/fortunes:0.1.1 my_address_file_geocoded.csv
```

will print a random quote from the {fortunes} package.

## Optional Argument

A number supplied after the degauss command will change the number of quotes printed, for example:

```sh
docker run --rm -v $PWD:/tmp ghcr.io/degauss/fortunes:0.1.1 my_address_file_geocoded.csv 2
```

will print two random quotes from the {fortunes} package.


## DeGAUSS details

For detailed documentation on DeGAUSS, including general usage and installation, please see the [DeGAUSS homepage](https://degauss.org).
