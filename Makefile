## The Makefile includes instructions lint tests
# Dockerfile should pass hadolint

lint:
	# See local hadolint install instructions:   https://github.com/hadolint/hadolint
	# This is linter for Dockerfiles
	hadolint build/Dockerfile

all: lint
