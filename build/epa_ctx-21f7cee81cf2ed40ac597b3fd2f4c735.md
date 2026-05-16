A practical example of using the EPA's Computational Toxicology and Exposure (CTX) API is to programmatically retrieve the toxicity data (ToxCast bioactivity) for a specific chemical using its standard EPA identifier, the DSSTox Substance ID (DTXSID). 
This example uses Python to send an HTTP GET request to the API, retrieve the data in JSON format, and then processes it. The EPA also provides a Python library called ctx-python which simplifies this process, as shown in the snippets below. 
Example 1: Using ctx-python Library
This approach is highly recommended by the EPA as it handles the API calls and data processing for you. 
python
import ctxpy as ctx

# Start an instance of the Exposure class
expo = ctx.Exposure()

# Retrieve data for Bisphenol A (DTXSID7020182) from the Chemical and Products Database (CPDat)
# 'puc' stands for Product Use Categories
result = expo.search_cpdat(vocab_name='puc', dtxsid='DTXSID7020182')

# Print the retrieved data
print(result)
Use code with caution.

 
Example 2: Using Raw HTTP Request (for a single chemical's details)
If you are not using Python or prefer raw API calls, you can make a standard HTTP GET request. This example retrieves basic chemical identifiers for Toluene.



