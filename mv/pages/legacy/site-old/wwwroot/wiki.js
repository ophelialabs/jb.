document.addEventListener('DOMContentLoaded', function () {
    // This check ensures the script only runs when the wiki content is on the page.
    if (!document.getElementById('wikiContent')) {
        return;
    }

    const wikiRoutes = {
        home: {
            title: "Overview",
            file: "Components/Pages/Wiki/home.html" // Corrected path to a content file
        },
        "cloud-projects": {
            title: "Cloud Projects",
            file: "Components/Pages/Wiki/Pages/cloud-projects.html"
        },
        enterprise: {
            title: "Enterprise",
            file: "Components/Pages/stack/stack.html"
        },
        "ai-automation": {
            title: "AI & Automation",
            file: "Components/Pages/Wiki/ai-automation.html"
        },
        security: {
            title: "Security",
            file: "Components/Pages/Wiki/security.html"
        },
        documentation: {
            title: "Documentation",
            file: "Components/Pages/Wiki/documentation.html"
        },
    };

    function setWikiActiveLink(route) {
        document.querySelectorAll('#wikiNav a').forEach(a => {
            a.classList.toggle('active', a.dataset.route === route);
        });
    }

    function renderWikiContent(route) {
        const contentArea = document.getElementById('wikiContent');
        const routeConfig = wikiRoutes[route];

        if (routeConfig && contentArea) {
            fetch(routeConfig.file)
                .then(response => response.ok ? response.text() : Promise.reject(`File not found: ${routeConfig.file}`))
                .then(html => {
                    contentArea.innerHTML = html;
                    setWikiActiveLink(route);

                    // After loading new content, check for and initialize any Bootstrap modals.
                    // This is necessary for modals loaded dynamically, like in stack.html.
                    const modalElements = contentArea.querySelectorAll('.modal');
                    if (modalElements.length > 0 && typeof bootstrap !== 'undefined') {
                        modalElements.forEach(modalEl => {
                            new bootstrap.Modal(modalEl);
                        });
                    }
                })
                .catch(error => {
                    console.error('Error loading wiki content:', error);
                    contentArea.innerHTML = `<div class="card"><div class="card-body"><h1 class="card-title text-danger">Error</h1><p>Could not load content for '${route}'.</p></div></div>`;
                });
        }
    }

    document.querySelectorAll('#wikiNav a').forEach(a => {
        a.addEventListener('click', e => {
            e.preventDefault();
            const route = e.currentTarget.dataset.route;
            if (route) {
                renderWikiContent(route);
            }
        });
    });

    // Load the initial/default wiki page
    renderWikiContent('home');
});
