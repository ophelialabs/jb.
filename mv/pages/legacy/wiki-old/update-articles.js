const fs = require('fs');
const path = require('path');

const docsDir = path.join(__dirname, 'docs');
const articlesFile = path.join(__dirname, 'articles.json');

fs.readdir(docsDir, (err, files) => {
    if (err) {
        console.error('Error reading docs directory:', err);
        return;
    }

    const articles = files
        .filter(file => file.endsWith('.md'))
        .map(file => {
            const title = path.basename(file, '.md').replace(/-/g, ' ');
            return {
                title: title.charAt(0).toUpperCase() + title.slice(1),
                path: `docs/${file}`
            };
        });

    fs.writeFile(articlesFile, JSON.stringify(articles, null, 4), (err) => {
        if (err) {
            console.error('Error writing articles.json:', err);
            return;
        }
        console.log('articles.json updated successfully.');
    });
});