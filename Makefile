SHELL:=/bin/bash

# ---------------------------------------------------------------------------------------------------------------------
# Demo
# ---------------------------------------------------------------------------------------------------------------------
demo-iam-vulnerable:
	sh ./scripts/demo-iam-vulnerable.sh
demo-resource-exposure:
	sh ./scripts/demo-resource-exposure.sh
demo-sadcloud:
	sh ./scripts/demo-sadcloud.sh
demo-terragoat:
	cd terragoat/terraform/aws
	echo "TODO: Let's add Terragoat instructions here"
demo-prowler:
	sh ./scripts/demo-prowler.sh

# ---------------------------------------------------------------------------------------------------------------------
# Environment setup and management
# ---------------------------------------------------------------------------------------------------------------------
install-tf:
	brew install tfenv
	tfenv install 1.0.9
	tfenv use 1.0.9
install-checkov:
	brew install checkov
# ---------------------------------------------------------------------------------------------------------------------
# Git Submodules updates
# This is necessary because we leverage a Microsoft Azure repository as a data source.
# ---------------------------------------------------------------------------------------------------------------------
update-submodule:
	git submodule init
	git submodule update
update-submodule-with-merge:
	git submodule init
	git submodule update --remote --merge

# ---------------------------------------------------------------------------------------------------------------------
# Scanning
# ---------------------------------------------------------------------------------------------------------------------
checkov:
	checkov -d terragoat/terraform/aws --config .checkov-filter-noise.yml
checkov-enable-all:
	checkov -d terragoat/terraform/aws --config .checkov-enable-all.yml
checkov-simple-filter:
	checkov -d checkov-simple --config .checkov-filter-noise.yml
checkov-simple-enable-all:
	checkov -d checkov-simple --config .checkov-enable-all.yml
# ---------------------------------------------------------------------------------------------------------------------
# Miscellaneous development
# ---------------------------------------------------------------------------------------------------------------------
count-loc:
	echo "If you don't have tokei installed, you can install it with 'brew install tokei'"
	echo "Website: https://github.com/XAMPPRocky/tokei#installation'"
	tokei ./*
github-actions-test:
	act -l
	# Run the CI job
	act -j ci
# ---------------------------------------------------------------------------------------------------------------------
# Repository specific
# ---------------------------------------------------------------------------------------------------------------------
