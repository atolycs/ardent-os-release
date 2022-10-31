PREFIX := /usr/local
SOURCE_FILE := os-release.pre
OS_SELECT := null
.PHONY: install

os-release: $(SOURCE_FILE) 
	sed -e 's/%EDITION_NAME%/$(OS_NAME)/g' -e 's/%EDITION_NAME_SMALL%/$(guile (string-downcase "$(OS_NAME)"))/g' $< >> $@

install: os-release
	install -Dm644 $< $(PREFIX)/lib/$<
