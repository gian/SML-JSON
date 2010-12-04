all: json-test

json-test: sml-json.sml json-test.sml json-test.mlb
	mlton -output json-test json-test.mlb

tests: json-test
	make -C tests

clean:
	rm -f json-test
	