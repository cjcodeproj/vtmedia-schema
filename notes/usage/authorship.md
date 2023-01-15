# Authorship Records

## Exmaple

```
<?xml version='1.0' encoding='us-ascii'?>
<authorshipRecord xmlns="http://vectortron.com/xml/media/meta/authorship">
 <title>Record for 'Interstellar'</title>
 <catalog>
 <id>interstellar-1</id>
 <authors>
   <author>
    <name>Alice</name>
    <email>alice@example.com</email>
   </author>
  </authors>
  <license>
   <code type='spdx'>SPDX-License-Identifier: CC-BY-SA-4.0</code>
  </license>
 </catalog>
 <summmary>
  <lang>en-US</lang>
  <abstract>
    Movie record for the film 'Interstellar', with an emphasis
    on concepts regarding physics and space travel.
  </abstract>
 </summary>
 <changelog>
  <change>
   <timestamp>2023-91-13T04:00:00</timestamp>
   <ticket href='https://example.com/tickets/72347'>72347</ticket>
   <authors>
    <author>
     <name>Bob</name>
    </author>
   </authors>
   <notes>
     Corrected actor spelling mistake.
   </notes>
  </change>
  <creation>
   <date>2023-01-11</date>
   <authors>
    <author>
     <name>Alice</name>
     <email>alice@example.com</email>
    </author>
   </authors>
  </creation>
 </changelog>
</authorshipRecord>
```

## Description

The authorshipRecord is an optional element that provides background 
information on the XML file itself, including author identity, 
a summary abstract, and a change record to track revisions.

It allows multiple users to contribute data in a repository with 
an internal mechanism to track work 

It allows multiple users to contribute to a repository even 
if the chosen platform of the repository doesn't support features 
like change tracking, or file ownership attributes.

It also provides a platform neutral layer to track the same
information; so if a file migrates from one repository to
another, the information is still intact.

## Placement

The `<authorshipRecord>` element can appear immediately after the `<media>`
element.

## Element Breakdown

### The `title` element

The `<title>` element contains the title of the record, which could 
contain the name of the work of art, but it isn't a requirement.  If the
user was detailing the Alfred Hitchcock Collection, the title could 
generically reflect murder mysteries, espionage, thrillers, and so on.

### The `catalog` element

The `<catalog>` element contains the record identification value, the 
author information, and license information for the record.   It is 
the primary source of information on who created the data, and how it
can be used.

#### The `id` element

The `<id>` element can hold a single string value, which is intended to 
be a unique identifier for the record.  It is intended that no 
repository should ever have duplicate `id` values in the 
`authorshipRecord` element.  An easy way to guarauntee uniqueness 
is to generate a unique identifier based on a domain name that 
the author may own.

#### The `authors` element

The `authors` element contains one or more `author` elements to
track the owner of a record, which could legitimately be one
or more people.

#### The `author` element

The `<author>` element contains a user's name, and optionally
their email address, one or more URLs to pages owned by the
author, and a fingerprint value suitable for identifying a
public cryptography key.

#### The `license` element

The `<license>` element contains information on how the 
record can be used.  Users can specify a license through 
either the `<code>` element which is used for license 
identifiers that can be identified by a software parser, 
or a `<notice>` element which has an entire license spelled out.

### The `summary` element

The `<summary>` element provides a synopsis of the overall record.
It has an optional `<lang>` element which identifies the language
used for the records, and an `<abstract>` record which provides the
text of the synopsis.

### The `changelog` element.

The optional `<changelog>` element will contain one or more 
`<change>` elements, or a `<creation>` with one or more 
optional `<change>` elements.

The optional `<changelog>` element will contain one or 
more `<change>` elements, and or a single `<creation>` 
element; the former element identifies routine changes, 
and the later element reflects the creation of the record.

The records are organized in revese chronological sequence, 
so new change records will always appear at the top; but the
schema doesn't enforce that, and code implementors should not
expect that to always be the case.

#### The `change` or `creation` element

Both of these elements are 100% identical in structure; however 
the schema mandates that a `creation` element is only used once, 
while a `change` element can appear multiple times.

Each element contains either a `<date>` or `<timestamp>` record
which contains an ISO date value, or ISO timestamp value 
respectively.  Following that is an optional a `<ticket>` element, 
which holds a reference to an external ticketing system 
like Jira, Bugtraq, or Remedy if those systems are used to
track record changes.  It can store a ticket number, and 
an optional hyperlink attribute to the ticketing system.

It contains an `<authors>` element, which is identical to 
the same element used inside the `<catalog>` element.  Finally, 
it contains an optional `<notes>` element which holds a summary
of the change that was made.

## Case Studies

### Case Study: Repository Contributions

Bob has written several records on movies involving crime, and 
keeps all of his files in a Mercurial repository, so he can share 
the updates of the repository using a single command (hg push), 
as long as they are also using Mercurial.

Chad has written several movie records, but has no focus on 
particular likes or interests; he just catalogs everything that
he happens to have a DVD of.

Eve is building a repository of movies with a focus on Val Kilmer, 
but she only needs a flat filesystem with no backend repository
software to track changes.  Bob gives Eve the files he has 
created for "Heat" and "Kiss Kiss Bang Bang".
Chad helpfully contributes by giving her files on "Red Planet" 
and "Batman Forever".  Chad and Bob have each created a 
record for "Tombstone", but Eve decides to use Bob's version.

Since Bob and Chad used `<authorshipRecord>` element, so 
Eve can identify who originally authored the data in her repository.  
If she makes changes down the road, she can add change records to
the changelog to reflect any revisions she makes.

### Case Study: Dual Reviewers

Both Walter and Wendy are reviewers for movies.  In most cases, they 
are sent preview screenings of the same movie, and they each review it
independently, but they also compare and contrast their reviews.

Each reviewer generates a media file, based on both published 
information, and general thoughts on how they perceived the movie.  

The records they make are for their own personal use, but they are both capable 
of comparing the records between themselves to see if their insights are 
identical.

### Case Study: Language Versions

David wants to generate records for several movies, but would like the records to be 
in Spanish, since it's his first language.  The movie collection consists of mostly
American films, and some of them already have published records; but there are no Spanish
translations of the data.

David generates the files, specifying the `es` language value in the `<lang>` 
element.  All of the other data regarding the movie, such as title, plot description, 
and keywords are all written out in spanish.

### Case Study: Anonymous Contributions

Olivia has built a data repository based on a small, rare movie library.  She wants to 
contribute some data, because the titles are hard to find information on.  She doesn't 
care about authorship or copyright; she just wants the information in the public domain.

It's possible to skip the `<authors>` element under the `<catalog>` element, but 
the `<id>` element must be present, so there is still a way to uniquely identify the
record.  The value for the `<id>` element could then be some unique string that has 
no identifiable characteristics.  There should be a `<license>` element under
the `<catalog>` element that specifies the work is in the public domain.

```
 <catalog>
  <id>P9S8zFIfg1rIYpuiFbHAWIhI85LaGQwbOhnkFE</id>
  <license>
   <code type='spdx'>SPDX-License-Identifier: CC-PDDC</code>
  </license>
 </catalog>
```


