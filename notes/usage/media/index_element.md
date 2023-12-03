# Index Element (Movies)

## Example

```
<index>
 <dvdIndex ref='dvd01'>
  <title>
   <content ref='movie' group='main'/>
  </title>
  <title>
   <content ref='movie2' group='main'/>
  </title>
  <title>
   <content ref='featurette' group='supplemental'/>
  </title>
 </dvdInndex>
<index>
```

## Description

The `<index>` is an optional element useful for cases when a physical piece of media contains more than a single movie
or artwork, by mapping out a simple layout describing locations of content on media.  For most cases, when a piece of
media contains only a single work of art; the element is unnecessary because the index mapping can be inferred.

## Mapping: Many To Many

If a DVD case contains a single disc, which in turn contains a single movie, then the mapping isn't necessary.

However, a lot of products contain multiple discs, most commonly Blu-Rays that come bundled with a DVD version of
the same movie, or an UltraHD that comes bundled with a Blu-Ray of the same movie.  This is ususally done to
encourage consumers to purchase the higher quality product, even if they may not have the
required media player that can handle it.

Or there could be multiple movies laid out on the same disc to appeal to a wider audience, such as a box set with
multiple action movies that may not have been able to sell when they were bundled individually.

The `<index>` element is designed to handle any of these use cases.

* A single movie laid out on multiple discs
* A single disc containing multiple movies
* Multiple discs containing multiple movies

In any of these cases, the physical media elements must contain a unique `id` attribute, and the content
elements must also contain a unique `id` attribute, in order for the child elements under `<index>` to properly map out
the relationship.

## Placement

If used, the `<index>` element appears once immediately after the `<medium>` element, and it requires at least one child
element in order to be valid.

## Element Breakdown

### The `<index>` element

The `<index>` element contains one or more child elements used to map out a content relationship on a physical piece of media.

The child element options are:

* `<dvdIndex>`
* `<blurayIndex>`
* `<bluray3dIndex>`
* `<ultrahdIndex>`
* `<hddvdIndex>`

Each one of those element contains a `ref` attribute which contains a value relating to a media
element under `medium/productSpecs/inventory/`

### The `<blurayIndex>`, `<bluray3dInex>`, and `<ultrahdIndex>` elements

All 3 of these elements are functionally identical, but used to correlate directly to the related media in the product
inventory (ie, a `<blurayIndex>` should relate to a corresponding `<bluray>` element).

Each element contains a `<title>` element which references a data structure on the disk used for a single video stream.

### The `<dvdIndex>` element

The `<dvdIndex>` element is functionally identical to the `blurayIndex`, and `ultrahdIndex` elements, except
it can account for content on both sides of the physical disk.

The child elements for `dvdIndex` can either be one or more `title` elements, or exactly two `side` elements, which are
used to denote both sides of the disc, denoted as either side `A` or `B`.  If `side` elements are used, they can contain
one or more title elements.

```
<index>
 <dvdIndex>
  <side labal='A'>
   <title>
    <content ref='movie1'/>
   </title>
  </side>
  <side label='B'>
   <title>
    <content ref='movie2'/>
    <content ref='movie3'/>
   </title>
  </side>
 </dvdIndex>
</index>
```

### The `<hddvdIndex>` element

The `<hddvdIndex>` is nearly identical to the `<dvdIndex>` element, except it supports an additional use case.

Some HD-DVDs are dual sided, but the second side is usable as a standard DVD, and is
playable in normal DVD players.  This was an effort to ease adoption of the HD-DVD format by
allowing considers to purchase media they could use even if they didn't have the updated player.

The `mode` attribute to the `side` element is optional.

```
<index>
 <hddvdIndex>
  <side labal='A' mode='hddvd'>
   <title>
    <content ref='movie1'/>
   </title>
  </side>
  <side label='B' mode='dvd'>
   <title>
    <content ref='movie1'/>
   </title>
  </side>
 </hddvdIndex>
</index>
```

### The `<title>` element

The `<title>` element can contain one or more content records relating to a matching `<content>` element in the file.

### The `<content>` element.

The `<content>` element contains a `ref` attribute that maps to a corresponding `content` child element `id` attribute
in the same file.

The `content` element also has an optional `group` attribute that can take two possible values, `main`
or `supplemental` which describe whether the content is the primary content of the product
(like the movie), or supplemental content (like a featurette).

Right now the `content` element can contain one possible child element, `<partialRange>`.

### The `<partialRange>` element

The `<partialRange>` element is used for rare cases when a film has to be split across two discs.  It contains a `from`
attribute and a `to` attribute, which both contain a duration value.  A very long movie that was split across two
discs would look similar to this.

```
<index>
 <dvdIndex ref='dvd01'>
   <title>
    <content ref='movie1'>
     <partialRange from='PT0S' to='PT1H45M15S'/>
    </content>
   </title>
 </dvdIndex>
 <dvdIndex ref='dvd02'>
  <title>
   <content ref='movie1'>
    <partialRange from='PT1H45M16S' to 'PT2H57M30S'/>
   </content>
  </title>
 </dvdIndex>
</index>
```

## Case Studies

### Case Study: UltraHD and BluRay Bundle

Carlos purchases a new movie on UltraHD that includes a copy of the same movie on a second Blu-Ray disc.

When entering the record, the `medium` element portion looks like this:

```
 <medium>
  <release>
   <type><ultrahd/></type>
  </release>
  <productSpecs>
   <inventory>
    <steelbook>
     <ultrahd id='udh01'/>
     <bluray id='br01'/>
    </steelbook>
   </inventory>
  </productSpecs>
 </medium>
```

The `contents` element looks like this:

```
 <contents>
  <movie id='thesleepyhacker' xmlns='http://vectortron.com/xml/media/movie'>
   <title>The Sleepy Hacker</title>
  </movie>
 </contents>
```

And the `index` element (which goes in between `medium` and `contents`) would look like this:

```
 <index>
  <ultrahdIndex ref='udh01'>
   <title>
    <content ref='thesleepyhacker' group='main'/>
   </title>
  </ultrahdIndex>
  <blurayIndex ref='bd01'>
   <title>
    <content ref='thesleepyhacker' group='main'/>
   </title>
  </blurayIndex>
 </index>
```


### Case Study: Multiple Movies Per Disc

Frank purchased a DVD at a gas station that contained four western movies.  Here is a portion of the data entered.

```
 <medium>
  <release>
   <type><dvd/></type>
  </release>
  <productSpecs>
   <inventory>
    <envelope>
     <dvd id='dvd01'/>
    </envlope>
   </inventory>
  </productSpecs>
 </medium>
 <index>
  <dvdIndex ref='dvd01'>
   <title>
    <content ref='tenguns' group='main'/>
   </title>
   <title>
    <content ref='tuscon' group='main'/>
   </title>
   <title>
    <content ref='lament' group='main'/>
   </title>
   <title>
    <content ref='nachadoches' group='main'/>
   </title>
  </dvdIndex>
 </index>
 <contents>
  <movie id='tenguns' xmlns='http://vectortron.com/xml/media/movie'>
   <title>Ten Guns A Blazing</title>
    ...
  </movie>
  <movie id='tuscon' xmlns='http://vectortron.com/xml/media/movie'>
   <title>A Very Bad Night In Tuscon</title>
    ...
  </movie>
  <movie id='lament' xmlns='http://vectortron.com/xml/media/movie'>
   <title>Cowboy's Lament</title>
    ...
  </movie>
  <movie id='nachadoches' xmlns='http://vectortron.com/xml/media/movie'>
   <title>Nachadoches, Nacha-dont-ches</title>
    ...
  </movie>
 </contents>
```
