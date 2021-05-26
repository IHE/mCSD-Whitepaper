**Integrating the Healthcare Enterprise**

**[IHE IT Infrastructure](https://profiles.ihe.net/ITI)** **White Paper**

**mCSD White Paper**

**Revision 0.1 - Draft**

Date: April 13, 2021

Author: ITI Technical Committee

Email: [iti@ihe.net](mailto:iti@ihe.net)

# Forward

This is a white paper of the IHE IT Infrastructure (ITI) domain.

This white paper is published on XXXX XX, 2021. Comments are invited at 
any time and can be submitted using the 
[ITI Public Comment form](http://www.ihe.net/ITI_Public_Comments/) 
or by creating a 
[GitHub Issue](https://github.com/IHE/mCSD-Whitepaper/issues/new?template=public-comment-issue-template.md). 
Please reference the section that your comment applies to.

General information about IHE can be found at 
[https://www.ihe.net](https://www.ihe.net/).

Information about the IHE IT Infrastructure domain can be found at 
[https://www.ihe.net/IHE_Domains](https://www.ihe.net/IHE_Domains/).

Information about the organization of IHE Technical Frameworks and 
Supplements and the process used to create them can be found at 
[https://www.ihe.net/about_ihe/ihe_process](https://www.ihe.net/about_ihe/ihe_process/) and 
[https://www.ihe.net/resources/profiles](https://www.ihe.net/resources/profiles/).


**CONTENTS**
* [1 Introduction](#1-introduction)
* [2 Key Use Cases](#2-key-use-cases)
* [3 Facility Registry](#3-facility-registry)
* [4 Health Worker Registry](#4-health-worker-registry)
* [5 Care Services Registry](#5-care-services-registry)

# 1 Introduction

The HL7® FHIR® (Fast Healthcare Interoperability Resources) standard defines how healthcare information can be exchanged between different systems. The FHIR standard defines data structures, termed 'resources' -- like Patient, Diagnostic Result, and Care Plan -- and how these resources can be exchanged using common Web protocols. 

A guiding tenant of the evolving FHIR standard is that 80% of interoperability use cases should be satisfied out-of-the-box by any combination of the more than 130 base resources. Profiles may be created from the base resources to address diverse use cases, such as domain-specific ones like oncology, specific deployments like a patient identity registry, and local requirements such as incorporating legal definitions of marital status and race into data dictionaries. A simple use case, like a case report, up to a large use case like adapting FHIR to an entire country healthcare system, may be profiled from the base FHIR resources. Aspects of consent, security, and privacy are also embodied in profiles. 

[Integrating the Healthcare Enterprise (IHE)](http://www.ihe.net) supports the open, consensus-driven development of profiles for FHIR resources and other healthcare specifications. The profiling of base resources for use cases are increasingly specified in machine-computable FHIR Implementation Guides (IGs). The terms 'profile' and 'implementation guide' may be used interchangeably, though profiles for FHIR are specified in Implmentation Guides.

This paper outlines the [Mobile Care Services Discovery (mCSD profile)](https://www.ihe.net/uploadedFiles/Documents/ITI/IHE_ITI_Suppl_mCSD.pdf) which is designed to help implementation of services discovery using registries. A core need in health information exchange is to have common, authoritative registries of locations, organizations, jurisdictions, practitioners, and the roles and services they offer. These services can then be discoverable. 

For example, an electronic medical records (EMR) system with with ability to perform care services discovery can help patients get the care they need, from a licensed practitioner, in a location where it is provided. The uses of registries are not limited to patient clinical support; a care services platform can support aggregate and patient-level indicator reporting and case-based surveillance, targeting communities for epidemic control, and underlying requirements for health financing mechanisms. A care services discovery platform enables though is not sufficient for the above use cases. 

This paper further outlines several use cases that can be adapted to many contexts, including creating facilities and health worker registries. This document is not a substitute for the machine-computable IGs, but rather is complementary.

## 1.1 Scope

Effective health information exchange involves a diverse set of
activities and a broad set of challenges, whether that exchange takes
place among affiliated or unaffiliated care providers. The IT
Infrastructure (ITI) domain of IHE has addressed many of these
challenges by defining a series of integration profiles to address
specific aspects of exchanging healthcare information. Each integration
profiles addresses part of the broad set of challenges involved in
health information exchange. The profiles, however, do not attempt to
address governance and policy choices that significantly affect how the
profile is adapted in any particular community. This white paper cannot
address all such governance and policy issues but will provide some
guidance on where governance and policy issues are applicable and offer
some common approaches.

It is very important to note that IHE focuses only on interoperability
and does not attempt to solve every issue involved in exchanging health
information. These solutions are meant to be plugged into an
architecture that is designed and executed by the exchange communities
themselves. Thus, while each community will generate an architecture
that meets its individual needs, the use of IHE profiles will lead to
the creation of standards-based communities.

This white paper will focus on explaing how the mCSD profile can be used
to address specific implementation needs.  Since mCSD doesn’t require a 
particular set of FHIR resources to support, there is a need to define 
various implementations and the additional requirements they would have.
For example, a Facility Registry would require supporting mCSD with 
Location and Organization resources, and a Health Worker Registry / 
Provider Directory would require Practitioner resources.

## 1.2 Intended Audience

The assumed audience for this white paper includes those involved in a
current or planned health information community of any size and scope
that needs an overview of a framework for building a health information
exchange model based on open standards. This paper does not cover the
technical details as they are found in the IHE Profiles, White Papers,
and Webinar material.

Some intended audiences include:
- Govt (MOH, CDC)
- Federal Health Agencies (ONC, HHS, NIST)
- Regional/State Health Agencies (State Public Health Agencies)
- NGOs (WHO, UNICEF)
- Health Information Exchanges
- Standards Development Organizations
- HIT Non-Profits/Professional Associations (GDHP, HIMSS, RSNA, etc.)
- Health Systems
- Executive Offices: CEO, CIO, CMIO, CNIO, CSO, CTO, CPO, etc.

## 1.3 Overview of Mobile Care Services Discovery

The Mobile Care Services Discovery (mCSD) Profile supports discovery of 
care services resources using a RESTful interface in interrelated, 
federated environments.

The profile supports querying for:

1. **Organization** – Organizations are “umbrella” entities; these may 
be considered the administrative bodies under whose auspices care services
are provided such as Healthcare Information Exchanges (HIEs), Integrated 
Delivery Networks (IDNs), Non-Government Organizations (NGOs), Faith-Based
Organizations (FBOs) or even a one-physician family practice. An 
organization has a unique identifier and may have additional 
administrative attributes such as contact person, mailing address, etc. 
Departments of an institution, or other administrative units, may be 
represented as child Organizations of a parent Organization.

2. **Facility** – Facilities are physical care delivery sites such as 
hospitals, clinics, health outposts, physician offices, labs, pharmacies,
etc. A Facility has a unique identifier, geographic attributes (address, 
geocode), contact attributes, attributes regarding its hours of operation,
etc. Each Facility is defined by a pairing of Location and Organization.

3. **Location** – Locations are physical places where care can be 
delivered such as facilities, buildings, wards, rooms, or vehicles. 
Locations also include jurisdictions such as a village districts or 
regions. A Location has a unique identifier and may have geographic 
attributes (address, geocode), attributes regarding its hours of 
operation, etc.  Each Location may be related to one Organization. A 
location may have a hierarchical relationship with other locations.

4. **Jurisdiction** – Jurisdictions are political administrative units or
other territories over which authority is exercised.  A Jurisdiction has 
a unique identifier, geographic attributes, etc.  Jurisdictions include 
political administrative units such as village districts or regions.  Each
Jurisdiction is defined by a pairing of Location and Organization.

5. **Practitioner** – A Practitioner is a health worker such as defined by
WHO [http://www.who.int/whr/2006/06_chap1_en.pdf](http://www.who.int/whr/2006/06_chap1_en.pdf); 
a Practitioner might be a physician, nurse, pharmacist, community health 
worker, district health manager, etc. Practitioners have contact and 
demographic attributes. Each Practitioner may be related to one or more 
Organizations, one or more Locations and one or more Healthcare Services.
Specific attributes may be associated with the Practitioner relationship 
with these other entities.

6. **Healthcare Service** – Each healthcare service has a unique 
identifier. Examples include surgical services, antenatal care services, 
or primary care services. The combination of a Healthcare Service offered
at a Location may have specific attributes including contact person, hours
of operation, etc.


# 2 Key Use Cases

The existing use cases all give good examples of specific implementations, such as:

## 2.1 Master Facility List

A developing country has decided to implement a Master Facility List
(MFL) based on recommendations from the WHO in the [MFL Resource
Package](https://www.who.int/healthinfo/country_monitoring_evaluation/mfl/en/).
This resource includes a minimum data set to uniquely identify, locate,
and contact a specific facility. Since this will be a single source of
information for the country, there may be differing hierarchies that
need to be supported for the facilities. For example, one hierarchy would
be the administrative hierarchy for the country (region, district,
county). Another would be the supply chain hierarchy where hubs may be
located separately from administrative regions. Yet another could be a
reporting hierarchy used to send data to health system managers, and on
up to international organizations.


### 2.1.1 Implementation

> **Solution Option:** [Simple Facility Registry](#321-simple-facility-registry)

The MFL can implement a Simple Facility Registry as a sole source of the facility
data.  Clients can then query that data.  The MFL can utilize mCSD [Facilites and 
Jurisdictions](#31-facilities-and-jurisdictions) with multilple 
[hierarchies](#311-hierarchies).


## 2.2 Care Services Registry

To support health system planning, resource management, and patient
referral workflows, it will be important to be able to relate healthcare
facilities with the health services that are provided there by practitioners. A
care services registry may be operationalized that leverages mCSD to
cross-reference a code list of health services with the unique list of
facility IDs. Such a cross reference may include information related to
service provision availability (days and times of day).

### 2.2.1 Implementation

> **Solution Option:** [Federated Care Services Registry with Services](#521-federated-care-services-registry-with-services)

This Care Services Registry supports all the information contained in mCSD
in a federated environment.  Data can be managed in separate registries
and combined in the care services registry for managed access to the complete
data set.  A [Health Worker Registry](#23-health-worker-registry) and/or a
[Federated Facility Registry](#26-federated-facility-registry) can send
data updates to the care services registry.  There can be multiple data sources,
for example from private and public hospitals.  Internal business processes
can be used by the care services registry to link this data or reconcile
duplicates as needed.  Clients can then query the combined data set without
requiring access to the various data sources.


## 2.3 Health Worker Registry

A Health Worker Registry could be operationalized by collecting and
collating underlying provider demographic content from multiple clinical
colleges (e.g. College of Physicians and Surgeons, College of Nurses,
College of Pharmacists, etc.). These Colleges exert governance over their
membership, which may include a requirement of licensure in the
self-governing body in order to legally practice in a jurisdiction. As
such, the underlying Colleges will maintain the content and a Health
Worker Registry would periodically refresh its content from these
multiple underlying sources and execute necessary cross-referencing and
de-duplication workflows to support an interlinked registry relating
WHICH workers provide WHAT SERVICES, WHERE.

### 2.3.1 Implementation

> **Solution Option:** [Federated Health Worker Registry](#412-federated-health-worker-registry)

A central federated health worker registry can be set up that pulls data
from various other sources of practitioner data such as the clinical colleges
and licensing boards.  Data can also be pulled from HR systems and combine
this data with the licensing and training data.

## 2.4 Functioning Facilities Registry

Monitor functioning facilities, e.g. when buildings are operational,
construction teams, infrastructure, maintenance, then share that
information with the public. There is a need to immediately view services,
openings, closures.

### 2.4.1 Implementation

> **Solution Option:** [Simple Facility Registry with Services](#323-simple-facility-registry-with-services)

This registry is an extension of the [Master Facility List](#21-master-facility-list)
to include services data for the facilities.  It would also include the times
those services are available so it can be used to look up locations for 
referrals.  It can also be used internally to track work and closures of
the facilities.


## 2.5 Health Worker Registry with Services

View the allocation of human resources (assuming this includes services).

> **Solution Option:** [Federated Health Worker Registry with Services](#413-federated-health-worker-registry-with-services)

## 2.6 Federated Facility Registry

A common problem is that multiple data systems are collecting
information about facilities. For example, in one country, there are
6 DHIS2 platforms that are not aligned, and are struggling to maintain
metadata.

### 2.6.1 Implementation

> **Solution Option:** [Federated Facility Registry](#322-federated-facility-registry)

There can be a central federated facility registry that can pull data
from the DHIS2 platforms and integrate it.  Once the data has been aligned,
it can then be used to update the source systems based on internal policies.


## 2.7 Federated Data Collection

A way is needed to integrate some regular, large data collections
(HHFA) from surveys which visit all facilities in the country, and these
data sources are not connected to the maintenance of the facilities. One
should be able to integrate information from large data collection.

### 2.7.1 Implementation

> **Solution Option:** [Federated Facility Registry](#322-federated-facility-registry)

The data collection systems can support mCSD to share the collected data
to the central facility registry.

## 2.8 Aggregate Data Collection

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

> **Solution Option:** [Federated Facility Registry with Services](#324-federated-facility-registry-with-services)


# 3 Facility Registry

A Facilty Registry can provide data on facilities in a particular area.
Optionally, it can provide details on what healthcare services are
supplied by those facilities.  Sometimes this data may be managed
by multiple services and the content can be federated so information
can be accessed from a central system, but managed locally.

## 3.1 Facilities and Jurisdictions

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

![](.//media/facilities-and-jurisdictions.png)

**Figure 3.1-1: Facilities and Jurisdictions**

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

### 3.1.1 Hierarchies

Multiple hierarchies are handled with a FHIR extension on the Organization
resource in mCSD.  Each Organization can be part of any number of parent 
Organizations associated with a type for the hierarchy.  A hierarchy can 
be within Jurisdictions and/or Organizations.

Clients to the facility registry can search based on the hierarchy
type and parent Organizations.

<a name="figure3.1.1-1">&nbsp;</a>

![](.//media/multiple-hierarchies.png)

**Figure 3.1.1-1: Multiple Hierarchies**

## 3.2 Implementations 

### 3.2.1 Simple Facility Registry

A Simple Facility Registry will allow any searches on its facility 
data.  It will contain Location and Organization data to reference mCSD
Facilities and Jursidictions as well as any other non-jurisdicational
Organizations.  It will also include geographic data so searches can also
be done by distance.

The following actors, transactions, and resources shall be used.

* Actors (Options)
  * Care Services Selective Supplier (Location Distance option)
* Transactions
  * ITI-90
* Resources
  * `Organization`
  * `Location`

Clients will act as a Care Services Selective Consumer (Location Distance
option) to search the Facility Registry content.  Figure 3.2.1-1 shows a
Health Management Information System (HMIS) and a Mobile App querying the 
Facility Registry using ITI-90.

![](.//media/simple-facility-registry.png)

**Figure 3.2.1-1: Simple Facility Registry**

Figure 3.2.1-2 shows the sequence of requests to and from the HMIS and
Mobile App to the Facility Registry.

![](.//media/simple-facility-registry-sequence.png)

**Figure 3.2.1-2: Simple Facility Registry Transaction Sequence**

### 3.2.2 Federated Facility Registry

In a distributed environment, some aspects of the facilities are managed 
in multiple systems so they need to be federated using ITI-91.  Some
systems may also need to pull full updates from the registry instead
of searching.

The following actors, transactions, and resources shall be used.

* Actors (Options)
  * Care Services Selective Supplier (Location Distance option)
  * Care Services Update Supplier (Location Distance option)
  * Care Services Update Consumer (Location Distance option)
* Transactions
  * ITI-90
  * ITI-91
* Resources
  * `Organization`
  * `Location`

Other sources will act as a Care Services Selective Suppliers (Location 
Distance option) to update the Facility Registry content.  Figure 3.2.3-1 
shows a federated system of servers sending their content to a 
Federated Facility Registry using ITI-91 and a mobile app querying 
facility data using ITI-90.  Each server can also pull the full 
combined data set from the Facility Registry as a Care Services Update 
Consumer as needed.

![](.//media/federated-facility-registry.png)

**Figure 3.2.2-1: Federated Facility Registry**

Figure 3.2.2-2 shows the sequence of requests to and from the Registry
and the various sources as well as a mobile app querying the entire data
set.

![](.//media/federated-facility-registry-sequence.png)

**Figure 3.2.2-2: Federated Facility Registry Transaction Sequence**

### 3.2.3 Simple Facility Registry with Services

This registry is similar to the [Simple Facility 
Registry](#321-simple-facility-registry) but it also includes healthcare 
service data.

The following actors, transactions, and resources shall be used.

* Actors (Options)
  * Care Services Selective Supplier (Location Distance option)
* Transactions
  * ITI-90
* Resources
  * `Organization`
  * `Location`
  * `HealthcareService`

Clients will act as a Care Services Selective Consumer (Location Distance
option) to search the Facility Registry content.  Figure 3.2.3-1 shows a
Facility Management System and a Mobile App querying the Facility
Registry using ITI-90.

![](.//media/simple-facility-services.png)

**Figure 3.2.3-1: Simple Facility Registry with Services**


### 3.2.4 Federated Facility Registry with Services


The following actors, transactions, and resources shall be used.

* Actors (Options)
  * Care Services Selective Supplier (Location Distance option)
  * Care Services Update Consumer (Location Distance option)
  * Care Services Update Supplier (Location Distance option)
* Transactions
  * ITI-90
  * ITI-91
* Resources
  * `Organization`
  * `Location`
  * `HealthcareService`

Other sources will act as a Care Services Selective Suppliers 
(Location Distance option) to update the Facility Registry content.  
Figure 3.2.4-1 shows a federated system of facility sources sending 
their content to a Federated Facility Registry using ITI-91 and a 
mobile app querying facility data using ITI-90.  

![](.//media/federated-facility-services.png)

**Figure 3.2.4-1: Federated Facility Registry with Services**

# 4 Health Worker Registry

## 4.1 Implementations

### 4.1.1 Simple Health Worker Registry

A Simple Health Worker Registry will allow any searches on its health worker 
data.  It will contain Practitioner and PractitionerRole data.  

The following actors, transactions, and resources shall be used.

* Actors (Options)
  * Care Services Selective Supplier
* Transactions
  * ITI-90
* Resources
  * `Practitioner`
  * `PractitionerRole`

Clients will act as a Care Services Selective Consumer 
to search the Health Worker Registry content.  Figure 4.1.1-1 shows a
Health Management Information System (HMIS) and a Mobile App querying the 
Health Worker Registry using ITI-90.

![](.//media/simple-practitioner-registry.png)

**Figure 4.1.1-1: Simple Health Worker Registry**

Figure 4.1.1-2 shows the sequence of requests to and from the HMIS and
Mobile App to the Health Worker Registry.

![](.//media/simple-practitioner-registry-sequence.png)

**Figure 4.1.2-1: Simple Health Worker Registry Transaction Sequence**

### 4.1.2 Federated Health Worker Registry

In a distributed environment, some aspects of the health workers are managed 
in multiple systems so they need to be federated using ITI-91.  Some
systems may also need to pull full updates from the registry instead
of searching.

The following actors, transactions, and resources shall be used.

* Actors (Options)
  * Care Services Selective Supplier
  * Care Services Update Supplier
  * Care Services Update Consumer
* Transactions
  * ITI-90
  * ITI-91
* Resources
  * `Practitioner`
  * `PractitionerRole`

Other sources will act as a Care Services Selective Suppliers 
to update the Health Worker Registry content.  Figure 4.1.3-1 
shows a federated system of servers sending their content to a 
Federated Health Worker Registry using ITI-91 and a mobile app querying 
health worker data using ITI-90.  Each server can also pull the full 
combined data set from the Health Worker Registry as a Care Services Update 
Consumer as needed.

![](.//media/federated-practitioner-registry.png)

**Figure 4.1.2-1: Federated Health Worker Registry**

Figure 4.1.2-2 shows the sequence of requests to and from the Registry
and the various sources as well as a mobile app querying the entire data
set.

![](.//media/federated-practitioner-registry-sequence.png)

**Figure 4.1.2-2: Federated Health Worker Registry Transaction Sequence**

### 4.1.3 Simple Health Worker Registry with Services

This registry is similar to the [Simple Health Worker 
Registry](#321-simple-health-worker-registry) but it also includes healthcare 
service data.

The following actors, transactions, and resources shall be used.

* Actors (Options)
  * Care Services Selective Supplier
* Transactions
  * ITI-90
* Resources
  * `Practitioner`
  * `PractitionerRole`
  * `HealthcareService`

Clients will act as a Care Services Selective Consumer 
to search the Health Worker Registry content.  Figure 4.1.3-1 shows a
Health Management Information System and a Mobile App querying the Facility
Registry using ITI-90.

![](.//media/simple-practitioner-services.png)

**Figure 4.1.3-1: Simple Health Worker Registry with Services**


### 4.1.4 Federated Health Worker Registry with Services


The following actors, transactions, and resources shall be used.

* Actors (Options)
  * Care Services Selective Supplier
  * Care Services Update Consumer
  * Care Services Update Supplier
* Transactions
  * ITI-90
  * ITI-91
* Resources
  * `Practitioner`
  * `PractitionerRole`
  * `HealthcareService`

Other sources will act as a Care Services Selective Suppliers 
to update the Health Worker Registry content.  
Figure 4.1.4-1 shows a federated system of health worker sources sending 
their content to a Federated Health Worker Registry using ITI-91 and a 
mobile app querying health worker data using ITI-90.  

![](.//media/federated-practitioner-services.png)

**Figure 4.1.4-1: Federated Health Worker Registry with Services**


# 5 Care Services Registry


Care Services Registries include data on facilities as well as
practitioners and can optionally include healthcare services.

## 5.1 Facilities and Jurisdictions

See the Facility Registry for [Facilities and Jurisdictions](#31-facilities-and-jurisdictions)

## 5.2 Implementations

### 5.2.1 Care Services Registry

In some instances, all the care services data would be combined into
a single central server for easier access.  In most cases this server
would pull data from various source servers (such as a Facility Registry
or Health Worker Registry) and link the resources together.

The following actors, transactions, and resources shall be used.

* Actors (Options)
  * Care Services Selective Supplier (Location Distance option)
  * Care Services Update Supplier (Location Distance option)
  * Care Services Update Consumer (Location Distance option)
* Transactions
  * ITI-90
  * ITI-91
* Resources
  * `Organization`
  * `Location`
  * `Practitioner`
  * `PractitionerRole`

Other sources will act as a Care Services Selective Suppliers 
to update the Care Services Registry content.  Figure 5.2.1-1 
shows a federated system of servers sending their content to a 
Federated Care Services Registry using ITI-91 and a mobile app querying 
data using ITI-90.  Each server can also pull the full 
combined data set from the Care Services Registry as a Care Services Update 
Consumer as needed.

![](.//media/federated-care-registry.png)

**Figure 5.2.1-1: Federated Care Services Registry**

Figure 5.2.1-2 shows the sequence of requests to and from the Registry
and the various sources as well as a mobile app querying the entire data
set.

![](.//media/federated-care-registry-sequence.png)

**Figure 5.2.1-2: Federated Care Services Registry Transaction Sequence**


### 5.2.2 Care Services Registry with Services

A Care Services Registry may also include data on the Healthcare Services
provided and this implementation includes that data as well.

The following actors, transactions, and resources shall be used.

* Actors (Options)
  * Care Services Selective Supplier (Location Distance option)
  * Care Services Update Supplier (Location Distance option)
  * Care Services Update Consumer (Location Distance option)
* Transactions
  * ITI-90
  * ITI-91
* Resources
  * `Organization`
  * `Location`
  * `Practitioner`
  * `PractitionerRole`
  * `HealthcareService`

Other sources will act as a Care Services Selective Suppliers 
to update the Care Services Registry content.  Figure 5.2.2-1 
shows a federated system of servers sending their content to a 
Federated Care Services Registry using ITI-91 and a mobile app querying 
data using ITI-90.  Each server can also pull the full 
combined data set from the Care Services Registry as a Care Services Update 
Consumer as needed.

![](.//media/federated-care-registry-services.png)

**Figure 5.2.2-1: Federated Care Services Registry with Services**


