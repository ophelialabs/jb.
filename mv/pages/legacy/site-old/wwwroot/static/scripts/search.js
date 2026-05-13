
// Advanced Bootstrap-based search.js
// Only search-related logic is included
document.addEventListener('DOMContentLoaded', function() {
    // Debounce utility
    function debounce(func, wait) {
        let timeout;
        return function(...args) {
            clearTimeout(timeout);
            timeout = setTimeout(() => func.apply(this, args), wait);
        };
    }

    // Sanitize HTML (basic)
    function sanitizeHTML(str) {
        const temp = document.createElement('div');
        temp.textContent = str;
        return temp.innerHTML;
    }

    // Highlight search terms
    function highlightTerm(text, term) {
        if (!term) return text;
        const safeTerm = term.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
        return text.replace(new RegExp(`(${safeTerm})`, 'gi'), '<mark>$1</mark>');
    }

    // Main search logic
    const searchInput = document.getElementById('searchInput');
    if (searchInput) {
        // Accessibility
        searchInput.setAttribute('aria-label', 'Site search');
        searchInput.setAttribute('autocomplete', 'off');

        // Suggestion box
        const suggestionBox = document.createElement('div');
        suggestionBox.className = 'list-group position-absolute w-100 shadow';
        suggestionBox.style.zIndex = 1000;
        suggestionBox.style.display = 'none';
        searchInput.parentNode.appendChild(suggestionBox);

        // Loading indicator
        let loadingIndicator = null;

        function showSuggestions(results, query) {
            suggestionBox.innerHTML = '';
            if (results.length === 0) {
                suggestionBox.style.display = 'none';
                return;
            }
            results.slice(0, 7).forEach(r => {
                const item = document.createElement('button');
                item.type = 'button';
                item.className = 'list-group-item list-group-item-action';
                item.innerHTML = highlightTerm(sanitizeHTML(r.title), query);
                item.onclick = () => window.location.href = r.url;
                suggestionBox.appendChild(item);
            });
            suggestionBox.style.display = 'block';
        }

        function hideSuggestions() {
            suggestionBox.style.display = 'none';
        }

        // Debounced instant search
        searchInput.addEventListener('input', debounce(function(e) {
            const query = this.value.trim();
            if (!query) {
                hideSuggestions();
                return;
            }
            // Show loading indicator
            if (!loadingIndicator) {
                loadingIndicator = document.createElement('div');
                loadingIndicator.className = 'spinner-border spinner-border-sm ms-2';
                loadingIndicator.setAttribute('role', 'status');
                loadingIndicator.setAttribute('aria-hidden', 'true');
                this.parentNode.appendChild(loadingIndicator);
            }
            loadingIndicator.style.display = 'inline-block';

            fetch('/static/content/site-index.json')
                .then(res => res.json())
                .then(pages => {
                    const results = pages.filter(page =>
                        page.title.toLowerCase().includes(query.toLowerCase()) ||
                        page.content.toLowerCase().includes(query.toLowerCase())
                    );
                    showSuggestions(results, query);
                })
                .catch(() => hideSuggestions())
                .finally(() => {
                    if (loadingIndicator) loadingIndicator.style.display = 'none';
                });
        }, 250));

        // Hide suggestions on blur
        searchInput.addEventListener('blur', () => setTimeout(hideSuggestions, 200));

        // Enter key triggers redirect to search.html
        searchInput.addEventListener('keydown', function(e) {
            if (e.key === 'Enter') {
                const query = encodeURIComponent(this.value.trim());
                if (query) {
                    window.location.href = `/search.html?q=${query}`;
                }
            }
        });
    }
});
