APP_VERSION=v0.0.1

PACKAGE_LIST = engine/presharedkey/ engine/oidc/ engine/jwt/ middleware/

.PHONY: tag
tag:
	git tag -f $(APP_VERSION) && $(foreach item, $(PACKAGE_LIST), git tag -f $(item)$(APP_VERSION) && ) git push --tags --force
