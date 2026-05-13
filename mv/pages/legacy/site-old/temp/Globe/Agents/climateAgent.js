class ClimateAgent {
    async processRequest(query, location, dataService) {
        const climateData = await dataService.fetchDatasetByLocation(
            location.lat,
            location.lng,
            'climate_dataset'
        );

        return {
            title: 'Climate Analysis',
            message: this.formatClimateResponse(climateData, query),
            type: 'climate'
        };
    }

    formatClimateResponse(data, query) {
        // Format the climate data based on the query
        return `Temperature: ${data.temperature}°C, Humidity: ${data.humidity}%`;
    }
}
