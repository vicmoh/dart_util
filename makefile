all: export sure clean

m = [AUTO]
git: all
	git add -A
	git commit -m '$(m)'
	git push

export:
	cd lib; cd flutter_package_exporter; make FILE='dart_util'

clean:
	cd lib/flutter_package_exporter; make clean;

sure:
	cd test; dart test.dart;
