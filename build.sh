# Build Script for LaTeX CV Multilingual
# Alternative to Makefile for systems without make

#!/bin/bash

# Configuration
BUILD_DIR="build"
OUTPUT_DIR="output"
LATEX_ENGINE="xelatex"
LATEX_FLAGS="-interaction=nonstopmode -file-line-error"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

# Function to create directories
create_dirs() {
    mkdir -p "$BUILD_DIR" "$OUTPUT_DIR"
}

# Function to build a single CV
build_cv() {
    local lang=$1
    local dir=$2
    local source_file="$dir/cv-$lang.tex"
    
    if [ ! -f "$source_file" ]; then
        print_error "Source file not found: $source_file"
        return 1
    fi
    
    print_status "Building $lang CV..."
    
    # Compile with output directory set to build folder
    if $LATEX_ENGINE $LATEX_FLAGS -output-directory="$BUILD_DIR" "$source_file" > /dev/null 2>&1; then
        # Move PDF to output directory
        if [ -f "$BUILD_DIR/cv-$lang.pdf" ]; then
            mv "$BUILD_DIR/cv-$lang.pdf" "$OUTPUT_DIR/"
            print_success "$lang CV built successfully"
        else
            print_error "PDF not generated for $lang"
            return 1
        fi
    else
        print_error "Failed to build $lang CV"
        return 1
    fi
}

# Function to build all CVs in a category
build_category() {
    local category=$1
    local dir=$2
    shift 2
    local languages=("$@")
    
    print_status "Building $category CVs..."
    
    for lang in "${languages[@]}"; do
        build_cv "$lang" "$dir"
    done
}

# Main script
main() {
    # Create directories
    create_dirs
    
    case "${1:-help}" in
        "all")
            print_status "Building all CVs..."
            build_category "Latin Script" "src/latin" "english" "german" "french" "spanish" "portuguese" "dutch" "turkish"
            build_category "CJK" "src/cjk" "chinese" "japanese" "korean"
            build_category "RTL" "src/rtl" "arabic"
            build_category "Cyrillic" "src/cyrillic" "russian"
            print_success "All CVs built successfully!"
            ;;
        "latin")
            build_category "Latin Script" "src/latin" "english" "german" "french" "spanish" "portuguese" "dutch" "turkish"
            ;;
        "cjk")
            build_category "CJK" "src/cjk" "chinese" "japanese" "korean"
            ;;
        "rtl")
            build_category "RTL" "src/rtl" "arabic"
            ;;
        "cyrillic")
            build_category "Cyrillic" "src/cyrillic" "russian"
            ;;
        "clean")
            print_status "Cleaning build artifacts..."
            rm -rf "$BUILD_DIR"/*
            print_success "Build artifacts cleaned"
            ;;
        "clean-all")
            print_status "Cleaning all files..."
            rm -rf "$BUILD_DIR"/*
            rm -f "$OUTPUT_DIR"/*.pdf
            print_success "All files cleaned"
            ;;
        "help"|*)
            echo "LaTeX CV Multilingual Build Script"
            echo "=================================="
            echo ""
            echo "Usage: $0 [command]"
            echo ""
            echo "Commands:"
            echo "  all          - Build all CVs"
            echo "  latin        - Build Latin script CVs"
            echo "  cjk          - Build CJK CVs"
            echo "  rtl          - Build RTL CVs"
            echo "  cyrillic     - Build Cyrillic CVs"
            echo "  clean        - Remove build artifacts"
            echo "  clean-all    - Remove build artifacts and PDFs"
            echo "  help         - Show this help message"
            echo ""
            echo "Individual languages:"
            echo "  english      - Build English CV"
            echo "  german       - Build German CV"
            echo "  french       - Build French CV"
            echo "  spanish      - Build Spanish CV"
            echo "  portuguese   - Build Portuguese CV"
            echo "  dutch        - Build Dutch CV"
            echo "  turkish      - Build Turkish CV"
            echo "  chinese      - Build Chinese CV"
            echo "  japanese     - Build Japanese CV"
            echo "  korean       - Build Korean CV"
            echo "  arabic       - Build Arabic CV"
            echo "  russian      - Build Russian CV"
            ;;
    esac
}

# Handle individual language builds
if [[ " english german french spanish portuguese dutch turkish chinese japanese korean arabic russian " =~ " ${1:-} " ]]; then
    create_dirs
    case "$1" in
        "english"|"german"|"french"|"spanish"|"portuguese"|"dutch"|"turkish")
            build_cv "$1" "src/latin"
            ;;
        "chinese"|"japanese"|"korean")
            build_cv "$1" "src/cjk"
            ;;
        "arabic")
            build_cv "$1" "src/rtl"
            ;;
        "russian")
            build_cv "$1" "src/cyrillic"
            ;;
    esac
else
    main "$@"
fi
