# Catalog File

## Introduction


The catalog.xml provides third party applications with a map between local schema definition files
and the schema namespace.


Editors like Microsoft [Visual Studio Code](https://code.visualstudio.com) combined with the 
RedHat [XML](https://marketplace.visualstudio.com/items?itemName=redhat.vscode-xml) extension allow 
VS Code to actively reference the schema when editing XML files.

## Use

To use the catalog feature, find a directory on your host to copy all of the schema files and the catalog.xml file.

Next, install the XML extension in Visual Studio Code, and edit the settings for the XML extension.
Under `XML: Catalogs`, add an entry pointing to the exact path of the catalog.xml file.

## Testing

Test the extension by looking at any of the example files, or the template files in the schema.  Missing
elements, invalid tags, or bad values will be flagged and a syntax hightlighting popup will identify what
needs to be fixed.
