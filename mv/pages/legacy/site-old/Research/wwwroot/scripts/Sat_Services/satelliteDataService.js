class SatelliteDataService {
    constructor() {
        this.NASA_API_KEY = 'YOUR_NASA_API_KEY';
        this.orbitTypes = {
            LEO: { minAltitude: 160, maxAltitude: 2000 },
            MEO: { minAltitude: 2000, maxAltitude: 35786 },
            GEO: { minAltitude: 35786, maxAltitude: 35786 }
        };
    }

    async fetchSatellites() {
        const response = await fetch(`https://data.nasa.gov/api/views/satellites/data?api_key=${this.NASA_API_KEY}`);
        return await response.json();
    }

    categorizeByOrbit(satellites) {
        return {
            LEO: satellites.filter(sat => sat.altitude <= this.orbitTypes.LEO.maxAltitude),
            MEO: satellites.filter(sat => 
                sat.altitude > this.orbitTypes.MEO.minAltitude && 
                sat.altitude < this.orbitTypes.MEO.maxAltitude
            ),
            GEO: satellites.filter(sat => sat.altitude >= this.orbitTypes.GEO.minAltitude)
        };
    }
}
