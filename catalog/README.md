# Catalog File

## Introduction


The catalog.xml provides third party applications with a map between local schema definition files
and the schema namespace.


Editors like Microsoft [Visual Studio Code](https://code.visualstudio.com) combined with the 
RedHat [XML](https://marketplace.visualstudio.com/items?itemName=redhat.vscode-xml) extension allow 
VS Code to actively reference the schema when editing XML files.


Libraries like [libxml2](https://gitlab.gnome.org/GNOME/libxml2/-/wikis/home) have command
line tools that also support XSD schema validation with with catalog.xml file.

## Catalog Installation

Review the installing.md file for steps on how to install the files through the make process, or
by installing the files manually.

### Command Line Tools

In your shell environment, set the environmental variable `XML_CATALOG_FILES` for tools like `xmllint`

```
$ export XML_CATALOG_FILES=~/.local/share/xml/catalog.xml
```
