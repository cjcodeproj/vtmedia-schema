#
# Makefile
# 

#    Copyright 2024, Chris Josephes
#
#    This work is licensed under the Creative Commons Attribution-ShareAlike
#    4.0 International License.
#
#    To view a copy of this license, visit
#    http://creativecommons.org/licenses/by-sa/4.0/ or
#    send a letter to
#    Creative Commons
#    PO Box 1866
#    Mountain View, CA 94042, USA.
#

#
# DESTDIR should be set to the location for installation of the schema
#
#

DESTDIR= $(HOME)/.local/share/xml/

#
# Nothing below this line should need to change
#

SD= schemas/
MAINSCHEMA= $(SD)/media-schema.xsd

FILES= $(SD)/media-schema.xsd \
	$(SD)/vtm-content-all.xsd \
	$(SD)/vtm-content-audio.xsd \
	$(SD)/vtm-content-movie.xsd \
	$(SD)/vtm-content-test.xsd \
	$(SD)/vtm-content-written.xsd \
	$(SD)/vtm-meta-authorship.xsd \
	$(SD)/vtm-mod-all-catalog.xsd \
	$(SD)/vtm-mod-all-classification.xsd \
	$(SD)/vtm-mod-audio-catalog.xsd \
	$(SD)/vtm-mod-audio-classification.xsd \
	$(SD)/vtm-mod-audio-elements.xsd \
	$(SD)/vtm-mod-audio-elements-song.xsd \
	$(SD)/vtm-mod-audio-technical.xsd \
	$(SD)/vtm-mod-generic-crew-types.xsd \
	$(SD)/vtm-mod-generic-pnouns-keywords.xsd \
	$(SD)/vtm-mod-generic-story.xsd \
	$(SD)/vtm-mod-generic-types.xsd \
	$(SD)/vtm-mod-index-audio.xsd \
	$(SD)/vtm-mod-index-video.xsd \
	$(SD)/vtm-mod-index.xsd \
	$(SD)/vtm-mod-library.xsd \
	$(SD)/vtm-mod-medium.xsd \
	$(SD)/vtm-mod-medium-release.xsd \
	$(SD)/vtm-mod-medium-productid.xsd \
	$(SD)/vtm-mod-medium-pspecs.xsd \
	$(SD)/vtm-mod-visual-classification.xsd \
	$(SD)/vtm-mod-visual-crew-roles.xsd \
	$(SD)/vtm-mod-visual-crew-writers.xsd \
	$(SD)/vtm-mod-visual-crew.xsd \
	$(SD)/vtm-mod-visual-story.xsd \
	$(SD)/vtm-mod-visual-technical.xsd \


all: $(MAINSCHEMA) $(SD)/xml.xsd $(SD)/xlink.xsd

$(SD)/xml.xsd:
	curl https://www.w3.org/2009/01/xml.xsd > $(SD)/xml.xsd

$(SD)/xlink.xsd:
	curl https://www.w3.org/1999/xlink.xsd | \
	sed -e 's/schemaLocation="http:\/\/www.w3.org\/2001\//schemaLocation="/' > \
	$(SD)/xlink.xsd

download: $(SD)/xlink.xsd $(SD)/xml.xsd

test-schema-files: $(FILES)
	for file in $^; do \
		xmllint --noout $${file}; \
	done

test-schema-valid:
	xmllint --noout --schema http://www.w3.org/2001/XMLSchema.xsd $(MAINSCHEMA)

test: test-schema-files test-schema-valid

install: $(FILES) $(SD)/xlink.xsd $(SD)/xml.xsd
	echo $(DESTDIR)
	mkdir -p $(DESTDIR)
	mkdir -p $(DESTDIR)/vtmedia
	for file in $^; do \
		install -C -m 0644 $${file} $(DESTDIR)/vtmedia/; \
	done
	install -C -m 0644 $(SD)/xlink.xsd $(DESTDIR)/vtmedia
	install -C -m 0644 $(SD)/xml.xsd $(DESTDIR)/vtmedia
	install -C --backup=numbered -m 0644 catalog/catalog.xml $(DESTDIR)/

install-no-catalog: $(FILES)
	echo $(DESTDIR)
	mkdir -p $(DESTDIR)
	mkdir -p $(DESTDIR)/vtmedia
	for file in $^; do \
		install -C -m 0644 $${file} $(DESTDIR)/vtmedia/; \
	done

clean:
	rm $(SD)/xml.xsd
	rm $(SD)/xlink.xsd
