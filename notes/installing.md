# Installation

## Overview

Installation of the schema files and the catalog file make the resources available to multiple users.   It isn't a requirement, but
it makes working with the schema easier.  Installing the schema also preserves a copy of a known working version compared to
a development version that may not be ready for production use.

## Installation

### Installation Paths

For your own personal use, the recommended installation path is `~/.local/share/xml/vtmedia/`.  If you have root access to the host,
and if the schema is going to be used by multiple users, you could also install the files in `/usr/share/xml/vtmedia/`

All of the schema files would located in the `vtmedia/` path, and the `xml/catalog.xml` file would be under the `xml/` path.

The actual installation path doesn't matter, as long as it's referenced in the `catalog.xml` file.

If you're using **xmllint**, you will need to set the `XML_CATALOG_FILES` environmental variable to the path of the file.

If you're using **Visual Studio Code** with the RedHat XML plugin, you will need to set the path of the catalog file in
the `settings.json` file.  The easiest way to edit that file, is to open the command pallette and type in
`Open User Settings (JSON)`

```
{
  "xml.catalogs": [
      "/User/(username)/.local/share/xml/catalog.xml"
  ]
}
```

There may be other settings in the file, make changes to them as you wish.

### Installation From The Makefile

To install the schema, run `make install` from the command line.

```
$ make install
```

The installation path is set in the `DESTDIR` variable in the Makefile, and it can be changed if needed.  If administrative access
is required the `make install` command should be done as the root user.

If there is an existing `catalog.xml` file in the path, the installation will attempt to preserve the file.  If you want to
make manual changes to an existing catalog file you can also use this command:

```
make install-no-catalog
```

### Manual Installation

Manual installation can be acheived with the following commands.

```
export DST=~/.local/share/xml
mkdir -p $DST/vtmedia
cp schemas/*.xsd $DST/vtmedia/
cp catalog/catalog.xml $DST/
```

### Validation After Installation

Assume you have two files:

```
oppenheimer-2023-ultrahd.xml
oppenheimer-2023-movie.xml
```

The first file contains the details on the physical media, the second file contains the details on the movie.  The files can be validated
with `xmllint` using the following command.

If the schema files and catalog are installed in a known path, the files can be validated with these commands.

```
$ export XML_CATALOG_FILES=~/.local/share/xml/catalog.xml
$ xmllint --xinclude --schema http://vectortron.com/xml/media/media oppenheimer-2023-ultrahd.xml
```

The command successfully checks the XML syntax, and confirms that the file adheres to the rules of the schema.  Since
the `catalog.xml` file contains references to the schemas installed locally on the host, no network request is made.


## Non-Installation

If you don't want to install the schema, it's possible to still validate using the files in the repository.

### Validation Without Installation

Assume you have two files from the previous example:

```
oppenheimer-2023-ultrahd.xml
oppenheimer-2023-movie.xml
```

The following command will perform the same validation operation:

```
$ xmllint --xinclude --path ./vtmedia-schema/schemas --schema media-schema.xsd oppenheimer-2023-ultrahd.xml
```

This tests both the correct syntax of the XML and the adherence to the rules of the schema.
