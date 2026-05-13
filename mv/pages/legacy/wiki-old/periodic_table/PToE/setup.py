#!/usr/bin/env python3
"""
Setup script to prepare the interactive periodic table
Converts the JSON data to a JavaScript file for browser loading
"""

import json
import os
import sys

def setup():
    print("🔧 Setting up Interactive Periodic Table...\n")
    
    # Get the script directory
    script_dir = os.path.dirname(os.path.abspath(__file__))
    json_file = os.path.join(script_dir, 'Periodic-Table-JSON-master', 'PeriodicTableJSON.json')
    js_file = os.path.join(script_dir, 'periodic-data.js')
    
    print(f"📍 Working directory: {script_dir}")
    
    # Check if JSON file exists
    if not os.path.exists(json_file):
        print(f"❌ Error: JSON file not found at {json_file}")
        sys.exit(1)
    
    print(f"✓ Found periodic table data")
    
    # Read and convert
    try:
        print("📖 Reading JSON data...")
        with open(json_file, 'r', encoding='utf-8') as f:
            data = json.load(f)
        
        print(f"✓ Loaded {len(data.get('elements', []))} elements")
        
        # Write JavaScript file
        print("📝 Writing JavaScript file...")
        with open(js_file, 'w', encoding='utf-8') as f:
            f.write('const periodicTableData = ')
            json.dump(data, f, ensure_ascii=False, indent=2)
            f.write(';')
        
        file_size = os.path.getsize(js_file)
        print(f"✓ Created {os.path.basename(js_file)} ({file_size:,} bytes)")
        
        print("\n" + "="*50)
        print("✨ Setup Complete!")
        print("="*50)
        print("\n📌 Next steps:")
        print("   1. Run: python3 server.py")
        print("   2. Open: http://localhost:8000")
        print("   3. Click on any element to explore!\n")
        
        return True
        
    except json.JSONDecodeError as e:
        print(f"❌ Error: Invalid JSON file - {e}")
        sys.exit(1)
    except Exception as e:
        print(f"❌ Error: {e}")
        sys.exit(1)

if __name__ == "__main__":
    setup()
