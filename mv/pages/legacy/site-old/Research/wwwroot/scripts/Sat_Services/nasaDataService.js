class NasaDataService {
    constructor() {
        this.NASA_DATA_GOV_API = 'YOUR_NASA_DATA_GOV_API_KEY';
        this.EARTH_DATA_API = 'YOUR_EARTHDATA_API_KEY';
    }

    async fetchDatasetByLocation(lat, lng, dataset) {
        const response = await fetch(`https://api.nasa.gov/data/${dataset}?lat=${lat}&lon=${lng}&api_key=${this.NASA_DATA_GOV_API}`);
        return await response.json();
    }

    async getEarthData(dataset, parameters) {
        const response = await fetch(`https://earthdata.nasa.gov/api/${dataset}`, {
            headers: {
                'Authorization': `Bearer ${this.EARTH_DATA_API}`,
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(parameters)
        });
        return await response.json();
    }
}
