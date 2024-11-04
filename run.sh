#!/bin/bash

# Display help if no arguments are provided
if [ $# -eq 0 ]; then
    echo "Usage: ./run.sh -{argument}"
    echo "  -i                 Install dependencies"
    echo "  -d                 Start development server"
    echo "  --frontend         Run frontend commands only"
    echo "  --backend          Run backend commands only"
    exit 1
fi

# Initialize option variables
install=false
dev=false
frontend=false
backend=false

# Parse options
while [[ "$#" -gt 0 ]]; do
    case $1 in
        -i) install=true ;;
        -d) dev=true ;;
        --frontend) frontend=true ;;
        --backend) backend=true ;;
        *)
            echo "Unknown option: $1"
            exit 1
            ;;
    esac
    shift
done

# If neither --frontend nor --backend is specified, default to both
if ! $frontend && ! $backend; then
    frontend=true
    backend=true
fi

# Function to install dependencies
install_dependencies() {
    echo "Installing dependencies..."
    if $frontend; then
        (cd Client && npm install && echo "Frontend dependencies installed.")
    fi
    if $backend; then
        echo "Setting up backend..."
        # Add backend-specific installation commands here
    fi
}

# Function to start development servers
start_dev_server() {
    if $backend; then
        echo "Starting backend server..."
        # Replace "backend_server_command" with actual backend start command
        # (cd backend && npm run start) &
        sleep 5 # Adjust based on backend startup time
        echo "Backend server is up."
    fi
    if $frontend; then
        (cd Client && echo "Starting frontend development server..." && npm run dev -- --host)
    fi
}

# Execute commands based on options
$install && install_dependencies
$dev && start_dev_server
