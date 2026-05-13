// Category to element type mapping
const categoryMap = {
    'alkali metal': 'alkali',
    'alkaline earth metal': 'alkaline',
    'transition metal': 'transition',
    'lanthanide': 'lanthanide',
    'actinide': 'actinide',
    'post-transition metal': 'metal',
    'metalloid': 'semimetal',
    'nonmetal': 'nonmetal',
    'halogen': 'halogen',
    'noble gas': 'noble',
    'diatomic nonmetal': 'nonmetal'
};

// Get element type class
function getElementType(category) {
    const categoryLower = category.toLowerCase();
    for (const [key, value] of Object.entries(categoryMap)) {
        if (categoryLower.includes(key)) {
            return value;
        }
    }
    return 'nonmetal';
}

// Create periodic table grid
function createPeriodicTable(elements) {
    const table = document.getElementById('periodicTable');
    table.innerHTML = '';

    elements.forEach(element => {
        const el = document.createElement('div');
        el.className = `element ${getElementType(element.category)}`;
        el.style.gridColumn = element.xpos;
        el.style.gridRow = element.ypos;

        const content = document.createElement('div');
        content.className = 'element-content';
        content.innerHTML = `
            <div class="element-number">${element.number}</div>
            <div class="element-symbol">${element.symbol}</div>
            <div class="element-name">${element.name}</div>
        `;

        el.appendChild(content);
        el.addEventListener('click', () => openModal(element));
        table.appendChild(el);
    });
}

// Format value with unit
function formatValue(value, unit = '') {
    if (value === null || value === undefined) {
        return 'N/A';
    }
    if (typeof value === 'number') {
        return `${value.toFixed(2)}${unit ? ' ' + unit : ''}`;
    }
    return `${value}${unit ? ' ' + unit : ''}`;
}

// Open modal with element details
function openModal(element) {
    const modal = document.getElementById('elementModal');
    
    // Update header
    document.getElementById('elementNumber').textContent = element.number;
    document.getElementById('elementName').textContent = element.name;
    document.getElementById('elementSymbol').textContent = element.symbol;

    // Update info grid
    document.getElementById('elementCategory').textContent = element.category || 'N/A';
    document.getElementById('elementAtomicMass').textContent = formatValue(element.atomic_mass);
    document.getElementById('elementPeriod').textContent = element.period || 'N/A';
    document.getElementById('elementGroup').textContent = element.group || 'N/A';
    document.getElementById('elementPhase').textContent = element.phase || 'N/A';
    document.getElementById('elementDensity').textContent = formatValue(element.density, element.phase === 'Gas' ? 'g/l' : 'g/cm³');
    document.getElementById('elementMelt').textContent = formatValue(element.melt, 'K');
    document.getElementById('elementBoil').textContent = formatValue(element.boil, 'K');
    document.getElementById('elementElectronConfig').textContent = element.electron_configuration_semantic || element.electron_configuration || 'N/A';
    document.getElementById('elementElectronegativity').textContent = formatValue(element.electronegativity_pauling);
    document.getElementById('elementDiscoveredBy').textContent = element.discovered_by || 'Unknown';
    document.getElementById('elementAppearance').textContent = element.appearance || 'N/A';

    // Update summary
    document.getElementById('elementSummary').textContent = element.summary || 'No summary available.';

    // Update source link
    const sourceLink = document.getElementById('sourceLink');
    sourceLink.href = element.source || '#';
    sourceLink.textContent = 'View Wikipedia Source →';

    // Update 3D model
    const bohrModel = document.getElementById('bohrModel');
    if (element.bohr_model_3d) {
        bohrModel.setAttribute('src', element.bohr_model_3d);
    }

    // Update element image
    const elementImage = document.getElementById('elementImage');
    const imageAttribution = document.getElementById('imageAttribution');
    if (element.image && element.image.url) {
        elementImage.src = element.image.url;
        elementImage.alt = element.image.title;
        imageAttribution.textContent = element.image.attribution || '';
    }

    // Update spectral image
    const spectralImage = document.getElementById('spectralImage');
    if (element.spectral_img) {
        spectralImage.src = element.spectral_img;
        spectralImage.alt = `${element.name} Spectral Bands`;
    }

    // Show modal
    modal.classList.add('show');
}

// Close modal
function closeModal() {
    document.getElementById('elementModal').classList.remove('show');
}

// Tab switching
document.querySelectorAll('.tab-btn').forEach(btn => {
    btn.addEventListener('click', () => {
        const tabName = btn.getAttribute('data-tab');

        // Remove active from all tabs
        document.querySelectorAll('.tab-btn').forEach(b => b.classList.remove('active'));
        document.querySelectorAll('.tab-pane').forEach(p => p.classList.remove('active'));

        // Add active to clicked tab
        btn.classList.add('active');
        document.getElementById(`${tabName}-tab`).classList.add('active');
    });
});

// Close modal on close button
document.getElementById('closeModal').addEventListener('click', closeModal);

// Close modal on outside click
document.getElementById('elementModal').addEventListener('click', (e) => {
    if (e.target.id === 'elementModal') {
        closeModal();
    }
});

// Close modal on Escape key
document.addEventListener('keydown', (e) => {
    if (e.key === 'Escape') {
        closeModal();
    }
});

// Load data from JSON file
async function loadPeriodicTable() {
    try {
        const response = await fetch('Periodic-Table-JSON-master/PeriodicTableJSON.json');
        if (!response.ok) {
            throw new Error(`HTTP error! status: ${response.status}`);
        }
        const data = await response.json();
        createPeriodicTable(data.elements);
    } catch (error) {
        console.error('Error loading periodic table data:', error);
        document.getElementById('periodicTable').innerHTML = `
            <div style="grid-column: 1 / -1; padding: 20px; text-align: center; color: red;">
                <p>Error loading periodic table data. Please ensure you're running this on a local server.</p>
                <p>Run: <code>python3 server.py</code></p>
            </div>
        `;
    }
}

// Initialize on page load
if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', loadPeriodicTable);
} else {
    loadPeriodicTable();
}
