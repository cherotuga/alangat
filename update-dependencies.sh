#!/bin/bash

# Script to update dependencies in ALL locations
# Usage: ./update-dependencies.sh                    (general update)
# Usage: ./update-dependencies.sh <package> <version> (specific package)
# Example: ./update-dependencies.sh postcss-cli 11.0.1

set -e  # Exit on any error

# Get command line arguments
PACKAGE=$1
VERSION=$2

# Check if arguments were provided
if [ -z "$PACKAGE" ] || [ -z "$VERSION" ]; then
    echo "🔄 No specific package provided - running general update in all locations..."

    # Update root dependencies
    echo "📁 Updating root dependencies..."
    npm update

    # Update theme dependencies
    echo "📁 Updating theme dependencies..."
    cd themes/themes/alangat
    npm update
    cd ../../..

    # Update exampleSite dependencies (if they exist)
    if [ -f "themes/themes/alangat/exampleSite/package.json" ]; then
        echo "📁 Updating exampleSite dependencies..."
        cd themes/themes/alangat/exampleSite
        npm update
        cd ../../../..
    else
        echo "📁 No exampleSite package.json found, skipping..."
    fi
else
    echo "🔄 Updating $PACKAGE to $VERSION in all locations..."

    # Update root dependencies
    echo "📁 Updating root dependencies..."
    npm install ${PACKAGE}@${VERSION}

    # Update theme dependencies
    echo "📁 Updating theme dependencies..."
    cd themes/themes/alangat
    npm install ${PACKAGE}@${VERSION}
    cd ../../..

    # Update exampleSite dependencies (if they exist)
    if [ -f "themes/themes/alangat/exampleSite/package.json" ]; then
        echo "📁 Updating exampleSite dependencies..."
        cd themes/themes/alangat/exampleSite
        npm install ${PACKAGE}@${VERSION}
        cd ../../../..
    else
        echo "📁 No exampleSite package.json found, skipping..."
    fi
fi

# Run audit to check for vulnerabilities
echo "🔍 Running security audit..."
echo "🔍 Root:"
npm audit --quiet || echo "  └─ Found vulnerabilities in root"

echo "🔍 Theme:"
cd themes/themes/alangat
npm audit --quiet || echo "  └─ Found vulnerabilities in theme"
cd ../../..

if [ -f "themes/themes/alangat/exampleSite/package.json" ]; then
    echo "🔍 ExampleSite:"
    cd themes/themes/alangat/exampleSite
    npm audit --quiet || echo "  └─ Found vulnerabilities in exampleSite"
    cd ../../../..
fi

if [ -z "$PACKAGE" ] || [ -z "$VERSION" ]; then
    echo "✅ General update completed in all locations!"
else
    echo "✅ $PACKAGE updated to $VERSION in all locations!"
fi
echo "💡 Remember to test your build to ensure everything works"