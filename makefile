EXPORT_FILE=dart_util

# Export and test the program.
all: sure

# Git add, commit, and push.
git: all format
	git add -A
	git commit -m '$(m)'
	git push

# Format core.
format:
	flutter format ./lib/src/

# Run test harsness.
sure: 
	dart ./test/test.dart;

# Install dependencies.
install:  
	git pull --recurse-submodule
	git submodule update --recursive --remote

# Create a new version branch.
new:
	git branch $(version); git checkout $(version); git push --set-upstream origin $(version); git checkout master;
