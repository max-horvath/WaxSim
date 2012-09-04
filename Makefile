# Build tools
XCODE-PATH=/Applications/Xcode45-DP4.app
TOOLS-PATH=/Contents/Developer/usr/bin/xcodebuild
DERIVED-DATA-PATH=~/Library/Developer/Xcode/DerivedData
XCODEBUILD=$(XCODE-PATH)$(TOOLS-PATH)

# Common parameters
XCODE-PROJECT=-project WaxSim.xcodeproj

# SDK parameters
XCODE-SDK-VERSION=10.7
XCODE-SDK=-sdk macosx$(XCODE-SDK-VERSION)

# Building parameters
XCODE-BUILD-SCHEME=-scheme WaxSim
XCODE-BUILD-PARAMETERS=$(XCODE-PROJECT) $(XCODE-BUILD-SCHEME)

help :
	@echo WaxSim Makefile
	@echo
	@echo \'make build\' Compile app
	@echo \'make install\' Install app to /usr/local/bin/

check-xcodebuild :
ifeq ($(wildcard $(XCODEBUILD)),"")
	@echo Found $(XCODE-PATH).
endif

clean :
	rm -Rfv build
	rm -Rfv $(DERIVED-DATA-PATH)/WaxSim*
	$(XCODEBUILD) $(XCODE-BUILD-PARAMETERS) clean

build :
	$(XCODEBUILD) $(XCODE-BUILD-PARAMETERS) $(XCODE-SDK) build

install : build
	$(XCODEBUILD) install DSTROOT=/

all : help
