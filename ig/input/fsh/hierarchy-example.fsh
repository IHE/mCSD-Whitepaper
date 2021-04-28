Alias: $ORGTYPE = http://hl7.org/fhir/R4/codesystem-organization-type.html
Alias: $HIERARCHY = https://profiles.ihe.net/ITI/mCSD/StructureDefinition/IHE.mCSD.OrganizationHierarchy

Instance:     FacilityHierarchyExample
InstanceOf:   MCSDFacilityOrganization
Title:        "Example of an organization facility with multiple hierarchies."

* id = "mcsd-example-facility"
* name = "Example Facility"
* type[+] = urn:ietf:rfc:3986#urn:ihe:iti:mcsd:2019:facility
* type[+] = $ORGTYPE#prov
* extension[$HIERARCHY][0].extension[hierarchy-type].valueCodeableConcept = http://example.org/types#admin
* extension[$HIERARCHY][0].extension[part-of].valueReference = Reference(MCSDOrganization/mcsd-example-jurisdiction)
* extension[$HIERARCHY][1].extension[hierarchy-type].valueCodeableConcept = http://example.org/types#supply
* extension[$HIERARCHY][1].extension[part-of].valueReference = Reference(MCSDOrganization/mcsd-example-supplychain)
