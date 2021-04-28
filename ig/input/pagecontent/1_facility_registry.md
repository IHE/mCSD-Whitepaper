A developing country has decided to implement a Master Facility List
(MFL) based on recommendations from the WHO in the [MFL Resource
Package](https://www.who.int/healthinfo/country_monitoring_evaluation/mfl/en/). This resource includes a minimum data set to uniquely identify, location,
and contact a specific facility. Since this will be a single source of
information for the country, there may be differing hierarchies that
need to be supported for the facilities. For example, one hierarchy would
be the administrative hierarchy for the country (region, district,
county). Another would be the supply chain hierarchy where hubs may be
located separately from administrative regions. Yet another could be a
reporting hierarchy used to send data to health system managers, and on
up to international organizations.

This Master Facility List would need to support the following actors from mCSD.

1. Support the Care Services Selective Supplier Actor for the Location and 
Organization resources including the Location Distance option.

2. Support the Care Services Update Supplier Actor for the Location
and Organization resources including the Location Distance option.

3. Support the Care Services Update Consumer Actor for the Location 
and Organization resources including the Location Distance option.

The registry would also need to support the profiles for managing 
[Location](StructureDefinition-IHE.mCSD.FacilityLocation.html)
and [Organization](StructureDefinition-IHE.mCSD.FacilityOrganization.html)
resources for Facilities and [Location](StructureDefinition-IHE.mCSD.JurisdictionLocation.html)
and [Organization](StructureDefinition-IHE.mCSD.JurisdictionOrganization.html)
resources for Jurisdictions from mCSD.

See the example [Capability Statement](CapabilityStatement-IHE.mCSD.FacilityRegistry.html) for this Facility Registry.

