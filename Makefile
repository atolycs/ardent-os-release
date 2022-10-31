SOURCE_FILE := os-release.pre
PREFIX := /usr/local
OS_SELECT := null
#.PHONY: 

os-release: $(SOURCE_FILE) 
	sed -e 's/%EDITION_NAME%/$(OS_NAME)/g' -e 's/%EDITION_NAME_SMALL%/$(guile (string-downcase "$(OS_NAME)"))/g' $< >> $@

install: os-release
	install -Dm644 $< $(PREFIX)/lib/$<
