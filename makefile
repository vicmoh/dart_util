EXPORT_FILE=dart_util

# Export and test the program.
all: export sure clean

# Git add, commit, and push.
git: all format
	git add -A
	git commit -m '$(m)'
	git push

# Format core.
format:
	flutter format ./lib/src/

# Create an export file.
export:
	cd lib; cd flutter_package_exporter; make FILE='$(EXPORT_FILE)'

# Run test harsness.
sure: 
	dart ./test/test.dart;

# Clean the python caches.
clean:
	cd lib/flutter_package_exporter; make clean;

# Install dependencies.
install:  
	git pull --recurse-submodule
	git submodule update --recursive --remote

# Create a new version branch.
new:
	git branch $(version); git checkout $(version); git push --set-upstream origin $(version); git checkout master;
