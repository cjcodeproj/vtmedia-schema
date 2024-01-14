# Essay Element

## Example

```
  <essay xmlns='http://vectortron.com/xml/media/written'>
   <title>The Superhero Movie That Changed Superhero Movies</title>
   <catalog>
    <authors>
     <author><pcn>Dale, The Comic Book Expert</pcn></author>
    </authors>
   </catalog>
   <description>
    <summary>
      A behind the scenes look of the secret meeting between a simple comic book
      company, and a Hollywood behemoth that changed the entertainment industry.
    </summary>
    <keywords>
     <generic>meeting</generic>
     <properNoun><place><ci>Los Angeles</ci><st abbrv='CA'>California</st></place></properNoun>
    </keywords>
   </description>
  </essay>

```

## Description

The `<essay>` element describes a written essay.  In most cases, it will be used to describe essays that are
included with DVDs, albums; but it's not limited to that scope.  Technically, it could describe any essay
(it doesn't even need to be bundled with other media).  Since the element is in a different namespace, it can
be used on its own.  The child elements are easy to understand, and most of the stuctures are identical 
to other media content elements.

Sometimes DVDs or Blu-Rays from certain publishers come with written supplements that provide
background information on a film.  It could be historical, technical, critical review, or almost
anything.  It's usually provided to improve the enjoyment of the product.  The `<essay>` element provides
a mechanism to summarize the written material.

## Placement

The `<essay>` element is a content element, so it goes into the `<content>` element structure.

## Element Breakdown

### The `<essay>` element

The `<essay>` element can contain these child elements:

* `<title>`
* `<catalog>`
* `<description>`

### The `<title>` element

The `<title>` element contains the title of the essay.  It is required.

### The `<catalog>` element

The `<catalog>` element contains information on the authorship of the essay.  It can
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

The `<description>` element is an optional element that can provide either a summary of the essay, a list of keywords
for the essay, or both.


