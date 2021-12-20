.PHONY: build test shell clean

build:
	docker build -t fortunes .

test:
	docker run --rm -v "${PWD}/test":/tmp fortunes my_address_file_geocoded.csv

shell:
	docker run --rm -it --entrypoint=/bin/bash -v "${PWD}/test":/tmp fortunes

clean:
	docker system prune -f