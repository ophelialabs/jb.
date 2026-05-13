// Google Maps JS API Loader 
        (g => {
            var h, a, k, p = "The Google Maps JavaScript API", c = "google", l = "importLibrary", q = "__ib__", m = document, b = window;
            b = b[c] || (b[c] = {});
            var d = b.maps || (b.maps = {}), r = new Set, e = new URLSearchParams, u = () => h || (h = new Promise(async (f, n) => {
                await (a = m.createElement("script"));
                e.set("libraries", [...r] + "");
                for (k in g) e.set(k.replace(/[A-Z]/g, t => "_" + t[0].toLowerCase()), g[k]);
                e.set("callback", c + ".maps." + q);
                a.src = `https://maps.${c}apis.com/maps/api/js?` + e;
                d[q] = f;
                a.onerror = () => h = n(ErrDRSor(p + " could not load."));
                a.nonce = m.querySelector("script[nonce]")?.nonce || "";
                m.head.append(a)
            }));
            d[l] ? console.warn(p + " only loads once. Ignoring:", g) : d[l] = (f, ...n) => r.add(f) && u().then(() => d[l](f, ...n))
        })({
            key: "AIzaSyDK7BXtZz4ypjq0yr-7FrrAcl3oCoPpxK8",
            v: "alpha"
        });

        // Main Globe Script
        const deviceMonitor = new DeviceMonitorService();
        const satelliteService = new SatelliteDataService();
        const groundStationService = new GroundStationService();
        let globe;
        let supervisor = new SupervisorAI();
        let quantumNetwork = new QuantumNetworkService();
        
        async function initGlobe() {
            const { Map } = await google.maps.importLibrary("maps");
            const { WebGLOverlayView } = await google.maps.importLibrary("webgl");

            globe = new Map(document.getElementById("globe-container"), {
                mapId: "YOUR_MAP_ID",
                center: { lat: 0, lng: 0 },
                zoom: 2,
                mapTypeId: 'satellite'
            });

            // Add click listener
            globe.addListener('click', async (event) => {
                const location = {
                    lat: event.latLng.lat(),
                    lng: event.latLng.lng()
                };
                const query = document.getElementById('query-input').value;
                if (query) {
                    const result = await supervisor.processQuery(query, location);
                    displayResult(result);
                }
            });

            // Add device monitor listener
            deviceMonitor.onDeviceChange((action, device) => {
                displayAlert({
                    title: `Device ${action}ed`,
                    message: `${device.type} - ${device.name} has been ${action}ed`,
                    type: 'info'
                });
            });

            // Initialize satellites
            const satellites = await satelliteService.fetchSatellites();
            const categorizedSats = satelliteService.categorizeByOrbit(satellites);
            
            // Add satellites to map
            Object.entries(categorizedSats).forEach(([orbit, sats]) => {
                sats.forEach(sat => {
                    new google.maps.Marker({
                        position: { lat: sat.lat, lng: sat.lng },
                        map: globe,
                        icon: createSatelliteMarker(orbit),
                        title: sat.name
                    });
                });
            });

            // Add ground stations
            groundStationService.stations.forEach(station => {
                new google.maps.Marker({
                    position: { lat: station.lat, lng: station.lng },
                    map: globe,
                    icon: createGroundStationMarker(),
                    title: station.name
                });
            });

            // Add Chattanooga quantum node
            const chattanooga = quantumNetwork.chattanooga;
            const quantumMarker = new google.maps.Marker({
                position: { lat: chattanooga.lat, lng: chattanooga.lng },
                map: globe,
                icon: createQuantumNodeMarker(),
                title: chattanooga.name
            });

            // Add quantum network links
            const links = quantumNetwork.getQuantumLinks();
            links.forEach(link => {
                const path = new google.maps.Polyline({
                    path: [
                        { lat: link.source.lat, lng: link.source.lng },
                        { lat: link.target.lat, lng: link.target.lng }
                    ],
                    geodesic: true,
                    strokeColor: '#7e22ce',
                    strokeOpacity: 0.8,
                    strokeWeight: 2,
                    icons: [{
                        icon: {
                            path: 'M 0,-1 0,1',
                            strokeOpacity: 1,
                            scale: 4
                        },
                        offset: '0',
                        repeat: '20px'
                    }],
                    map: globe
                });
            });

            // Add click listener for quantum node
            quantumMarker.addListener('click', () => {
                const state = quantumNetwork.getNetworkState();
                displayResult({
                    title: 'Quantum Network Status',
                    message: `
                        Node: ${chattanooga.name}
                        Status: ${state.nodeStatus}
                        Entanglement Rate: ${state.entanglementRate}
                        QKD Rate: ${state.qkdRate}
                        Fidelity: ${state.fidelity}
                    `,
                    type: 'quantum'
                });
            });
        }

        function displayResult(result) {
            // Create and show result in the alerts section
            const alertsList = document.querySelector('.alert-list');
            const alertItem = document.createElement('div');
            alertItem.className = 'alert-item';
            alertItem.innerHTML = `
                <div class="alert-content">
                    <div class="alert-details">
                        <div class="alert-title">${result.title}</div>
                        <div class="alert-message">${result.message}</div>
                        <div class="alert-timestamp">${new Date().toLocaleString()}</div>
                    </div>
                </div>
            `;
            alertsList.prepend(alertItem);
        }

        function createSatelliteMarker(orbitType) {
            return {
                path: google.maps.SymbolPath.CIRCLE,
                scale: 6,
                fillColor: orbitType === 'LEO' ? '#ff4444' : 
                          orbitType === 'MEO' ? '#44ff44' : '#4444ff',
                fillOpacity: 1,
                strokeWeight: 2,
                strokeColor: '#ffffff'
            };
        }

        function createGroundStationMarker() {
            return {
                path: google.maps.SymbolPath.CIRCLE,
                scale: 10,
                fillColor: '#ffff00',
                fillOpacity: 1,
                strokeWeight: 3,
                strokeColor: '#ffffff'
            };
        }

        function createQuantumNodeMarker() {
            return {
                path: google.maps.SymbolPath.CIRCLE,
                scale: 12,
                fillColor: '#7e22ce',
                fillOpacity: 1,
                strokeWeight: 3,
                strokeColor: '#ffffff'
            };
        }

        initGlobe();