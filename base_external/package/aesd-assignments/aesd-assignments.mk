
##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

# 1. Removed quotes from VERSION and SITE
AESD_ASSIGNMENTS_VERSION = d2e3986f4913e15ab186b5f576f47546e489ce00
AESD_ASSIGNMENTS_SITE = git@github.com:cu-ecen-aeld/assignments-3-and-later-katzkid.git
AESD_ASSIGNMENTS_SITE_METHOD = git
AESD_ASSIGNMENTS_GIT_SUBMODULES = YES

define AESD_ASSIGNMENTS_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) \
		CC="$(TARGET_CC)" \
		CROSS_COMPILE="$(TARGET_CROSS)" \
		-C $(@D)/finder-app all
endef

define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
	# 2. Create the target directory correctly
	$(INSTALL) -d $(TARGET_DIR)/etc/finder-app/conf/
	$(INSTALL) -d $(TARGET_DIR)/usr/bin/

	# 3. Copy config files (adjusting path to $(@D)/finder-app/conf/ if needed)
	$(INSTALL) -m 0644 $(@D)/finder-app/conf/* $(TARGET_DIR)/etc/finder-app/conf/

	# 4. Install the actual applications and scripts
	$(INSTALL) -m 0755 $(@D)/finder-app/writer $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/finder-app/finder.sh $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/finder-app/finder-test.sh $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/assignment-autotest/test/assignment4/* $(TARGET_DIR)/usr/bin
endef

$(eval $(generic-package))
