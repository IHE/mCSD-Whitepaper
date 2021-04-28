# Facility Registry

## Use Cases

1. A developing country has decided to implement a Master Facility List 
(MFL) based on recommendations from the WHO in the [MFL Resource 
Package](https://www.who.int/healthinfo/country_monitoring_evaluation/mfl/en/). 
This resource includes a minimum data set to uniquely identify, location,
and contact a specific facility. Since this will be a single source of 
information for the country, there may be differing hierarchies that 
need to be supported for the facilities. For example, one hierarchy would
be the administrative hierarchy for the country (region, district, 
county). Another would be the supply chain hierarchy where hubs may be 
located separately from administrative regions. Yet another could be a 
reporting hierarchy used to send data to health system managers, and on 
up to international organizations.

2. Monitor functioning facilities, e.g. when buildings are operational, 
construction teams, infrastructure, maintenance, then share that 
information with the public. There is a need to immediately view services,
openings, closures.

3. A common problem is that multiple data systems are collecting 
information about facilities. For example, in one country, there are 
6 DHIS2 platforms that are not aligned, and are struggling to maintain 
metadata.

4. A way is needed to integrate some regular, large data collections 
(HHFA) from surveys which visit all facilities in the country, and these 
data sources are not connected to the maintenance of the facilities. One 
should be able to integrate information from large data collection.

5. Aggregate Data Collection
    * Problem statement
        * In this use case, a donor invests in vertical public health 
        programs across many countries. The donor has a multi-country 
        dashboard and analytics platform that aggregates data and tracks 
        progress from the program's outcomes at the facility level.
        * Thus, there are within-country facility IDs issued by the 
        ministry of health, and IDs for facilities used by the 
        multi-country analytics platform.
        * IDs may change, administrative hierarchies may split, and 
        facilities may drop or be added over time.

    * Solution is record linkage
        * The need that the facility ID used within-country should be 
        linked to a multi-country ID, and be updateable.
        * This is similar to the concept of a client (patient) registry, 
        but for record linkage between organizations, locations, and 
        healthcare services in FHIR types.

## Facilities and Jurisdictions

First, it is important to say that we often think of health facilities 
as a single concept, such as physical sites such as hospitals, clinics, 
health outposts, physician offices, etc. In this way of thinking, a 
facility has a unique identifier, geographic attributes (address, geocode),
contact attributes, attributes regarding its hours of operation, etc. 

But, in FHIR there is no single facility resource, rather, **in mCSD, each 
Facility is defined by a pairing of FHIR Location and FHIR Organization**. 
All of the attributes required can be included, but there is no 'Facility' 
FHIR resource.

> **A facility is defined as a FHIR Location + FHIR Organization pair**
>
> The key takeaway is that when thinking of a health facility, there no 
> single FHIR resource, instead it is represented in FHIR as a Location and 
> Organization resource pair. 

* **FHIR Locations** are physical places where care can be delivered such 
as facilities, buildings, wards, rooms, or vehicles. Locations also include
political administrative units such as a village districts or regions. A 
Location has a unique identifier and may have geographic attributes 
(address, geocode), attributes etc. Each Location may be related to one 
Organization. A location may have a hierarchical relationship with other 
locations.

> **Locations only relate to one organization**
> 
> The key takeaway is that a FHIR Location doesn't have enough details to 
> describe the management side of the facility and that's where 
> Organization comes in.

* **FHIR Organizations** are "umbrella" entities; these may be considered 
the administrative bodies under whose auspices care services are provided 
such as Healthcare Information Exchanges (HIEs), Integrated Delivery 
Networks (IDNs), Non-Government Organizations (NGOs), Faith-Based 
Organizations (FBOs) or even a one-physician family practice. An 
organization has a unique identifier and may have additional administrative
attributes such as contact person, mailing address, etc. Departments of an
institution, or other administrative units, may be represented as child 
Organizations of a parent Organization.

> **Organizations can have more than hierarchy, but not Locations**
> 
> Organizations are powerful representaions, they can have more than one 
> hierarchy in mCSD. (This requires a mCSD extension to the core FHIR spec.)

### Hierarchies


