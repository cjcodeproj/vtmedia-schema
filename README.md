# Media Schema

An XML XSD schema designed for recording the details of various forms of media,
including movies, television, books, and music.

## Project Goals

The schema is designed with the following goals.


1. The ability to record details on a piece of media, the storage medium, and ownership information.
2. Easy enough to create records without proprietary software dependencies.
3. Simple data entry, validation, and debugging using tools of the end-user's choice.
4. Allow for easy exchange, transfer, or publication of the dataset using existing protocols.
5. The schema should be flexible, easy to comprehend, and extensible both inside and outside the project.
6. Data should be recorded in logical structures, making it suitable for indexing, searching, and comparison operations.


## Installation And Use

Run the `Makefile` to install the schema in your local directory.

```
$ make
$ make install
```

See the [installing.md](notes/installing.md) file for more information on installing the files and setting up your working environment.

## Directory Structure

### Schema

The schema directory contains all of the XML Schema XSD files.

### Examples

The examples directory contains working examples using the schema.

The directory is laid out in a path structure that reduces the chances of too many files being kept in a
single directory.  Tools or code that intend to read the data should be designed to traverse the directory and
file all of the files and then read them.

The `movies/` directory contains movie examples.  The `test` directory is an abstract structure for testing the schema.

### Doc

The `doc` directory contains HTML documentation on using the schema, with examples.

[HTML Preview](http://htmlpreview.github.io/?https://github.com/cjcodeproj/vtmedia-schema/blob/main/doc/index.html)

### Notes

The `notes` directory contains additional documentaiton, in Markdown format.

### Test

The `test` directory contains simple testing code for the schema and for the provided examples.

### Catalog

The `catalog` directory has a `catalog.xml` file suitable for using with XML editors to load the schema.

### Templates

The templates directory has sample templates that can be copied and used as a baseline for data entry.

## Installation

See the [installation.md](notes/installation.md) file for installation instructions.

## Movie List
```
Title                                              Year Runtime  Genre
================================================== ==== ======== ==================================================

 -- Action (14) --

Another 48 Hrs.                                    1990 1:35:22  [FICTION] Action/Comedy "Cop/Prisoner Matchup Sequel"
Avengers: Endgame                                  2019 3:01:11  [FICTION] Action/Adventure/Sci-Fi/Drama "Superhero Adventure"
Chaos                                              2005 1:46:00  [FICTION] Action/Crime "Bank Robbery Movie"
Firestarter                                        1984 1:54:00  [FICTION] Action/Horror/Sci-Fi "Telekenetic Kid"
48 Hrs.                                            1982 1:36:36  [FICTION] Action/Comedy "Cop/Prisoner Matchup"
Hooper                                             1978 1:39:22  [FICTION] Action/Comedy "Stuntman Misadventures"
Killing Season                                     2013 1:30:41  [FICTION] Action/Thriller/Drama "Reopening War Wounds"
Mad Max                                            1979 1:33:00  [FICTION] Action/Sci-Fi "Distopian Highway"
Midnight Run                                       1988 2:06:09  [FICTION] Action/Comedy "Road Trip Adversary Hijinks"
Parker                                             2012 1:58:40  [FICTION] Action/Crime "Bad Guy Revenge"
Road House 2: Last Call                            2006 1:26:01  [FICTION] Action/Crime "Bar Bouncer Antics"
Sharky's Machine                                   1981 2:01:43  [FICTION] Action/Drama "Vice Investigation"
Stroker Ace                                        1983 1:34:15  [FICTION] Action/Comedy/Romance "NASCAR Racer Shennanigans"
Unstoppable                                        2010 1:38:30  [FICTION] Action/Thriller "Runaway Train Adventure"

 -- Adventure (3) --

The Great Escape                                   1963 2:53:13  [FICTION] Adventure/Action "POW Escape"
Onward                                             2020 1:42:00  [FICTION] Adventure/Comedy "Road Trip Adventure"
Stand By Me                                        1986 1:28:44  [FICTION] Adventure/Drama "Coming Of Age Quest"

 -- Documentary (1) --

Enron: The Smartest Guys In The Room               2005 1:49:15  [NONFICTION] Documentary "Big Business"

 -- Drama (2) --

All The President's Men                            1976 2:18:21  [FICTION] Drama/Mystery "Newspaper Mystery"
The Sugarland Express                              1974 1:49:59  [FICTION] Drama/Action/Comedy "Family Escape"

 -- Horror (1) --

Death Proof                                        2017 1:53:56  [FICTION] Horror/Thriller "Car Action"

 -- Mystery (2) --

The Pelican Brief                                  1993 2:21:05  [FICTION] Mystery/Thriller
Red Lights                                         2011 1:53:51  [FICTION] Mystery/Drama/Fantasy "Paranormal Investigation"

 -- Sci-Fi (3) --

Contact                                            1997 2:30:00  [FICTION] Sci-Fi/Drama "Alien Contact"
The Last Starfighter                               1984 1:41:00  [FICTION] Sci-Fi "Space Battle Adventure"
2010                                               1984 1:55:54  [FICTION] Sci-Fi "Space Exploration Adventure"

 -- Thriller (4) --

Blood Simple                                       1984 1:35:35  [FICTION] Thriller/Drama "Dangerous Affair"
Sneakers                                           1992 2:05:17  [FICTION] Thriller/Adventure "Techno Espionage Thriller"
3 Days Of The Condor                               1975 1:57:22  [FICTION] Thriller "Spy Thriller"
Wargames                                           1983 1:52:42  [FICTION] Thriller/Adventure "Hacking Movie"
================================================== ==== ======== ==================================================
```


## Code Project

[![PyPi version](https://img.shields.io/pypi/v/medialibrary)](https://pypi.org/project/medialibrary/)

The `medialibrary` code is a Python package for reading the XML files.  It can parse the data and generate reports
on a media repository.



## License

This work is licensed under a Creative Commons Attribution-ShareAlike 4.0 International License.

