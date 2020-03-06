m = [AUTO]
git:
	git add -A
	git commit -m '$(m)'
	git push

package:
	cd lib; cd flutter_package_exporter; make FILE='dart_util'

check:
	cd test; dart test.dart;
