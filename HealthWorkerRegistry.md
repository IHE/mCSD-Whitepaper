# Health Worker Registry

Table of Contents

* [Use Cases](#use-cases)
* [Options](#options)

## Use Cases

1. A Health Worker Registry could be operationalized by collecting and 
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
    * **Solution Option:** [Federated Health Worker Registry](#federated-health-worker-registry)

2. View the allocation of human resources (assuming this includes services).
    * **Solution Option:** [Federated Health Worker Registry with Services](#federated-health-worker-registry-with-services)

## Options

### Simple Health Worker Registry

This simple Health Worker Registry can allow any searches on its 
practitioner data.  It will contain Practitioner and PractitionerRole
data. The following actors, transactions, and profiled resources shall 
be used.

* Actors (Options)
  * Care Services Selective Supplier (Location Distance option)
* Transactions
  * ITI-90
* Resources
  * Practitioner
    * `http://profiles.ihe.net/ITI/mCSD/StructureDefinition/IHE.mCSD.Practitioner`
  * PractitionerRole
    * `http://profiles.ihe.net/ITI/mCSD/StructureDefinition/IHE.mCSD.PractitionerRole`


### Federated Health Worker Registry

In a more complicated environment, some aspects of the health workers may
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
  * Practitioner
    * `http://profiles.ihe.net/ITI/mCSD/StructureDefinition/IHE.mCSD.Practitioner`
  * PractitionerRole
    * `http://profiles.ihe.net/ITI/mCSD/StructureDefinition/IHE.mCSD.PractitionerRole`

### Simple Health Worker Registry with Services

This simple Health Worker Registry with Services can allow any searches on 
its health worker data.  It will contain Practitioner, PractitionerRole, 
and HealthcareService data.  The following actors, transactions, and 
profiled resources shall be used.

* Actors (Options)
  * Care Services Selective Supplier (Location Distance option)
* Transactions
  * ITI-90
* Resources
  * Practitioner
    * `http://profiles.ihe.net/ITI/mCSD/StructureDefinition/IHE.mCSD.Practitioner`
  * PractitionerRole
    * `http://profiles.ihe.net/ITI/mCSD/StructureDefinition/IHE.mCSD.PractitionerRole`
  * HealthcareService
    * `http://profiles.ihe.net/ITI/mCSD/StructureDefinition/IHE.mCSD.HealthcareService`

### Federated Health Worker Registry with Services

This registry is based on the [Federated Health Worker 
Registry](#federated-health-worker-registry) but include data on healthcare 
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
  * Practitioner
    * `http://profiles.ihe.net/ITI/mCSD/StructureDefinition/IHE.mCSD.Practitioner`
  * PractitionerRole
    * `http://profiles.ihe.net/ITI/mCSD/StructureDefinition/IHE.mCSD.PractitionerRole`
  * HealthcareService
    * `http://profiles.ihe.net/ITI/mCSD/StructureDefinition/IHE.mCSD.HealthcareService`
