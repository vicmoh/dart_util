all: package sure 

m = [AUTO]
git:
	git add -A
	git commit -m '$(m)'
	git push

package:
	cd lib; cd flutter_package_exporter; make FILE='dart_util'

sure:
	cd test; dart test.dart;
