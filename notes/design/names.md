# Personal Names Implementation Notes


## Contents

 * [Introduction](#introduction)
 * [Real Personal Name](#real-personal-name)
   * [Name Components](#name-components)
   * [Preferred Name vs. Real Name](#preferred-name-vs-real-name)
   * [Prefixes or Suffixes](#prefixes-or-suffixes)
 * [Character Name or Identifier](#character-name-or-identifier)
   * [Case Study: Darth Vader](#case-study-darth-vader)
 * [Data Entry Notes](#data-entry-notes)
   * [Real Name Ambiguity](#real-name-ambiguity)

## Introduction

The term personal names refers to proper nouns attributed to indivudual people, such as "Michelle Yeoh", or
"Jamie Lee Curtis".  The names are almost always real people, but they could also be fictional people
from stories or movies.  In the XML schema, real and fictional names are represented under two
different types:

| XMLSchema Type | Explanation |
|------|-------------|
| `PNPersonalNameType` | Name for a real person |
| `CharacterNameType` | Name for a fictional character |

Two differet types are required because there are variations on how real people are represented versus 
fictional people.  Every real person is assumed to have a name; but that isn't the case for
a fictional person.

## Real Personal Name

### Name Components

| Schema Term | Element | Alias |
|-------------|---------|-------|
| Given Name | `<gn>` | First Name, Christian Name |
| Family Name | `<fn>` | Last Name, Surname (usually) |
| Middle Name | `<mn>` | |


Almost everyone has a given name and a family name.  People may have middle names, but that
shouldn't be assumed.  People also have names composed of multiple names, where a given name
can have multiple names in a given order, or family names that have multiple family components.

It shouldn't be assumed that a space within a name or name component indicates a component
split within a name.

### Preferred Names vs. Real Name

Some people will have a preferred name that they wish to go by instead of their real name.  In those cases, 
the preferred name is sufficient enough to identify a person.  Using the real name as well as the 
preferred name is possible, but not required.  The preferred name may be an alternate given name,
or it may be a singular name.

| Schema Term | Element |
|-------------|---------|
| Preferred Complete Name | `<pcn>` |
| Preferred Given Name | `<pgn>` |


| `<pcn>` | `<pgn>` | `<gn>` | `<mn>` | `<fn>` | Rendering | Sort Value |
|-------|-------|------|------|------|-----------|------------|
|       |       | Michael | C. | Hall | Michael C. Hall | hall_michael_c |
| RZA   |       | Robert | F. | Diggs| RZA | rza |
|       | M. Emmet | Michael | Emmet | Walsh | M. Emmet Walsh | walsh_m_emmet |
|       | G. W. | George | William | Bailey | G. W. Bailey | bailey_g_w |
| Cher  |       | Cherilyn | | Sarkisian | Cher | cher |
| Ice Cube |    | O'Shea | | Jackson | Ice Cube | ice_cube |
|       |       | Max | | von Sydow | Max von Sydow | von_sydow_max |
|       | Billy Bob | William Robert | | Thornton | Billy Bob Thornton | thornton_billy_bob |

The `<pcn>` element is used to represent a preferred complete name, whereas the `<pgn>` element 
represents a preferred given name.

### Prefixes Or Suffixes

Some real names will have a suffix, most likely used to identify generational relation, or
in some real names will have a prefix indicating a title of some kind.

| `<prefix>` | `<gn>` | `<mn>` | `<fn>` | `<suffix>` | Rendering | Sort Value |
|----------|------|------|------|--------|-----------|------------|
|          | Robert |    | Downey | Jr.  | Robert Downey Jr. | downey_robert |
|          | Jason |     | Robards | III | Jason Robards III | robards_jason |
|          | Robert |    | Downey | Sr.  | Robert Downey Sr. | downey_robert |
| King     | Henry |     |        | VIII | King Henry VIII | henry |
| President | Abraham |  | Lincoln |     | President Abraham Lincoln | lincoln_abraham |


## Character Personal Name Or Identifier

The schema definition for character names is more complex because character names are
both more flexibile, and more likely to be incomplete.  Many characters in fiction are 
missing last names, missing first names, or don't even have a name at all.  They 
may have the flexibility of having a prefix, a suffix, or a nickname, but there is 
no assumption that the structure of a name will make sense.

In some fictional cases in film, a character may be playing themself, or their 
character's identifier may not even have an individual identifier, because they 
are simply a background character.  Their name may also be followed by an 
identifier that isn't part of their name, but simply helps identify who the 
character was.

Finally, there are situations where multiple actors actually play the same 
character.  Two or more people could be playing a character at different ages, or there
could be an actor portraying the physical aspect of a character while another actor
portrays their voice.

### Case Study: Darth Vader

<table>
<tr>
<th rowspan='2'>Movie</th><th colspan='2'>Actor</th><th colspan='4'>As</th></tr>
<tr>
 <th><code>&lt;gn&gt;</code></th>
 <th><code>&lt;fn&gt;</code></th>
 <th><code>&lt;prefix&gt;</code></th>
 <th><code>&lt;gn&gt;</code></th>
 <th><code>&lt;fn&gt;</code></th>
 <th><code>&lt;aspect&gt;</code></th>
</tr>
<tr>
 <td rowspan='3'>Revenge Of The Sith</td>
 <td rowspan='2'>Hayden</td>
 <td rowspan='2'>Christensen</td>
 <td>&nbsp;</td>
 <td>Anakin</td>
 <td>Skywalker</td>
 <td>&nbsp;</td>
</tr>
<tr>
 <td>Darth</td>
 <td>Vader</td>
 <td>&nbsp;</td>
 <td>body</td>
</tr>
<tr>
 <td>James Earl</td>
 <td>Jones</td>
 <td>Darth</td>
 <td>Vader</td>
 <td>&nbsp;</td>
 <td>voice</td>
</tr>
<tr>
 <td rowspan='3'>Rogue One: A Star Wars Story</td>
 <td>Spencer</td>
 <td>Wilding</td>
 <td>Darth</td>
 <td>Vader</td>
 <td>&nbsp;</td>
 <td>body</td>
</tr>
<tr>
 <td>Daniel</td>
 <td>Naprous</td>
 <td>Darth</td>
 <td>Vader</td>
 <td>&nbsp;</td>
 <td>body</td>
</tr>
<tr>
 <td>James Earl</td>
 <td>Jones</td>
 <td>Darth</td>
 <td>Vader</td>
 <td>&nbsp;</td?>
 <td>voice</td>
</tr>
</table>

Darth Vader is a character portrayed by multiple actors, doing both the physical presence, as well as 
the voice.  The table above shows how he is portrayed in two films, Rogue One, and Revenge Of The
Sith.

The name, "Darth Vader" is a combination of a prefix and a given name, since Darth is referenced as 
a title given to a Sith Lord.  Hayden Christensen portrays the physical aspect of Darth Vader, as
well as the character of Anakin Skywalker.  James Earl Jones provides the voice of Darth Vader in 
both films.  In Rogue One, two different actors have an actor's credit for portraying Vader's body.

```
<role>
 <actor><gn>Hayden</gn><fn>Christensen</fn></actor>
 <character>
  <name><gn>Anakin</gn><fn>Skywalker</fn></name>
  <alias><prefix>Darth</prefix><gn>Vader</gn></name<
 </character>
</role>
<role>
 <actor><gn>James Earl</gn><fn>Jones</fn></actor>
 <character>
  <name><prefix>Darth</prefix><gn>Vader</gn></name>
  <aspect>voice</aspect>
 </character>
</role>
```

```
<role>
 <actor><gn>Spencer</gn><fn>Wilding</fn></actor>
 <character>
  <name><prefix>Darth</prefix><gn>Vader</gn></name>
  <aspect>body</aspect>
 </character>
</role>
<role>
 <actor><gn>Daniel</gn><fn>Naprous</fn></actor>
 <character>
  <name><prefix>Darth</prefix><gn>Vader</gn></name>
  <aspect>body</aspect>
 </character>
</role>
<role>
 <actor><gn>James Earl</gn><fn>Jones</fn></actor>
 <character>
  <name><prefix>Darth</prefix><gn>Vader</gn></name>
  <aspect>voice</aspect>
 </character>
</role>
```


## Data Entry Notes

### Real Name Ambiguity

Sometimes the source data is either incomplete or ambiguous.  For data entry, make a best 
guess effort to put in the most up to date data.  For a real name, the `<gn>` field is 
optional if a `<pgn>` field is present.
