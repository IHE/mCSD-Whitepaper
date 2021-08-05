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

This white paper describes some common uses where the [Mobile Care Services Discovery (mCSD profile)](https://www.ihe.net/uploadedFiles/Documents/ITI/IHE_ITI_Suppl_mCSD.pdf) can be used to help implementation of services discovery using [registries or directories](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html#6-common-provider-directory).  In general, registry services are designed to uniquely identify and track unique patients, facilities, healthcare products and terminology that are used throughout the health information exchange.  

A core need in health information exchange is to have common, authoritative registries of locations, organizations, jurisdictions, practitioners, and the roles and services they offer. These services can be discoverable using mCSD. mCSD provides extensions of the core FHIR resources to support health information exchange across the enterprise, including the  queries and updates that legacy systems must support to access authoritative registries. For example, an electronic medical records (EMR) system with the ability to perform care services discovery can help patients get the care they need, from a licensed practitioner, in a location where it is provided.

mCSD also provides extensions that support diverse funding mechanisms and attribution for reporting. mCSD supports complex organizational hierarchies. For example, the mCSD extension for the Organization resource allows for more than one parent Organization resource. This is powerful in that is supports a health facility to be in the hierarchy of several organizations, for example different departments in the same Ministry of Health.

The mCSD implementation guide can be used in various configurations, each suited for a different use-case. The variations will be discussed in the context of these common use-cases. This paper further outlines several use cases that can be adapted to many contexts, including creating facilities and health worker registries.

## 1.1 Scope

Effective health information exchange involves a diverse set of
activities and a broad set of challenges, whether that exchange takes
place among affiliated or unaffiliated care providers. The IT
Infrastructure (ITI) domain of IHE has addressed many of these
challenges by defining a series of integration profiles to address
specific aspects of exchanging healthcare information. Each integration
profile addresses part of the broad set of challenges involved in
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

This white paper will focus on explaining how the mCSD profile can be used
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

* Govt (MOH, CDC)
* Federal Health Agencies (ONC, HHS, NIST)
* Regional/State Health Agencies (State Public Health Agencies)
* NGOs (WHO, UNICEF)
* Health Information Exchanges
* Standards Development Organizations
* HIT Non-Profits/Professional Associations (GDHP, HIMSS, RSNA, etc.)
* Health Systems
* Executive Offices: CEO, CIO, CMIO, CNIO, CSO, CTO, CPO, etc.

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
departments of an institution, or other administrative units, may be
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

The relationship between these entities is illustrated in Figure 1.3-1.

![Top-level Relationships Between Care Service Entities](.//media/care-services-relationships.png)

**Figure 1.3-1: Top-level Relationships Between Care Service Entities**

### 1.3.1 IHE Terminology

The IHE Profiles, including mCSD, use a specific [terminology](https://profiles.ihe.net/GeneralIntro/ch-3.html) to express use cases: `Actors`, `Transactions`, `Resources`, and `Options`. This terminology creates a set of interoperability constraints. `Actors` are the information systems or components of information systems in the workflow. `Transactions` are the exchanges between `Actors`. `Resources` mean FHIR resources (for FHIR-centered Profiles). `Options` in mCSD may exist for `Actors` which are additional `Transactions` that may or may not be chosen for the use case.

### 1.3.2 Use For Authorization

mCSD can be used to assist with authorization by querying for what organizations
and/or roles a practitioner is associated with to determine what resources they
have access to.  When a practitioner needs access, the access control system may
use the registry relationships, such as to organizations or roles, to see if they
can be given access.

The [Access Control White Paper](https://www.ihe.net/Technical_Framework/upload/IHE_ITI_TF_WhitePaper_AccessControl_2009-09-28.pdf) describes these scenarios.
mCSD can also be used for attribute retrieval as described in Section 9.5.  Section
5.7.2 discusses how PIX/PDQ can be used to retrieve patient attributes for
cross-enterprise access control and mCSD can be used to do the same for practitioner
attributes.

### 1.3.3 Facilities and Jurisdictions

First, it is important to say that we often think of health facilities
as a single concept, such as physical sites such as hospitals, clinics,
health outposts, physician offices, etc. In this way of thinking, a
facility has a unique identifier, geographic attributes (address, geocode),
contact attributes, attributes regarding its hours of operation, etc.

But, in FHIR there is no single facility resource, rather, **in mCSD, each
Facility is defined by a pairing of FHIR Location and FHIR Organization**.
All of the attributes required can be included, but there is no 'Facility'
FHIR resource.  mCSD uses the `type` element in the Location and Organization
resources to signify that the resources are being used as a facility or jurisdiction.
In the [mCSD Supplement](https://www.ihe.net/uploadedFiles/Documents/ITI/IHE_ITI_Suppl_mCSD.pdf),
see tables 3.90.4.2.2.1-2 and 3.90.4.2.2.2-2 for Facilities and tables
3.90.4.2.2.1-3 and 3.90.4.2.2.2-3 for Jurisdictions.

> **A facility is defined as a FHIR Location + FHIR Organization pair**
>
> The key takeaway is that when thinking of a health facility, there is no
> single FHIR resource, instead it is represented in FHIR as a Location and
> Organization resource pair linked by the `Location.managingOrganization` element.
> Jurisdictions are handled the same way.

![mCSD Facilities and Jurisdictions](.//media/facilities-and-jurisdictions.png)

**Figure 1.3.3-1: Facilities and Jurisdictions**

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
> Organizations are powerful representations, they can have more than one
> hierarchy in mCSD, but Locations can only have one hierarchy. (This requires
> a mCSD extension to the core FHIR spec for Organizations.)

#### 1.3.3.1 Hierarchies

Multiple hierarchies are handled with a FHIR extension on the Organization
resource in mCSD.  Each Organization can be part of any number of parent
Organizations associated with a type for the hierarchy.  A hierarchy can
be within Facilities, Jurisdictions and/or Organizations.  This extension is
described in Table 3.90.4.2.2.1-1 of the [mCSD Supplement](https://www.ihe.net/uploadedFiles/Documents/ITI/IHE_ITI_Suppl_mCSD.pdf).

Clients to the facility registry can search based on the hierarchy
type and parent Organizations.

![mCSD Multiple Hierarchies](.//media/multiple-hierarchies.png)

**Figure 1.3.3.1-1: Multiple Hierarchies**

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
data. Clients can then query that data. The MFL can utilize mCSD [Facilities and
Jurisdictions](#133-facilities-and-jurisdictions) with [multiple
hierarchies](#1331-hierarchies).

## 2.2 Care Services Registry

To support health system planning, resource management, and patient
referral workflows, it will be important to be able to relate healthcare
facilities with the health services that are provided there by practitioners. A
care services registry may be operationalized that leverages mCSD to
cross-reference a code list of health services with the unique list of
facility IDs. Such a cross reference may include information related to
service provision availability (days and times of day).

### 2.2.1 Implementation

> **Solution Option:** [Care Services Registry](#521-care-services-registry)

This Care Services Registry supports all the information contained in mCSD
in a federated environment. Data can be managed in separate registries
and combined in the care services registry for managed access to the complete
data set. A [Health Worker Registry](#23-health-worker-registry) and/or a
[Federated Facility Registry](#26-federated-facility-registry) can send
data updates to the care services registry. There can be multiple data sources,
for example from private and public hospitals. Internal business processes
can be used by the care services registry to link this data or reconcile
duplicates as needed. Clients can then query the combined data set without
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
de-duplication workflows to support an care services registry relating
WHICH workers (Practitioner) provide WHAT SERVICES (HealthcareService), WHERE (Location).

> **Unlicensed Practitioner Roles and the Community and Volunteer Health Workforce**
>
> In FHIR, a [Practitioner](https://www.hl7.org/fhir/practitioner.html#8.4) is a "person who is directly or indirectly involved in the provisioning of healthcare". This means that some Practitioners may be in roles that require qualifications and licensure to perform in a jurisdiction, while other Practitioners providing care may not, and still others may engage in support functions. One example may be a nurse's aide who may not require licensure or formal qualification but are providing care. Another example is that in Low- and Middle-Income Countries (LMIC) the formal health workforce is often supplemented by volunteers as in vaccination campaigns and Community-based Health Workers (CHWs) to support maternal and child health. Some [examples](https://www.hl7.org/fhir/practitioner.html#scope) of support functions from the FHIR R4 Practitioner specification are receptionists and IT personnel.
>
> The mCSD Profile adopts the FHIR Practitioner approach in that all direct and indirect roles in healthcare may be captured in Practitioner and PractitionerRoles. Implementers of mCSD may choose to pursue their own formal definitions of the health workforce and define them, for example in ValueSets, in their Implementation Guides.

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

> **Solution Option:** [Simple Facility Registry](#321-simple-facility-registry)

This registry is an extension of the [Master Facility List](#21-master-facility-list)
to include services data for the facilities.  It would also include the times
those services are available so it can be used to look up locations for
referrals.  It can also be used internally to track work and closures of
the facilities.

## 2.5 Federated Facility Registry

A common problem is that multiple data systems are collecting
information about facilities. For example, in one country, there are
6 DHIS2 platforms that are not aligned, and are struggling to maintain
metadata.

### 2.5.1 Implementation

> **Solution Option:** [Federated Facility Registry](#322-federated-facility-registry)

There can be a central federated facility registry that can pull data
from the DHIS2 platforms and integrate it. Once the data has been aligned,
it can then be used to update the source systems based on internal policies.

## 2.6 Federated Data Collection

A way is needed to integrate some regular, large data collections
(HHFA) from surveys which visit all facilities in the country, and these
data sources are not connected to the maintenance of the facilities. One
should be able to integrate information from large data collection.

### 2.6.1 Implementation

> **Solution Option:** [Federated Facility Registry](#322-federated-facility-registry)

The data collection systems can support mCSD to share the collected data
to the central facility registry.

## 2.7 Aggregate Data Reporting

Aggregate data reporting refers to routine reporting, often from a health facility, to an administrative jurisdiction, health financing entity, or external donors and investors.

As an example use case, a donor invests in vertical public health programs for epidemic control across many countries. The donor has a multi-country dashboard and analytics platform that aggregates data and tracks progress of program outcomes at the facility level There are within-country facility IDs issued by the Ministry of Health, and IDs for facilities used by the multi-country analytics platform. IDs may change, temporary facilities like immunization sites may be added, administrative hierarchies may split, and facilities may drop or be upgraded to another level of clinical care over time. A similar use case could arise in a country in which public healthcare is decentralized and provided and overseen by subnational political units who engage in routine reporting to the national authority.

> **Solution Option:** [Federated Facility Registry](#322-federated-facility-registry)

# 3 Facility Registry

A Facility Registry can provide data on facilities in a particular area.
Optionally, it can provide details on what healthcare services are
supplied by those facilities.  Sometimes this data may be managed
by multiple services and the content can be federated so information
can be accessed from a central system, but managed locally.

## 3.2 Implementations

### 3.2.1 Simple Facility Registry

A Simple Facility Registry will allow any searches on its facility
data.  It manages it's own data and doesn't receive data updates from
other services.  It will contain Location and Organization data to
reference mCSD Facilities and Jurisdictions as well as any other
non-jurisdictional Organizations.  It will also include geographic
data so searches can also be done by distance.  It will optionally
include healthcare service content.

The following actors, transactions, and resources are be used.

* Actors (Options)
  * Care Services Selective Supplier (Location Distance option)
* Transactions
  * Find Matching Care Services \[ITI-90\]
* Resources
  * `Organization`
  * `Location`
  * `HealthcareService` ***Optional***

Clients will act as a Care Services Selective Consumer (Location Distance
option) to search the Facility Registry content.  Figure 3.2.1-1 shows a
Health Management Information System (HMIS) and a Mobile App querying the
Facility Registry using Find Matching Care Services \[ITI-90\].

![Simple Facility Registry](.//media/simple-facility-services.png)

**Figure 3.2.1-1: Simple Facility Registry**

Figure 3.2.1-2 shows the sequence of requests to and from the HMIS and
Mobile App to the Facility Registry.

![Simple Facility Registry Transaction Sequence](.//media/simple-facility-registry-sequence.png)

**Figure 3.2.1-2: Simple Facility Registry Transaction Sequence**

### 3.2.2 Federated Facility Registry

In a distributed environment, some aspects of the facilities are managed
in multiple systems so they need to be federated using Request Care Services Updates \[ITI-91\].  Some
systems may also need to pull full updates from the registry instead
of searching.  A federated facility registry can optionally include
healthcare service content.

The following actors, transactions, and resources are be used.

* Actors (Options)
  * Care Services Selective Supplier (Location Distance option)
  * Care Services Update Supplier (Location Distance option)
  * Care Services Update Consumer (Location Distance option)
* Transactions
  * Find Matching Care Services \[ITI-90\]
  * Request Care Services Updates \[ITI-91\]
* Resources
  * `Organization`
  * `Location`
  * `HealthcareService` ***Optional***

Other sources will act as a Care Services Selective Suppliers (Location
Distance option) to update the Facility Registry content.  Figure 3.2.3-1
shows a federated system of servers sending their content to a
Federated Facility Registry using Request Care Services Updates \[ITI-91\] and a mobile app querying
facility data using Find Matching Care Services \[ITI-90\].  Each server can also pull the full
combined data set from the Facility Registry as a Care Services Update
Consumer as needed.

![Federated Facility Registry](.//media/federated-facility-services.png)

**Figure 3.2.2-1: Federated Facility Registry**

Figure 3.2.2-2 shows the sequence of requests to and from the Registry
and the various sources as well as a mobile app querying the entire data
set.

![Federated Facility Registry Transaction Sequence](.//media/federated-facility-registry-sequence.png)

**Figure 3.2.2-2: Federated Facility Registry Transaction Sequence**

# 4 Health Worker Registry

## 4.1 Implementations

### 4.1.1 Simple Health Worker Registry

A Simple Health Worker Registry will allow any searches on its health worker
data.  It will contain Practitioner and PractitionerRole data and optionally
HealthcareService data.

The following actors, transactions, and resources are be used.

* Actors (Options)
  * Care Services Selective Supplier
* Transactions
  * Find Matching Care Services \[ITI-90\]
* Resources
  * `Practitioner`
  * `PractitionerRole`
  * `HealthcareService` ***Optional***

Clients will act as a Care Services Selective Consumer
to search the Health Worker Registry content.  Figure 4.1.1-1 shows a
Health Management Information System (HMIS) and a Mobile App querying the
Health Worker Registry using Find Matching Care Services \[ITI-90\].

![Simple Health Worker Registry](.//media/simple-practitioner-services.png)

**Figure 4.1.1-1: Simple Health Worker Registry**

Figure 4.1.1-2 shows the sequence of requests to and from the HMIS and
Mobile App to the Health Worker Registry.

![Simple Health Worker Registry Transaction Sequence](.//media/simple-practitioner-registry-sequence.png)

**Figure 4.1.1-2: Simple Health Worker Registry Transaction Sequence**

### 4.1.2 Federated Health Worker Registry

In a distributed environment, some aspects of the health workers are managed
in multiple systems so they need to be federated using Request Care Services Updates \[ITI-91\].  Some
systems may also need to pull full updates from the registry instead
of searching.  It will optionally include healthcare service content.

The following actors, transactions, and resources are be used.

* Actors (Options)
  * Care Services Selective Supplier
  * Care Services Update Supplier
  * Care Services Update Consumer
* Transactions
  * Find Matching Care Services \[ITI-90\]
  * Request Care Services Updates \[ITI-91\]
* Resources
  * `Practitioner`
  * `PractitionerRole`
  * `HealthcareService` ***Optional***

Other sources will act as a Care Services Selective Suppliers
to update the Health Worker Registry content.  Figure 4.1.3-1
shows a federated system of servers sending their content to a
Federated Health Worker Registry using Request Care Services Updates \[ITI-91\] and a mobile app querying
health worker data using Find Matching Care Services \[ITI-90\].  Each server can also pull the full
combined data set from the Health Worker Registry as a Care Services Update
Consumer as needed.

![Federated Health Worker Registry](.//media/federated-practitioner-services.png)

**Figure 4.1.2-1: Federated Health Worker Registry**

Figure 4.1.2-2 shows the sequence of requests to and from the Registry
and the various sources as well as a mobile app querying the entire data
set.

![Federated Health Worker Registry Transaction Sequence](.//media/federated-practitioner-registry-sequence.png)

**Figure 4.1.2-2: Federated Health Worker Registry Transaction Sequence**

# 5 Care Services Registry

Care Services Registries include data on facilities as well as
practitioners and can optionally include healthcare services.

## 5.1 Facilities and Jurisdictions

See the Facility Registry for [Facilities and Jurisdictions](#133-facilities-and-jurisdictions)

## 5.2 Implementations

### 5.2.1 Care Services Registry

In some instances, all the care services data would be combined into
a single central server for easier access.  In most cases this server
would pull data from various source servers (such as a Facility Registry
or Health Worker Registry) and link the resources together.  This registry
may also include healthcare service content.

The following actors, transactions, and resources are be used.

* Actors (Options)
  * Care Services Selective Supplier (Location Distance option)
  * Care Services Update Supplier (Location Distance option)
  * Care Services Update Consumer (Location Distance option)
* Transactions
  * Find Matching Care Services \[ITI-90\]
  * Request Care Services Updates \[ITI-91\]
* Resources
  * `Organization`
  * `Location`
  * `Practitioner`
  * `PractitionerRole`
  * `HealthcareService` ***Optional***

Other sources will act as a Care Services Selective Suppliers
to update the Care Services Registry content.  Figure 5.2.1-1
shows a federated system of servers sending their content to a
Federated Care Services Registry using Request Care Services Updates \[ITI-91\] and a mobile app querying
data using Find Matching Care Services \[ITI-90\].  Each server can also pull the full
combined data set from the Care Services Registry as a Care Services Update
Consumer as needed.

![Federated Care Services Registry](.//media/federated-care-registry-services.png)

**Figure 5.2.1-1: Federated Care Services Registry**

Figure 5.2.1-2 shows the sequence of requests to and from the Registry
and the various sources as well as a mobile app querying the entire data
set.

![Federated Care Services Registry Transaction Sequence](.//media/federated-care-registry-sequence.png)

**Figure 5.2.1-2: Federated Care Services Registry Transaction Sequence**
