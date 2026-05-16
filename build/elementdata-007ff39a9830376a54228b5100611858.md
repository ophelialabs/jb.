Complete JSON datasets for all 118 chemical elements can be readily found on platforms like GitHub or accessed via public APIs.
Recommended Datasets on GitHub
The most well-known and comprehensive GitHub repository for periodic table data in JSON format is Bowserinator/Periodic-Table-JSON. 
Repository: https://github.com/Bowserinator/Periodic-Table-JSON
File: The primary file is typically named PeriodicTableJSON.json or similar within the repository.
Key features:
Includes all 118 elements.
Provides extensive properties (atomic number, symbol, name, atomic mass, electronic configuration, density, melting point, boiling point, etc.).
Temperatures are in Kelvin, densities in g/L (gases) or g/cm³ (solids/liquids), and molar heat in J/(mol·K).
Missing information is represented as null.
Each element includes a summary from Wikipedia and a source link. 
Other notable GitHub repositories with element data include:
Exabyte-io/periodic-table: Data arranged in JSON format.
andrejewski/periodic-table: Provides data useful for JavaScript accessors.
AlexGustafsson/molecular-data: Localized, extended periodic table data in JSON, CSV, YAML, XML, and Plist formats. 
Public APIs for Element Data
If you need to access data dynamically without managing a local JSON file, several public APIs are available:
Dedolist Periodic Table API: Provides detailed information for all elements via a simple REST API endpoint.
Endpoint for all data: https://api.dedolist.com/api/v1/science/periodic-table-detailed/
Neelpatel05 Periodic Table API: An API built with Flask and Go for fetching element data.
Endpoint for all data: https://neelpatel05.pythonanywhere.com/
You can also query by atomic number or symbol.
APIVerve Periodic Table API: A more comprehensive, but potentially rate-limited, API that requires an API key for usage. 
These resources offer complete datasets that can be easily integrated into your projects.

National Institute of Standards and Technology (NIST)
NIST provides highly reliable, critically-evaluated scientific data. While they do not have a single, simple REST API that returns the entire periodic table in one JSON object like some third-party services, they offer programmatic access to their detailed physics and chemistry data through specific services: 
Elemental Data Index: This service provides access to NIST's various online databases organized by element.
Data available: Atomic spectroscopy data, X-ray absorption data, nuclear data, and fundamental physical constants.
Access: The data is generally retrieved by selecting an element name or atomic number through web forms, which can be interacted with programmatically.
Main Page: https://www.nist.gov/pml/elemental-data-index 
Environmental Protection Agency (EPA)
The EPA provides APIs focused on chemical properties, toxicology, and exposure data, which are part of their CompTox Chemicals Dashboard. 
Computational Toxicology and Exposure (CTX) APIs: These APIs allow users to programmatically access data on over 900,000 chemicals.
Data available: Chemical properties, toxicity information, exposure data, and more.
Access: Access to these APIs is publicly available, but requires a free API key for use. The API keys are managed through api.data.gov, which is a shared service for federal agencies.
Main Page: https://www.epa.gov/comptox-tools/computational-toxicology-and-exposure-apis 
Other Government Sources
PubChem (NIH): The National Institutes of Health (NIH) hosts PubChem, a massive database of chemical molecules and their properties, which provides robust APIs for programmatic access to a wealth of chemical information.
Data.gov: The official U.S. government open data portal acts as an aggregator and a catalog of datasets and APIs from across all federal agencies. Searching this catalog for "periodic table" or "elements" can lead to specific datasets, such as a dataset containing "NIST critically-evaluated data on atomic properties of the elements". 

In addition to government sources like the EPA and NIST, the field of chemistry information is supported by a wide array of public, academic, and commercial data sources and software tools. These resources cater to different needs, from basic property lookups to advanced drug discovery research and computational analysis. 
Public and Academic Databases
PubChem (NIH): The world's largest collection of freely accessible chemical information, covering substances, compounds, their biological activities, patents, and safety data. It's an excellent starting point for general chemical information.
ChemSpider (Royal Society of Chemistry - RSC): A free chemical structure database providing rapid text and structure searching for over 100 million structures, integrating data from hundreds of sources.
ChEMBL (EMBL-EBI): A manually curated database of bioactive molecules with drug-like properties, focusing on chemical, bioactivity, and genomic data to aid drug discovery.
NIST Chemistry WebBook: A comprehensive source for thermochemical data, reaction thermochemistry, and various spectra (IR, mass, UV/Vis, etc.) for thousands of compounds.
Crystallography Open Database (COD): An open-access collection of crystal structures of organic, inorganic, and metal-organic compounds.
Spectral Database for Organic Compounds (SDBS): A free, integrated spectral database system (EI-MS, FT-IR, H-NMR, C-NMR, etc.) for organic compounds, hosted by the National Institute of Advanced Industrial Science and Technology (AIST), Japan.
DrugBank: A unique bioinformatics and cheminformatics resource that combines detailed drug data with comprehensive drug target information. 
Commercial Databases and Platforms
SciFinder-n (Chemical Abstracts Service - CAS): A comprehensive, subscription-based tool providing access to the world's largest and most authoritative collection of chemical information, including over 279 million substances and 150 million reactions, along with extensive literature and patent data.
Reaxys (Elsevier): A powerful, subscription-based platform that combines information from the Beilstein (organic) and Gmelin (inorganic) handbooks with patent data, offering substance, reaction, and property information.
Merck Index Online: A classic ready-reference source containing monographs on drugs, chemicals, and biologicals.
Knovel Critical Tables & SpringerMaterials: Online interactive handbooks and databases for engineering and physical/chemical property data. 
Software Tools and Libraries
RDKit: A widely used open-source cheminformatics toolkit with C++ and Python bindings, offering functions for molecule representation, descriptor calculation, substructure searching, and machine learning integration.
Open Babel: A versatile, open-source chemical toolbox for converting between different chemical file formats and for general chemical data analysis.
DataWarrior: A free data visualization and analysis program with embedded cheminformatics functionality for interactive data exploration.
RDKit PostgreSQL Cartridge: An extension that allows integration of cheminformatics functionalities directly within a PostgreSQL database environment. 


Advanced cheminformatics analysis leverages sophisticated computational methods to interpret complex chemical data, primarily for applications in drug discovery, materials science, and environmental chemistry. 
Key advanced techniques include:
Machine Learning and AI
The integration of Artificial Intelligence (AI) and Machine Learning (ML) has been transformative, moving beyond traditional statistical models to deep learning approaches. 
Deep Learning (DL): Techniques such as Convolutional Neural Networks (CNNs) and Recurrent Neural Networks (RNNs) are used to analyze complex 2D and 3D molecular structures and sequential data like SMILES strings. Graph Convolutional Networks (GCNs), which operate on molecular graphs, are particularly advanced for learning features from a molecule's neighborhood.
Generative Models: Variational Autoencoders (VAEs) and Generative Adversarial Networks (GANs) are employed for de novo drug design, automatically generating novel molecular structures with desired properties (e.g., specific potency, low toxicity).
Ensemble Methods: Techniques like Random Forests combine multiple decision trees to improve the accuracy and robustness of predictions for properties such as toxicity or bioactivity. 
Molecular Modeling and Simulation
These techniques aim to accurately simulate molecular behavior based on physical principles. 
Molecular Dynamics (MD) Simulations: Used to simulate the physical movements of atoms and molecules over time, providing insights into stability, conformational changes, and interactions in a biological environment.
Free Energy Calculations: Advanced methods, often coupled with MD simulations, to provide highly accurate estimates of binding affinities between drug candidates and their targets.
Multi-scale Modeling: Combining different levels of theory, such as quantum mechanics (QM) and molecular mechanics (MM), to accurately model complex chemical systems across different scales. 
Predictive Modeling (QSAR/QSPR)
Quantitative Structure-Activity Relationships (QSAR) and Quantitative Structure-Property Relationships (QSPR) models are a cornerstone of cheminformatics for predicting biological activities or physical properties from chemical structures. 
Advanced Descriptors: Utilizing 3D and 4D descriptors (which incorporate spatiotemporal aspects and conformational changes) that capture more nuanced molecular information than traditional 2D descriptors.
Virtual Screening (VS): Involves computationally screening large chemical libraries to identify potential "hits." This includes:
Ligand-Based Virtual Screening (LBVS): Uses known active molecules (via fingerprints, shape, or pharmacophores) to find similar compounds.
Structure-Based Virtual Screening (SBVS): Uses molecular docking algorithms to predict how well a molecule will bind to a target protein structure. 
Data Analysis and Interpretation
Dimensionality Reduction: Techniques like Principal Component Analysis (PCA) and Partial Least Squares (PLS) are crucial for handling large, high-dimensional datasets and extracting the most informative features to prevent model overfitting and improve interpretability.
Explainable AI (XAI): As AI models become more complex ("black boxes"), techniques like SHAP (Shapley Additive Explanations) and LIME (Local Interpretable Model-Agnostic Explanations) are used to understand which specific atomic features or fragments contribute most to a given prediction.
Heterogeneous Graphs: Used to integrate complex relationships between diverse data types, such as molecules, proteins, and disease states, enabling holistic analysis of biological systems. 

From molecules to data: the emerging impact of chemoinformatics in ...
Aug 6, 2025 — Drug discovery and development. ... Virtual screening, a technique that uses computational models to predict the biolog...

Journal of Cheminformatics

Recent Advances in Machine-Learning-Based ... - MDPI
Jul 14, 2023 — * 1. Introduction. In 1998, the term “chemoinformatics”, coined by Frank K. Brown, was intended to hasten drug discove...

MDPI

From molecules to data: the emerging impact of chemoinformatics in ...
Aug 6, 2025 — Advancements and emerging trends in chemoinformatics * Artificial intelligence and machine learning. One of the most tr...

National Institutes of Health (.gov)

