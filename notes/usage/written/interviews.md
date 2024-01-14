# Interview Element

## Example

```
  <interview xmlns='http://vectortron.com/xml/media/written'>
   <title>Sitting Down With Ethan Tremblay</title>
   <catalog>
    <authors>
     <author><pcn>Not Ethan's Publicist</pcn></author>
    </authors>
   </catalog>
   <details>
    <subjects>
     <subject><gn>Ethan</gn><fn>Tremblay</fn></subject>
    </subjects>
    <date>2015-05-05</date>
    <place><name>Tiny Naylor's</name><ci>Los Angeles</ci><st>California</st></place>
   </details>
   <description>
    <summary>
     A candid interview with Ethan Tremblay.
    </summary>
    <keywords>
     <generic>television actor</generic>
    </keywords>
   </description>
  </interview>

```

## Description

The `<interview>` element describes a written interview.  It is nearly 100% identical to the 
[essay element](essay.md) except it contains an additional element to encode the subject(s) of
the interview.

## Placement

The `<interview>` element is a content element, so it goes into the `<content>` element structure.

## Element Breakdown

### The `<interview>` element

The `<interview>` element can contain these child elements:

* `<title>`
* `<catalog>`
* `<details>`
* `<description>`

### The `<title>` element

The `<title>` element contains the title of the interview.  It is required.

### The `<catalog>` element

The `<catalog>` element contains information on the authorship of the interview.  It can
support the following child elements.

* `<authors>`
* `<copyright>`


### The `<authors>` element

The `<authors>` element is a list of at least one or more authors.

```
 <authors>
  <author><gn>John</gn><fn>Doe</fn></author>
  <author><gn>Jane</gn><fn>Doe</fn></author>
 </authors>
```

### The `<copyright>` element

```
 <copyright>
  <year>2015</year>
 </copyright>
```

The optional `<copyright>` element contains copyright information, which needs to at least include a `<year>` value, 
but can also hold a value for the `<holders>` of the copyright.

### The `<details>` element

The `<details>` element contains structured data on the interview subject.

```
 <details>
  <subjects>
   <subject><gn>John</gn><fn>Doe</fn></subject>
   <date>2001-01-01</date>
   <place><name>Santa Monica Pier</name><ci>Santa Monica</ci><st>California</st></place>
  </subjects>
 </details>
```

### The `<description>` element

```
 <description>
  <summary>
   Some words go here.
  </summary>
  <keywords>
   <group>
    <generic>race car</generic>
    <generic>city bus</generic>
   </group>
   <properNoun><person><gn>Abraham</gn><fn>Lincoln</fn></person></properNoun>
   <properNoun><place><ci>Philadelphia</ci><st abbrv='PA'>Pennsylvania</st></place></properNoun>
  </keywords>
 </description>
```

The `<description>` element is an optional element that can provide either a summary of the interview, a list of keywords
for the interview, or both.


## See Also

* [essay](essay.md)

