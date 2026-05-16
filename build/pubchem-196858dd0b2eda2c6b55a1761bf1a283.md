The PubChem API, specifically through its PUG-REST and PUG-View services, provides access to a wide range of standard periodic table properties for all known chemical elements. 
Available Data for the Periodic Table 
Data can be retrieved on a per-element basis or as a comprehensive dataset for all elements. Key properties available include: 
Identifiers: Element name, symbol, and atomic number.
Fundamental Properties: Atomic mass (often given as a range based on isotopic abundance from IUPAC/NIST data), standard state (solid, liquid, gas).
Electronic Properties: Electron configuration, oxidation states, electronegativity (Pauling scale), ionization energy, and electron affinity.
Physical Properties: Melting point, boiling point, and density.
Structural Information: Atomic radius (van der Waals).
Historical Information: Year of discovery.
Cross-References: Links to information sources (e.g., NIST, IUPAC, Los Alamos National Lab) and related PubChem records (substances, compounds, assays).
Descriptive Information: A general summary/description of the element, its uses, and health/safety data. 
Access Methods
PUG-REST (for bulk data): You can download a CSV or JSON file containing core properties for all elements using a direct PUG-REST URL:
https://pubchem.ncbi.nlm.nih.gov/rest/pug/periodictable/CSV
https://pubchem.ncbi.nlm.nih.gov/rest/pug/periodictable/JSON
PUG-View (for detailed, annotated data): For more in-depth information and annotations from third-party sources for a specific element, the PUG-View service is used.
Example for Hydrogen (atomic number 1): https://pubchem.ncbi.nlm.nih.gov/rest/pug_view/data/element/1/JSON 
This extensive data allows for programmatic access to build applications, perform data analysis, or create educational tools related to chemical elements. 

1. Give me an example of retrieving detailed data for an element using PUG-View
2. What are some recommended Python libraries for accessing PubChem