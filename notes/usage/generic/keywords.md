# Keywords Element

## Example

```

 <story>
  ...
  <keywords>
   <generic>bank robbery</generic>
   <group collection='banking'>
    <generic>bank</generic>
    <generic>bank teller</generic>
    <generic>vault</generic>
    <properNoun><entity acronym='FDIC'>Federal Deposit Insurance Corporation</entity></properNoun>
   </group>
   <group>
    <generic>cat burglar</generic>
    <generic>lockpicking</generic>
    <properNoun><art type='movie' year='1987'>Burglar</art></properNoun>
   </group>
   <group>
    <properNoun><place><ci>Phoenix</ci><st abbrv='AZ'>Arizona</st></place></properNoun>
   </group>
   <group>
    <generic>car chase</generic>
    <properNoun><thing>Ford Mustang</thing></properNoun>
   </group>
   <generic>ballet class</generic>
   <generic collection='banking'>currency</generic>
   <group relevance='4'>
    <generic>getaway</generic>
    <genric>cruise ship</generic>
    <properNoun><place><ci>Canciún</ci><cn abbrv='MX'>Mexico</cn></place></properNoun>
   </group>
  </keywords>
  ...
 </story>

```

## Description

The keywords element provides a struture for the important words that help describe a story.  The structure
focuses on the words associated with the story, without being tied to telling the narrative of the story.
It can be read by humans, but it can also be processed by computer code.  It could provide insight into
a story, and it can also be used to compare one story against another.

The keywords element supports the encoding of generic words or proper nouns, falling under the
noun categories of person, place, thing, entity, group, event, or a piece of art.  Each entry
can contain a relevance score, or can be tied to other similar keywords in a collection.

## Element Breakdown

### The `keywords` element

The `<keywords>` element is the root element of the structure.  It should contain at least one
`<generic>` element, `<properNoun>` element, or `<group>` element.

### The `group` element

The `<group>` element can be used to associate one or more `<generic>` or `<properNoun>` elements
together.  Elements in a group are not changed or affected by being in a group, unless
an attribute is added to the `<group>` element, which would be inherited by the child elements.

Groups cannot be nested, so a `<group>` element cannot be inside another `<group>` element.

### The `generic` element

The `<generic>` element represents a single keyword.

### The `properNoun` keyword

The `<properNoun>` keyword contains a proper noun structure, which can be a person, place, or
thing.  See the Proper Noun section below for more information.

## Common Attributes

Almost all of the keywords elements support the following attributes.

### The `xml:lang` attribute

The `xml:lang` attribute identifies the language of the keyword

### The `collection` attribute

The `collection` attribute identifies a logical group for a keyword to be assigned to.

### The `relevance` attribute

The `relevance` attribute is a scoring value for the keyword showing how important
it is to the story.  A value of 1 is the highest value, and 5 is the lowest.

## Proper Noun Elements

### The `person` element

```
 <properNoun><person><gn>George</gn><fn>Glass</fn></person></properNoun>
```

The `<person>` element supports the encoding of a human name, allowing
for the given name, middle name, and family name to be specified.

### The `place` element

```
 <properNoun><place><name>Echo Park</name><ci>Los Angeles</ci><st abbrv='CA'>California</st></place></properNoun>
```

The `<place>` element is a structured representation of a location, supporting
different levels of geographic specifity.  It can represent sparse locations like
entire countries, or specific locations like cities.

| Element | Location |
|---------|----------|
| `<name>` | Named Location |
| `<ci>`  | City     |
| `<co>`  | County   |
| `<st>`  | State    |
| `<pr>`  | Province |
| `<cn>`  | Country  |
| `<planet>` | Planet |
| `<generic>` | Unstructured Location |

The `<st>`, `<pr>`, and `<cn>` elements support the `abbrv` attribute to
encode abbreviations in location names.

### The `thing` element

```
 <properNoun><thing>Apple Macintosh Plus</thing></properNoun>
```

The `<thing>` element identifies a specific object by its given name.  If
a keyword like **computer** or **running shoe** isn't specific enough
to describe the word, the `<thing>` element should be used with
the exact name of the noun.

### The `entity` element

```
 <properNoun><entity>Writers Guild of America</entity></properNoun>
```

The `<entity>` element can be used to identify a corporation, agency,
or organization that has a collective identity similar to a person
(but is not a person).

The element supports an `acronym` attribute in case the name of
the entity has a common acronum.

### The `group` element

```
 <properNoun><group>The Chicks</group></properNoun>
```

The `<group>` element is similar to the `<entity>` element, but
is used to represent smaller associations.  A group could
most commonly represent a "music group", but it could
be other groups representing individuals working together

### The `event` element

```
 <properNoun><event>Halloween</event></properNoun>
 <properNoun><event>The War of 1812</event></properNoun>
 <properNoun><event>Prohibition</event></properNoun>
```

The `<event>` element represents either a historical event, or
an instance of an event occurence, or clearly defined era
of history.

### The `art` element

```
 <properNoun><art type='song'>Mamma Mia</art></properNoun>
 <properNoun><art type='movie' year='2008'>Mamma Mia!</art></properNoun>
```

The `<art>` element identifies a specific piece of art.  It can
have an optional `type` attribute which clarifies what the
art is, and an optional `year` attribute which identifies when it
was created.

The `type` attribute can support the following values.

* story
* book
* bookSeries
* comicBook
* comicBookSeries
* play
* movie
* televisionShow
* song
* album
* poem
* statue
* sculpture
* painting
* videoGame


