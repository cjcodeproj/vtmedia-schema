# Media Schema

An XML schema designed for the recording of the details of various forms of media, 
including movies, television, books, and music.

## Project Goals

The schema is designed with the following goals.


1. The ability to record details on a piece of media, details on the storage medium, and ownership information.
2. Easy enough to create records without proprietary software dependencies.
3. Simple data entry, validation, and debugging using tools of the end-user's choice.
4. Allow for easy exchange, transfer, or publication of the dataset using existing protocols.
5. The schema should be flexible, easy to comprehend, and extensible both inside and outside the project.
6. Data should be recorded in logical structures, making it suitable for indexing, searching, and comparison operations.


## Directory Structure

### Schema

The schema directory contains all of the XML Schema XSD files.

### Examples

The examples directory contains working examples using the schema.

Movie list
```
Title                                              Year Genre                                             
================================================== ==== ==================================================
All The President's Men                            1976 [FICTION] Drama/Mystery "Newspaper Mystery"       
Another 48 Hrs.                                    1990 [FICTION] Action/Comedy "Cop/Prisoner Matchup Sequel"
Blood Simple                                       1984 [FICTION] Thriller/Drama "Dangerous Affair"       
Contact                                            1997 [FICTION] Sci-Fi/Drama "Alien Contact"            
Death Proof                                        2017 [FICTION] Horror/Thriller "Car Action"            
Enron: The Smartest Guys In The Room               2005 [NONFICTION] Documentary "Big Business"           
48 Hrs.                                            1982 [FICTION] Action/Comedy "Cop/Prisoner Matchup"    
The Great Escape                                   1963 [FICTION] Adventure/Action "POW Escape"           
Killing Season                                     2013 [FICTION] Action/Thriller/Drama "Reopening War Wounds"
The Last Starfighter                               1984 [FICTION] Sci-Fi "Space Battle Adventure"         
Mad Max                                            1979 [FICTION] Action/Sci-Fi "Distopian Highway"       
Midnight Run                                       1988 [FICTION] Action/Comedy "Road Trip Adversary Hijinks"
Onward                                             2020 [FICTION] Adventure/Comedy "Road Trip Adventure"  
Parker                                             2012 [FICTION] Action/Crime "Bad Guy Revenge"          
Red Lights                                         2011 [FICTION] Mystery/Drama/Fantasy "Paranormal Investigation"
Road House 2: Last Call                            2006 [FICTION] Action/Crime "Bar Bouncer Antics"       
Sneakers                                           1992 [FICTION] Thriller/Adventure "Techno Espionage Thriller"
Stand By Me                                        1986 [FICTION] Adventure/Drama "Coming Of Age Quest"   
The Sugarland Express                              1974 [FICTION] Drama/Action/Comedy "Family Escape"     
3 Days Of The Condor                               1975 [FICTION] Thriller "Spy Thriller"                 
2010                                               1984 [FICTION] Sci-Fi "Space Exploration Adventure"    
Unstoppable                                        2010 [FICTION] Action/Thriller "Runaway Train Adventure"
Wargames                                           1983 [FICTION] Thriller/Adventure "Hacking Movie"      
```

### Doc

The doc directory contains HTML documentation on using the schema, with examples.

[HTML Preview](http://htmlpreview.github.io/?https://github.com/cjcodeproj/vtmedia-schema/blob/main/doc/index.html)

### Test

The test directory contains simple testing code.

### Templates

The templates directory has sample templates that can be copied and used as a baseline for data entry.

## License

This work is licensed under a Creative Commons Attribution-ShareAlike 4.0 International License.
