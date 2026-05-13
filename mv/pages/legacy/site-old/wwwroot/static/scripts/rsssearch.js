document.addEventListener('DOMContentLoaded', function() {
    // --- Highlight function (copied from site.js) ---
    function highlightTerm(text, term) {
        if (!term) return text;
        const safeTerm = term.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
        return text.replace(new RegExp(`(${safeTerm})`, 'gi'), '<mark>$1</mark>');
    }

    const params = new URLSearchParams(window.location.search);
    const query = params.get('q');
    const resultsDiv = document.getElementById('search-results');
    if (!resultsDiv) return; // Prevent errors if not on search page

    if (!query) {
        resultsDiv.innerHTML = '<p>No search query provided.</p>';
        return;
    }
    resultsDiv.innerHTML = `<p>Searching for "<strong>${highlightTerm(query, query)}</strong>"...</p>`;

    // --- Local Site Search ---
    const localPromise = fetch('/static/content/site-index.json')
        .then(res => res.json())
        .then(pages => pages.filter(page =>
            page.title.toLowerCase().includes(query.toLowerCase()) ||
            page.content.toLowerCase().includes(query.toLowerCase())
        ))
        .catch(() => []);

    // --- RSS Feed Search (using rss2json.com as a proxy) ---
    const rssFeedUrl = encodeURIComponent('https://feeds.bbci.co.uk/news/rss.xml');
    const rssPromise = fetch(`https://api.rss2json.com/v1/api.json?rss_url=${rssFeedUrl}`)
        .then(res => res.json())
        .then(data => {
            if (!data.items) return [];
            return data.items.filter(item =>
                item.title.toLowerCase().includes(query.toLowerCase()) ||
                item.description.toLowerCase().includes(query.toLowerCase())
            );
        })
        .catch(() => []);

    // --- Combine and Display Results ---
    Promise.all([localPromise, rssPromise]).then(([localResults, rssResults]) => {
        let html = '';

        // Local results
        html += `<h2>Results from Ophelia Labs</h2>`;
        if (localResults.length > 0) {
            html += localResults.map(r =>
                `<div class="search-result">
                    <a href="${r.url}"><h3>${highlightTerm(r.title, query)}</h3></a>
                    <p>${highlightTerm(r.snippet, query)}</p>
                </div>`
            ).join('');
        } else {
            html += `<p>No results found on this site.</p>`;
        }

        // RSS results
        html += `<h2>Results from Blog</h2>`;
        if (rssResults.length > 0) {
            html += rssResults.map(item =>
                `<div class="search-result">
                    <a href="${item.link}" target="_blank" rel="noopener">
                        <h3>${highlightTerm(item.title, query)}</h3>
                    </a>
                    <p>${highlightTerm(item.description.replace(/(<([^>]+)>)/gi, "").substring(0, 200), query)}...</p>
                    <span class="text-muted small">${item.pubDate ? new Date(item.pubDate).toLocaleDateString() : ''}</span>
                </div>`
            ).join('');
        } else {
            html += `<p>No results found in the blog feed.</p>`;
        }

        resultsDiv.innerHTML = html;

        // --- Analytics event ---
        console.log('Search analytics event:', query);
    });
});
