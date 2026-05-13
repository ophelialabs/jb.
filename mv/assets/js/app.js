// Navigation and sidebar functionality
function initNavbar() {
    const hamburger = document.getElementById('hamburger');
    const navLinks = document.getElementById('navLinks');
    
    if (!hamburger || !navLinks) return;

    hamburger.addEventListener('click', function(e) {
        e.preventDefault();
        hamburger.classList.toggle('active');
        navLinks.classList.toggle('active');
    });

    // Handle dropdown toggles on mobile
    const dropdowns = document.querySelectorAll('.nav-item.dropdown');
    dropdowns.forEach(dropdown => {
        const toggle = dropdown.querySelector('.dropdown-toggle');
        if (toggle) {
            toggle.addEventListener('click', function(e) {
                if (window.innerWidth <= 768) {
                    e.preventDefault();
                    dropdown.classList.toggle('active');
                }
            });
        }
    });

    // Close menu when link is clicked
    const navItems = document.querySelectorAll('.dropdown-menu a, .nav-links a');
    navItems.forEach(item => {
        item.addEventListener('click', () => {
            hamburger.classList.remove('active');
            navLinks.classList.remove('active');
            
            // Extract page ID and trigger navigation
            const hash = item.getAttribute('href');
            if (hash && hash.startsWith('#')) {
                window.location.hash = hash;
            }
        });
    });
}

function initSidebar() {
    const sidebar = document.getElementById('sidebar');
    if (!sidebar) return;

    const sidebarToggles = document.querySelectorAll('.sidebar-toggle');
    
    sidebarToggles.forEach(toggle => {
        toggle.addEventListener('click', function(e) {
            e.preventDefault();
            const parent = this.parentElement;
            if (parent) {
                parent.classList.toggle('active');
            }
        });
    });

    // Handle sidebar link clicks
    const sidebarLinks = document.querySelectorAll('.sidebar-submenu a');
    sidebarLinks.forEach(link => {
        link.addEventListener('click', function(e) {
            const hash = this.getAttribute('href');
            if (hash && hash.startsWith('#')) {
                window.location.hash = hash;
                e.preventDefault();
            }
        });
    });
}

// Utility functions
function renderDataGrid(containerId, data, template) {
    const container = document.getElementById(containerId);
    if (!container) return;
    
    container.innerHTML = data.map(item => {
        if (typeof template === 'function') {
            return template(item);
        }
        return template;
    }).join('');
}

// Initialize on DOM ready
document.addEventListener('DOMContentLoaded', function() {
    initNavbar();
    initSidebar();
});

// Export utilities
