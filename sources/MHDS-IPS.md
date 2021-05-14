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


