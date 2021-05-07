# InterLinked Registry

Table of Contents

* [Use Cases](#use-cases)
* [Facilities and Jurisdictions](#facilities-and-jurisdictions)
* [Options](#options)

## Use Cases

1. To support health system planning, resource management, and patient 
referral workflows, it will be important to be able to relate healthcare 
facilities with the health services that are provided there. An 
interlinked registry may be operationalized that leverages mCSD to 
cross-reference a code list of health services with the unique list of 
facility IDs. Such a cross reference may include information related to 
service provision availability (days and times of day).
    * **Solution Option:** [Federated InterLinked Registry with Services](#federated-interlinked-registry-with-services)


## Facilities and Jurisdictions

See the Facility Registry page for [Facilities and Jurisdictions](FacilityRegistry.md#facilities-and-jurisdictions)

## Options

### Simple InterLinked Registry

This simple InterLinked Registry can allow any searches on its interlinked 
data.  It will contain Location, Organization, Practitioner, 
and PractitionerRole data to reference mCSD Facilities and Jursidictions.  
The following actors, transactions, and profiled resources shall be used.

* Actors (Options)
  * Care Services Selective Supplier (Location Distance option)
* Transactions
  * ITI-90
* Resources
  * Organization
    * `http://profiles.ihe.net/ITI/mCSD/StructureDefinition/IHE.mCSD.JurisdictionOrganization`
    * `http://profiles.ihe.net/ITI/mCSD/StructureDefinition/IHE.mCSD.FacilityOrganization`
  * Location
    * `http://profiles.ihe.net/ITI/mCSD/StructureDefinition/IHE.mCSD.JurisdictionLocation`
    * `http://profiles.ihe.net/ITI/mCSD/StructureDefinition/IHE.mCSD.FacilityLocation`
    * `http://profiles.ihe.net/ITI/mCSD/StructureDefinition/IHE.mCSD.LocationDistance`
  * Practitioner
    * `http://profiles.ihe.net/ITI/mCSD/StructureDefinition/IHE.mCSD.Practitioner`
  * PractitionerRole
    * `http://profiles.ihe.net/ITI/mCSD/StructureDefinition/IHE.mCSD.PractitionerRole`


### Federated InterLinked Registry

In a more complicated environment, some aspects of the registry may
be managed in multiple systems so they need to be federated using ITI-91.
The following actors, transactions, and profiled resources shall be used.

* Actors (Options)
  * Care Services Selective Supplier (Location Distance option)
  * Care Services Update Supplier (Location Distance option)
  * Care Services Update Consumer (Location Distance option)
* Transactions
  * ITI-90
  * ITI-91
* Resources
  * Organization
    * `http://profiles.ihe.net/ITI/mCSD/StructureDefinition/IHE.mCSD.JurisdictionOrganization`
    * `http://profiles.ihe.net/ITI/mCSD/StructureDefinition/IHE.mCSD.FacilityOrganization`
  * Location
    * `http://profiles.ihe.net/ITI/mCSD/StructureDefinition/IHE.mCSD.JurisdictionLocation`
    * `http://profiles.ihe.net/ITI/mCSD/StructureDefinition/IHE.mCSD.FacilityLocation`
    * `http://profiles.ihe.net/ITI/mCSD/StructureDefinition/IHE.mCSD.LocationDistance`
  * Practitioner
    * `http://profiles.ihe.net/ITI/mCSD/StructureDefinition/IHE.mCSD.Practitioner`
  * PractitionerRole
    * `http://profiles.ihe.net/ITI/mCSD/StructureDefinition/IHE.mCSD.PractitionerRole`

### Simple InterLinked Registry with Services

This simple InterLinked Registry with Services can allow any searches on 
its interlinked data.  It will contain Location, Organization, Practitioner,
PractitionerRole, and HealthcareService data to reference mCSD Facilities 
and Jursidictions.  The following actors, transactions, and profiled 
resources shall be used.

* Actors (Options)
  * Care Services Selective Supplier (Location Distance option)
* Transactions
  * ITI-90
* Resources
  * Organization
    * `http://profiles.ihe.net/ITI/mCSD/StructureDefinition/IHE.mCSD.JurisdictionOrganization`
    * `http://profiles.ihe.net/ITI/mCSD/StructureDefinition/IHE.mCSD.FacilityOrganization`
  * Location
    * `http://profiles.ihe.net/ITI/mCSD/StructureDefinition/IHE.mCSD.JurisdictionLocation`
    * `http://profiles.ihe.net/ITI/mCSD/StructureDefinition/IHE.mCSD.FacilityLocation`
    * `http://profiles.ihe.net/ITI/mCSD/StructureDefinition/IHE.mCSD.LocationDistance`
  * Practitioner
    * `http://profiles.ihe.net/ITI/mCSD/StructureDefinition/IHE.mCSD.Practitioner`
  * PractitionerRole
    * `http://profiles.ihe.net/ITI/mCSD/StructureDefinition/IHE.mCSD.PractitionerRole`
  * HealthcareService
    * `http://profiles.ihe.net/ITI/mCSD/StructureDefinition/IHE.mCSD.HealthcareService`

### Federated InterLinked Registry with Services

This registry is based on the [Federated InterLinked 
Registry](#federated-interlinked-registry) but include data on healthcare 
services.  The following actors, transactions, and profiled resources 
shall be used.

* Actors (Options)
  * Care Services Selective Supplier (Location Distance option)
  * Care Services Update Supplier (Location Distance option)
  * Care Services Update Consumer (Location Distance option)
* Transactions
  * ITI-90
  * ITI-91
* Resources
  * Organization
    * `http://profiles.ihe.net/ITI/mCSD/StructureDefinition/IHE.mCSD.JurisdictionOrganization`
    * `http://profiles.ihe.net/ITI/mCSD/StructureDefinition/IHE.mCSD.FacilityOrganization`
  * Location
    * `http://profiles.ihe.net/ITI/mCSD/StructureDefinition/IHE.mCSD.JurisdictionLocation`
    * `http://profiles.ihe.net/ITI/mCSD/StructureDefinition/IHE.mCSD.FacilityLocation`
    * `http://profiles.ihe.net/ITI/mCSD/StructureDefinition/IHE.mCSD.LocationDistance`
  * Practitioner
    * `http://profiles.ihe.net/ITI/mCSD/StructureDefinition/IHE.mCSD.Practitioner`
  * PractitionerRole
    * `http://profiles.ihe.net/ITI/mCSD/StructureDefinition/IHE.mCSD.PractitionerRole`
  * HealthcareService
    * `http://profiles.ihe.net/ITI/mCSD/StructureDefinition/IHE.mCSD.HealthcareService`


