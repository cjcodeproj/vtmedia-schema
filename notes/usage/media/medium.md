# Medium Element

## Example

```

  <medium>
    <type><bluray/></type>
    <releaseDate>2016-01-01</releaseDate>
    <publisher>Beta Barn</publisher>
   </release>
   <productId>
    <barcode type='upc'>71551186216</barcode>
    <sku retailer='amzn' type='asin'>B01H66WATO</sku>
   </productId>
   <productSpecs>
    <dimensions units='usStandard'>
     <standardSize/>
    </dimensions>
    <inventory>
     <case>
      <bluray id='br01'/>
      <insert id='in01'/>
     </case>
    </inventory>
   </productSpecs>
  </medium>

```

The `<medium>` element contains data on the physical nature of the media: What the medium is, how it can 
be identified, the physical size and weight of the container, and the inventory of the contents.

## The `release` element


## The `productId` element


## The `productSpecs` element

The `<productSpecs>` element contains two child elements used for describing the appearance of the media:
the size and the inventory.


### The `dimensions` element

```
 <dimensions units='metric'>
  <standardSize/>
  <weight value='170'/>
 </dimensions>
```

```
 <dimensions units='usStandard'>
  <size length='6.75' width='5.4' height='0.5'/>
  <weight value='6'/>
 </dimensions>
```

The `dimensions` element should contain at least one child element to specify the size of the media, 
and an optional element to specify the weight. The `units` attribute to the element is used to
specify what unit system of measurement us used in the child elements
(either `usStandard` or `metric`).

When using the `usStandard` unit system, it's assumed that measurements are in **inches**
and **ounces**; while with the `metric` unit system, it's assumed that measurements are
in **millimeters** and **grams**.

The `size` element contains the exact size, specifying length, width, and height.  The `standardSize` 
element can be used as a shortcut when the physical medium is identical to every other physical
medium of the same time.  If a movie is shipped in a standard DVD fold case, then using the
`standardSize` element says that the size of the medium is identical to every other standard DVD
on the market using the same case.

#### How To Measure A Product

Take the physical piece of media and lay it flat on a table, with the cover facing you.  For a DVD
that would mean laying the product flat.  The two visible measurements you can immediately take
are the length and width.  Since length is traditionally longer than width, then the length is the
measurement along the spine, and the width is the measurement along the bottom of the case.  That
leaves the value for height, which would be the thickness of the case.

#### Standard Size Values (usStandard)

| Product Type | Length | Width | Height| Weight |
|--------------|--------|-------|-------|--------|
| DVD Snapcase | 7.5 in | 5.4 in| 0.5 in| 6 oz   |
| Blu-Ray Snapcase | 6.75 in | 5.4 in | 0.4 in| 5 oz |

#### Standard Size Values (metric)

| Product Type | Length | Width | Height| Weight |
|--------------|--------|-------|-------|--------|
| DVD Snapcase | 190 mm | 135 mm| 15 mm| 170 gm |
| Blu-Ray Snapcase | 170 mm | 135 mm | 10 mm| 140 gm |


### The `inventory` element

The `<inventory>` element has an inventory record of what's in the product.  For most DVDs or
Blu-Rays, that means one case (usually a snapfold case), and one physical disk.  But in some cases,
it could be a case holding two physical disks.  It could be one Ultra HD disk and one Blu-Ray disk
as well as an insert containing a download code for the movie.  Or it could be a box holding
multiple snapfold cases, each holding multiple physical disks.  The `inventory` element 
contains a nested data structure that allows each piece of physical media ina product to
be identifiable.
