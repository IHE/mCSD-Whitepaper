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
* [6 InterLinked Registry](#6-interlinked-registry)

# 1 Introduction

The HL7® FHIR® (Fast Healthcare Interoperability Resources) standard defines how healthcare information can be exchanged between different systems. The FHIR standard defines data structures, termed 'resources' -- like Patient, Diagnostic Result, and Care Plan -- and how these resources can be exchanged using common Web protocols. 

A guiding tenant of the evolving FHIR standard is that 80% of interoperability use cases should be satisfied out-of-the-box by any combination of the more than 130 base resources. 

Profiles address diverse use cases, such as domain-specific ones like oncology, specific deployments like a patient identity registry, and local requirements such as incorporating legal definitions of marital status and race into data dictionaries. A simple use case, like a case report, up to a large use case like adapting FHIR to an entire country healthcare system, may be profiled from the base FHIR resources. Aspects of consent, security, and privacy are also embodied in profiles. 

Integrating the Health Enterprise (IHE) supports the open, consensus-driven development of profiles for FHIR resources and other healthcare specifications. The profiling of base resources for use cases are increasingly specified in machine-computable FHIR Implementation Guides (IGs). The terms 'profile' and 'implementation guide' may be used interchangeably, though profiles for FHIR are specified in Implmentation Guides.

This paper outlines the [Mobile Care Services Discovery (mCSD profile)](https://www.ihe.net/uploadedFiles/Documents/ITI/IHE_ITI_Suppl_mCSD.pdf) which is designed to help implementation of services discovery using registries. A core need in health information exchange is to have common, authoritative registries of locations, organizations, jurisdictions, practitioners, and the roles and services they offer. These services can then be discoverable. 

For example, an electronic medical records (EMR) system with with ability to perform care services discovery can help patients get the care they need, from a licensed practitioner, in a location where it is provided. The uses of registries are not limited to patient clinical support; a care services platform can support aggregate and patient-level indicator reporting and case-based surveillance, targeting communities for epidemic control, and underlying requirements for health financing mechanisms. A care services discovery platform enables though is not sufficient for the above use cases. 

This paper further outlines several use cases that can be adapted to many contexts, including creating facilities and health worker registries. This document is not a substitute for the machine-computable IGs, but rather is complementary.

The [Integrating the Healthcare Enterprise (IHE)](http://www.ihe.net) 
standards profiling organization has developed the 

which can be leveraged for use in various FHIR based registry scenarios, 
for example, a Facility Registry or a Health Worker Registry.

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

2. To support health system planning, resource management, and patient 
referral workflows, it will be important to be able to relate healthcare 
facilities with the health services that are provided there. An 
interlinked registry may be operationalized that leverages mCSD to 
cross-reference a code list of health services with the unique list of 
facility IDs. Such a cross reference may include information related to 
service provision availability (days and times of day).

3. A Health Worker Registry could be operationalized by collecting and 
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

4. Monitor functioning facilities, e.g. when buildings are operational, 
construction teams, infrastructure, maintenance, then share that 
information with the public. There is a need to immediately view services,
openings, closures.

5. View the allocation of human resources (assuming this includes services).

6. A common problem is that multiple data systems are collecting 
information about facilities. For example, in one country, there are 
6 DHIS2 platforms that are not aligned, and are struggling to maintain 
metadata.

7. A way is needed to integrate some regular, large data collections 
(HHFA) from surveys which visit all facilities in the country, and these 
data sources are not connected to the maintenance of the facilities. One 
should be able to integrate information from large data collection.

8. Aggregate Data Collection
    * Problem statement
        * In this use case, a donor invests in vertical public health programs across many countries. The donor has a multi-country dashboard and analytics platform that aggregates data and tracks progress from the program's outcomes at the facility level.
        * Thus, there are within-country facility IDs issued by the ministry of health , and IDs for facilities used by the multi-country analytics platform.
        * IDs may change, administrative hierarchies may split, and facilities may drop or be added over time.

    * Solution is record linkage
        * The need that the facility ID used within-country should be linked to a multi-country ID, and be updateable.
        * This is similar to the concept of a client (patient) registry, but for record linkage between organizations, locations, and healthcare services in FHIR types.



# 3 Facility Registry

## 3.1 From MHDS-IPS based HIE

***Pulled from MHDS-IPS HIE doc, needs to be targeted for this white paper***

This spec expects to leverage a FHIR-capable data store as its Interlinked Registry
(ILR). The ILR will act as the Facility Registry (ILR-FR) and will be populated by one
 or more underlying facility directories (FD) as defined by the IHE mCSD Profile. As
 was described in the HMIS section, DHIS2 will act as at least one of the FDs to populate the ILR-FR.

For the purposes of conformance to this spec, an ILR-FR shall be able to:

1. Play the role of a Care Services Selective Supplier and support queries for Facilities (Location resources), Health Services, Organizations, and PractitionerRole resources via the ITI-90 transaction, as a responder.

2. Play the role of a Care Services Update Consumer and support requests for care services updates via transaction ITI-91, as an initiator.

3. As a Care Services Selective Supplier, support the Location Distance Option.

For the purposes of conformance to Blueprint v3, an FD shall be able to:

1. Play the role of a Care Services Update Supplier and support Facility (and, optionally, Organization, PractitionerRole and HealthcareService resource) refresh queries using the ITI-91 transaction.

As a mandatory functional capability, the ILR-FR shall be able to be updated to establish relationships between facilities, organizations and health services via the creation or updating of PractitionerRole resources. For each unique combination of organization and facility (location), a PractitionerRole resource shall be created that references all the applicable HealthcareService resources for the facility. Where these relationships have been established, they shall persist and be updated based on the results of subsequent ITI-91 transactions.

It is expected that the ILR-FR will be refreshed on a regular basis from the underlying directories using the ITI-91 transaction (which can run as part of a scheduled batch operation). It is also expected that the ILR will be updated and manually refreshed as a SARA survey (based on the WHO Service Availability and [Readiness Assessment](https://www.who.int/healthinfo/systems/sara_introduction/en/) instrument) is conducted with each facility at least once over the course of each calendar year. The survey results – when they are collected – will be manually updated to one or more FDs or manually updated to the ILR, directly.

### Facility type codes

The list of facility type codes shall adhere to the facility types defined by the WHO’
s Service Availability and Readiness Assessment (SARA, version 2.2). Facilities shall
be defined using FHIR Location resources; there will be one Location resource for each
 distinct facility.

There shall be four type codes persisted for each facility, one for each of the four f
acility type questions on the SARA. Each of these types shall be persisted in the Loca
tion.type element and will indicate, respectively:

1. Type of facility (question 007 on the SARA)

2. Type of managing authority (008)

3. Rural or urban (009)

4. Outpatient only or both outpatient and inpatient (010)

For type of facility, the code shall be one of:

* 007.1 GENERAL/STATE/DISTRICT HOSPITAL

* 007.2 TOWNSHIP/SUB-TOWNSHIP/STATION HOSPITAL

* 007.3 SPECIALIZED HOSPITAL

* 007.4 RHC/UHC

* 007.5 SUB-RHC

* 007.96 OTHER

For the type of managing authority, the code shall be one of:

* 008.1 GOVERNMENT/PUBLIC

* 008.2 NGO/NOT-FOR-PROFIT

* OO8.3 PRIVATE-FOR-PROFIT

* 008.4 MISSION/FAITH-BASED

* 008.96 OTHER

For the type of managing authority, the code shall be one of:

* 008.1 GOVERNMENT/PUBLIC

* 008.2 NGO/NOT-FOR-PROFIT

* OO8.3 PRIVATE-FOR-PROFIT

* 008.4 MISSION/FAITH-BASED

* 008.96 OTHER

For the rural / urban type the code shall be one of:

* 009.1 URBAN

* 009.2 RURAL

For the outpatient or both type the code shall be one of:

* 010.1 OUTPATIENT

* 010.2 OUTPATIENT AND INPATIENT

### Health service type codes

Regarding the code list for health services, the WHO’s Service Availability and Readiness Assessment will be used as the definitive source of service type codes. The health services shall be identified by FHIR HealthcareService resources; the HealthcareService.identifier for each unique service shall be the SARA question number (e.g. 700, FAMILY PLANNING SERVICES). For sub-services, the question and sub-question will be concatenated and separate by a period (e.g. 701.01, Combined estrogen progesterone oral contraceptive pills). For each HealthcareService, the description shall be persisted in the HealthcareService.category element.

At a minimum, the following HealthcareService resources shall be defined (identifier and category):

* 700, Family planning

* 800, Antenatal care

* 900, Prevention of mother-to-child transmission (PMTCT) of HIV

* 1000, Obstetric and newborn care

* 1009, Caesarean section

* 1100, Immunization

* 1200, Child health preventative and curative care

* 1300, Adolescent health services

* 1400, HIV counselling and testing

* 1500, HIV treatment

* 1600, HIV care and support services

* 1700, Sexually transmitted infections diagnosis or treatment

* 1800, Tuberculosis services

* 1900, Malaria diagnosis or treatment

* 2000, Noncommunicable diseases diagnosis or management

* 2100, Surgical services

* 2200, Blood transfusion services

* 3000, Diagnostic services

* 4000, Medicines and commodities


# 4 Health Worker Registry
## 4.1 From MHDS-IPS based HIE
***Pulled from MHDS-IPS HIE doc, needs to be targeted for this white paper***

This spec will leverage a FHIR-capable data store as its Interlinked Registry (ILR). The ILR will act as the Health Worker Registry (ILR-HWR) and will be populated by one or more underlying health worker directories (HWD) as defined by the IHE mCSD Profile. It is expected that an mCSD-capable health worker database such as [iHRIS](https://www.ihris.org/) will act as at least one of the HWDs to populate the ILR-HWR.

For the purposes of conformance to this spec, an ILR-HWR shall be able to:

1. Play the role of a Care Services Selective Supplier and support queries for Practitioners, Facilities (Location resources), Health Services, Organizations, and PractitionerRole resources via the ITI-90 transaction, as a responder.

2. Play the role of a Care Services Update Consumer and support requests for care services updates via transaction ITI-91, as an initiator.

3. As a Care Services Selective Supplier, support the Location Distance Option.

For the purposes of conformance to this spec, an HWD shall be able to:

1. Play the role of a Care Services Update Supplier and support Practitioner (and, optionally, Organization, PractitionerRole and HealthcareService resource) refresh queries using the ITI-91 transaction.

As a mandatory functional capability, the ILR-HWR shall be able to be updated to establish relationships between practitioners, facilities, organizations and health services via the creation or updating of PractitionerRole resources. For each unique combination of organization, facility and practitioner, a PractitionerRole resource shall be created that references all the applicable HealthcareService resources provided by the practitioner at the facility under the auspices of the organization. Where these relationships have been established, they shall persist and be updated based on the results of subsequent ITI-91 transactions.

### Health worker type codes

The list of health worker type codes shall adhere to the health worker types defined by the WHO’s Service Availability and Readiness Assessment (SARA, version 2.2). Health workers shall be defined using FHIR practitioner resources; there will be one practitioner resource for each distinct health worker.  The health worker’s type shall be persisted in the practitioner.qualification.code element and be one of (code and description):

* 200.01 Generalist (non-specialist) medical doctor

* 200.02 Specialist medical doctor

* 200.03 Non-physician clinicians/paramedical professionals

* 200.04 Nursing professionals (NS, Matron)

* 200.05 Midwifery professionals

* 200.08 Pharmacists/compounders

* 200.11 Laboratory technicians (medical and pathology)

* 200.MR_01 Basic Health Services Professional (THA, HA1, HA, PHS1, PHS2)

# 5 Care Services Registry
# 6 InterLinked Registry



