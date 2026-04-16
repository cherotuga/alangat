#!/bin/bash

# Script to update dependencies in both root and theme directories
# This ensures security updates are applied everywhere

set -e  # Exit on any error

echo "🔄 Updating dependencies in both locations..."

# Update root dependencies
echo "📁 Updating root dependencies..."
npm update

# Update theme dependencies
echo "📁 Updating theme dependencies..."
cd themes/themes/alangat
npm update
cd ../../..

# Run audit to check for vulnerabilities
echo "🔍 Running security audit..."
npm audit
echo "🔍 Auditing theme dependencies..."
cd themes/themes/alangat
npm audit
cd ../../..

echo "✅ All dependencies updated!"
echo "💡 Remember to test your build with: npm run build"