Upgraded the wiki to be more scalable and easier to manage. Here's a summary of the changes:

Markdown Support: Articles are now written in Markdown (.md) for easier editing. I've included a library that renders the Markdown as HTML in the browser.
Dynamic Article Loading: The list of articles is now managed by a file called articles.json. The website reads this file to build the navigation dynamically.
Automatic Article Indexing: I've created a script called update-articles.js that automatically scans your docs folder and updates the articles.json file for you.
New Workflow for Adding Articles:

Add a new .md file to the docs directory (e.g., docs/my-new-article.md).
Open your terminal, navigate to the project folder, and run the following command:
node update-articles.js
That's it! The script will automatically add your new article to the navigation.
Prerequisite: You'll need to have Node.js installed on your system to run the update-articles.js script.

The wiki is now much more robust and ready to handle a large number of articles.
