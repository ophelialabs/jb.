#!/usr/bin/env python3
"""
Simple HTTP server for the Interactive Periodic Table
Run this script to start a local web server
"""

import http.server
import socketserver
import os
import webbrowser
from pathlib import Path

PORT = 8000
DIRECTORY = Path(__file__).parent

class MyHTTPRequestHandler(http.server.SimpleHTTPRequestHandler):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, directory=str(DIRECTORY), **kwargs)

def start_server():
    os.chdir(DIRECTORY)
    with socketserver.TCPServer(("", PORT), MyHTTPRequestHandler) as httpd:
        print(f"✨ Interactive Periodic Table")
        print(f"📍 Server running at http://localhost:{PORT}")
        print(f"🌐 Open your browser and navigate to http://localhost:{PORT}")
        print(f"⌨️  Press Ctrl+C to stop the server\n")
        
        # Try to open browser automatically
        try:
            webbrowser.open(f"http://localhost:{PORT}")
            print("🔗 Browser opened automatically!")
        except:
            pass
        
        try:
            httpd.serve_forever()
        except KeyboardInterrupt:
            print("\n\n👋 Server stopped.")
            exit(0)

if __name__ == "__main__":
    start_server()
