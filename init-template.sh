#!/bin/bash

# Golden Template Initialization Script
# This interactive CLI guides users through setting up their project with the Memory Bank + SPARC2 framework

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Banner
echo -e "${CYAN}"
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║                                                              ║"
echo "║     Golden Template Initialization                          ║"
echo "║     Memory Bank + SPARC2 Quick Start                        ║"
echo "║                                                              ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo -e "${NC}"

echo -e "${BLUE}Welcome to the Golden Template Quick Start!${NC}"
echo "This wizard will help you initialize your project with:"
echo "  • Memory Bank framework (6-file knowledge system)"
echo "  • SPARC2 workflow integration"
echo "  • Power Automate hooks setup"
echo ""
echo -e "${YELLOW}Let's get started...${NC}"
echo ""

# Function to prompt for input with default
prompt_with_default() {
    local prompt="$1"
    local default="$2"
    local var_name="$3"
    
    if [ -n "$default" ]; then
        read -p "$(echo -e ${CYAN}$prompt ${NC}[${GREEN}$default${NC}]: )" input
        eval "$var_name=\"${input:-$default}\""
    else
        read -p "$(echo -e ${CYAN}$prompt${NC}: )" input
        eval "$var_name=\"$input\""
    fi
}

# Function to prompt yes/no
prompt_yes_no() {
    local prompt="$1"
    local default="$2"
    
    while true; do
        if [ "$default" = "y" ]; then
            read -p "$(echo -e ${CYAN}$prompt${NC} [${GREEN}Y${NC}/n]: )" yn
            yn=${yn:-y}
        else
            read -p "$(echo -e ${CYAN}$prompt${NC} [y/${GREEN}N${NC}]: )" yn
            yn=${yn:-n}
        fi
        
        case $yn in
            [Yy]* ) return 0;;
            [Nn]* ) return 1;;
            * ) echo "Please answer yes or no.";;
        esac
    done
}

# Function to prompt for multiline input
prompt_multiline() {
    local prompt="$1"
    local var_name="$2"
    
    echo -e "${CYAN}$prompt${NC}"
    echo -e "${YELLOW}(Press Enter twice when done)${NC}"
    
    local lines=""
    local line
    local empty_count=0
    
    while true; do
        read line
        if [ -z "$line" ]; then
            ((empty_count++))
            if [ $empty_count -ge 2 ]; then
                break
            fi
        else
            empty_count=0
            if [ -n "$lines" ]; then
                lines="$lines\n$line"
            else
                lines="$line"
            fi
        fi
    done
    
    eval "$var_name=\"$lines\""
}

# Check if memory-bank directory exists
if [ -d "memory-bank" ]; then
    echo -e "${YELLOW}⚠ Memory Bank directory already exists.${NC}"
    if prompt_yes_no "Do you want to reinitialize it? This will backup existing files" "n"; then
        echo -e "${BLUE}Creating backup...${NC}"
        timestamp=$(date +%Y%m%d_%H%M%S)
        mv memory-bank "memory-bank.backup.$timestamp"
        echo -e "${GREEN}✓ Backed up to memory-bank.backup.$timestamp${NC}"
        mkdir -p memory-bank
    else
        echo -e "${RED}Initialization cancelled.${NC}"
        exit 1
    fi
else
    mkdir -p memory-bank
fi

echo ""
echo -e "${BLUE}═══════════════════════════════════════${NC}"
echo -e "${BLUE}  Section 1: Project Information${NC}"
echo -e "${BLUE}═══════════════════════════════════════${NC}"
echo ""

# Gather project information
prompt_with_default "Project Name" "My Awesome Project" PROJECT_NAME
prompt_with_default "Project Description" "A new project using the Golden Template" PROJECT_DESCRIPTION
prompt_with_default "Technology Stack (comma-separated)" "Node.js, TypeScript, React" TECH_STACK
prompt_with_default "Target Audience" "End users, Developers" TARGET_AUDIENCE

echo ""
echo -e "${BLUE}═══════════════════════════════════════${NC}"
echo -e "${BLUE}  Section 2: Project Goals${NC}"
echo -e "${BLUE}═══════════════════════════════════════${NC}"
echo ""

PROJECT_GOALS=""
echo -e "${CYAN}Enter your project goals (one per line, enter a blank line when done):${NC}"
while true; do
    read -p "  • " goal
    if [ -z "$goal" ]; then
        break
    fi
    PROJECT_GOALS="${PROJECT_GOALS}- $goal\n"
done

echo ""
echo -e "${BLUE}═══════════════════════════════════════${NC}"
echo -e "${BLUE}  Section 3: Core Features${NC}"
echo -e "${BLUE}═══════════════════════════════════════${NC}"
echo ""

CORE_FEATURES=""
echo -e "${CYAN}Enter your core features (one per line, enter a blank line when done):${NC}"
while true; do
    read -p "  • " feature
    if [ -z "$feature" ]; then
        break
    fi
    CORE_FEATURES="${CORE_FEATURES}- $feature\n"
done

echo ""
echo -e "${BLUE}═══════════════════════════════════════${NC}"
echo -e "${BLUE}  Section 4: Development Setup${NC}"
echo -e "${BLUE}═══════════════════════════════════════${NC}"
echo ""

USE_POWER_AUTOMATE=false
if prompt_yes_no "Will you use Power Automate integration?" "y"; then
    USE_POWER_AUTOMATE=true
fi

USE_DOCKER=false
if prompt_yes_no "Will you use Docker?" "y"; then
    USE_DOCKER=true
fi

prompt_with_default "Primary Programming Language" "JavaScript" PRIMARY_LANGUAGE

echo ""
echo -e "${BLUE}═══════════════════════════════════════${NC}"
echo -e "${BLUE}  Section 5: Current Focus${NC}"
echo -e "${BLUE}═══════════════════════════════════════${NC}"
echo ""

prompt_with_default "What is your immediate focus?" "Initial project setup" CURRENT_FOCUS
prompt_with_default "Sprint/Iteration name (if applicable)" "Sprint 1" SPRINT_NAME

# Get current timestamp
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")
ISO_DATE=$(date +"%Y-%m-%d")

echo ""
echo -e "${GREEN}═══════════════════════════════════════${NC}"
echo -e "${GREEN}  Initializing Memory Bank...${NC}"
echo -e "${GREEN}═══════════════════════════════════════${NC}"
echo ""

# Create productContext.md
echo -e "${BLUE}→ Creating productContext.md${NC}"
cat > memory-bank/productContext.md << EOF
# Product Context

## Overview
This file contains the high-level project description, goals, features, and overall architecture.

## Project Description
$PROJECT_DESCRIPTION

**Target Audience:** $TARGET_AUDIENCE

## Goals

$(echo -e "$PROJECT_GOALS")

## Core Features

$(echo -e "$CORE_FEATURES")

## Technology Stack

$(echo "$TECH_STACK" | tr ',' '\n' | sed 's/^[ \t]*/- /')

## Overall Architecture
*To be developed as the project progresses. Initial architecture decisions will be documented in decisionLog.md.*

### System Components
- Main Application
- Data Layer
- API Layer

### Integration Points
$(if [ "$USE_POWER_AUTOMATE" = true ]; then echo "- Power Automate workflows"; fi)
$(if [ "$USE_DOCKER" = true ]; then echo "- Docker containerization"; fi)

---

## Change History

[$TIMESTAMP] - Initial product context created via Golden Template initialization
EOF

# Create activeContext.md
echo -e "${BLUE}→ Creating activeContext.md${NC}"
cat > memory-bank/activeContext.md << EOF
# Active Context

## Current Focus
$CURRENT_FOCUS

### Active Tasks
- [x] Initialize Golden Template
- [ ] Set up development environment
- [ ] Define initial architecture

### Current Sprint/Iteration Goals
**Sprint:** $SPRINT_NAME
**Start Date:** $ISO_DATE
**Goal:** Initialize project and establish foundation

## Recent Changes

[$TIMESTAMP] - Project initialized with Golden Template
[$TIMESTAMP] - Memory Bank structure created
[$TIMESTAMP] - SPARC2 workflow integrated

## Open Questions/Issues

### Questions
1. What is the deployment strategy?
2. What are the performance requirements?

### Known Issues
*No known issues yet*

## Dependencies & Blockers

*No blockers at this time*

## Power Automate Workflow Status

$(if [ "$USE_POWER_AUTOMATE" = true ]; then echo "*Power Automate integration planned - hooks will be documented in docs/automation_hooks.md*"; else echo "*Power Automate integration not currently planned*"; fi)

---

## Session Updates

[$TIMESTAMP] - Project initialized with interactive quick start wizard
EOF

# Create systemPatterns.md
echo -e "${BLUE}→ Creating systemPatterns.md${NC}"
cat > memory-bank/systemPatterns.md << EOF
# System Patterns

## Overview
This file documents architectural patterns, coding standards, and design conventions used throughout the project.

## Architectural Patterns

### Pattern 1: Modular Architecture
**When to Use:** Always - keep all components modular and focused

**Implementation:**
- Maximum file length: 500 lines
- One primary component per file
- Clear separation of concerns
- External configuration for all environment-specific values

### Pattern 2: Environment Configuration
**When to Use:** For all environment-specific settings

**Implementation:**
- Use environment variables for configuration
- Never hardcode secrets, API keys, or credentials
- Use \`.env\` files for local development (excluded from git)
- Use secure configuration management for production

## Coding Standards

### Naming Conventions
- **Files:** Based on language convention ($PRIMARY_LANGUAGE standards)
- **Classes:** PascalCase
- **Functions:** camelCase or snake_case (language-specific)
- **Variables:** descriptive, camelCase or snake_case
- **Constants:** UPPER_SNAKE_CASE

### File Organization
- Maximum file length: 500 lines
- One primary class/component per file
- Related utilities in separate utility files
- Clear directory structure by feature or layer

### Code Style
- Prefer functional programming where appropriate
- Use early returns to reduce nesting
- Comprehensive error handling
- Clear, descriptive names over comments
- Comments only for complex logic explanation

## Security Patterns

### Environment Configuration
- **NEVER** hardcode secrets, API keys, or credentials
- Use environment variables or secure configuration management
- Use \`.env\` files for local development (excluded from version control)
- Use secrets management services for production

### Data Validation
- Validate all inputs at boundaries
- Sanitize user inputs
- Use parameterized queries for database access
- Implement proper authentication and authorization

## Testing Patterns

### Test Structure
- Follow Test-Driven Development (TDD) where applicable
- One test file per source file
- Clear test naming: \`test_[feature]_[scenario]_[expected_result]\`
- Arrange-Act-Assert pattern

### Test Coverage
- Aim for minimum 80% code coverage
- Focus on critical business logic first
- Test edge cases and error conditions

## Data Patterns

### API Design
- RESTful design principles
- Consistent endpoint naming
- Proper HTTP status codes
- Comprehensive error responses
- API versioning strategy

$(if [ "$USE_POWER_AUTOMATE" = true ]; then cat << 'PAEOF'

## Power Automate Integration Patterns

### Automation Hooks
- Document all automation triggers in \`docs/automation_hooks.md\`
- Use stateless hook design
- Provide complete JSON schemas for each hook
- Include authentication and rate limiting
- Test hooks before production deployment
PAEOF
fi)

---

## Pattern Updates

[$TIMESTAMP] - Initial patterns established via Golden Template initialization
EOF

# Create decisionLog.md
echo -e "${BLUE}→ Creating decisionLog.md${NC}"
cat > memory-bank/decisionLog.md << EOF
# Decision Log

## Overview
This file records significant architectural and implementation decisions, including the context, decision made, rationale, and implementation details.

---

## Decisions

### Golden Template Framework Adoption
**Date:** $TIMESTAMP
**Status:** Accepted
**Context:** Starting a new project that requires structured development workflow, persistent knowledge management, and AI-assisted development.
**Decision:** Adopt the Golden Template combining Enes Cingoz Memory Bank framework with SPARC2 methodology.
**Rationale:** 
- Provides structured SPARC2 workflow (Specification, Pseudocode, Architecture, Refinement, Completion)
- Maintains persistent context across development sessions
- Enables effective AI assistance with Roo Code and GitHub Copilot
- Supports Power Automate integration for workflow automation
**Alternatives Considered:**
- Traditional documentation approach
- Custom project template
- No structured framework
**Consequences:**
- Team must follow SPARC2 workflow for consistency
- Memory Bank files must be kept up to date
- GitHub Copilot will follow architectural decisions from Memory Bank
**Implementation:** 
- Memory Bank structure initialized
- .clinerules configured with SPARC2 workflow
- Copilot instructions synchronized

### Technology Stack Selection
**Date:** $TIMESTAMP
**Status:** Accepted
**Context:** Need to choose primary technologies for development.
**Decision:** Use $TECH_STACK
**Rationale:** Based on project requirements and team expertise.
**Implementation:** To be documented as specific technology decisions are made.

---

## Decision History

[$TIMESTAMP] - Adopted Golden Template framework
[$TIMESTAMP] - Initialized Memory Bank structure
EOF

# Create progress.md
echo -e "${BLUE}→ Creating progress.md${NC}"
cat > memory-bank/progress.md << EOF
# Progress Tracker

## Overview
This file tracks the progress of the project using a task list format.

## Current Sprint/Iteration

**Sprint:** $SPRINT_NAME
**Start Date:** $ISO_DATE
**Goal:** Initialize project foundation and set up development environment

## Task List

### Completed ✅

- [x] Initialize Golden Template
- [x] Set up Memory Bank structure
- [x] Configure SPARC2 workflow
- [x] Set up project documentation

### In Progress 🔄

- [ ] Set up development environment (Started: $ISO_DATE)
- [ ] Define initial architecture
- [ ] Set up version control workflow

### Planned 📋

- [ ] Implement core features
- [ ] Set up CI/CD pipeline
- [ ] Write initial tests
- [ ] Deploy development environment

### Blocked 🚫

*No blocked tasks at this time*

## Milestones

### Milestone 1: Project Foundation
**Target Date:** $(date -d "+2 weeks" +%Y-%m-%d 2>/dev/null || date -v+2w +%Y-%m-%d 2>/dev/null || echo "TBD")
**Status:** In Progress
**Description:** Complete project initialization and establish development workflow

**Tasks:**
- [x] Initialize Golden Template
- [ ] Complete development environment setup
- [ ] Document initial architecture
- [ ] Set up CI/CD

### Milestone 2: Core Development
**Target Date:** TBD
**Status:** Not Started
**Description:** Implement core features and functionality

**Tasks:**
- [ ] Define feature specifications
- [ ] Implement initial features
- [ ] Write comprehensive tests
- [ ] Complete initial documentation

## Metrics

### Code Quality
- Test Coverage: 0% (initial)
- Code Review Status: N/A
- Security Scan: Not yet run

### Performance
- Build Time: Not yet measured
- Test Execution Time: Not yet measured

---

## Progress History

[$TIMESTAMP] - Project initialized with Golden Template
[$TIMESTAMP] - Memory Bank structure created
[$TIMESTAMP] - SPARC2 workflow configured
EOF

# Create techContext.md
echo -e "${BLUE}→ Creating techContext.md${NC}"
cat > memory-bank/techContext.md << EOF
# Technical Context

## Overview
This file provides technical context including technology decisions, third-party integrations, development environment setup, and deployment details.

## Development Environment

### Prerequisites
*To be documented based on specific technology choices:*
- $TECH_STACK

### Setup Instructions
1. Clone the repository
2. Install dependencies (specific commands to be added)
3. Configure environment variables (see below)
4. Run initial setup

### Environment Variables
*Document required environment variables here (without exposing actual values)*

| Variable | Purpose | Example Value |
|----------|---------|---------------|
| NODE_ENV | Environment identifier | development |
| DATABASE_URL | Database connection | postgresql://localhost:5432/mydb |
| API_KEY | External API auth | your-api-key-here |

## Third-Party Services & APIs

$(if [ "$USE_POWER_AUTOMATE" = true ]; then cat << 'PAEOF'
### Power Automate Premium
**Purpose:** Workflow automation and integration
**Documentation:** docs/automation_hooks.md
**Authentication:** To be configured
**Integration:** Webhook-based automation hooks
PAEOF
fi)

*Add additional services as they are integrated*

## Build & Deployment

### Build Process
*To be documented once build system is configured*

$(if [ "$USE_DOCKER" = true ]; then cat << 'DOCKEREOF'
### Docker Configuration
**Images:** To be defined
**Compose:** To be configured
**Deployment:** Container-based deployment strategy
DOCKEREOF
fi)

### Deployment Process
- **Development:** Local environment
- **Staging:** To be configured
- **Production:** To be configured

### CI/CD Pipeline
*To be configured based on chosen CI/CD platform*

## Performance Considerations

### Optimization Strategies
*To be documented as performance requirements are defined*

### Caching
*To be implemented based on requirements*

### Scaling
*Scaling strategy to be defined*

## Monitoring & Logging

### Logging Strategy
*To be implemented*
- Log levels to be defined
- Log aggregation tool to be chosen
- Log retention policy to be established

### Monitoring Tools
*To be configured*

---

## Technical Updates

[$TIMESTAMP] - Initial technical context established
[$TIMESTAMP] - Primary language set to $PRIMARY_LANGUAGE
$(if [ "$USE_DOCKER" = true ]; then echo "[$TIMESTAMP] - Docker integration planned"; fi)
$(if [ "$USE_POWER_AUTOMATE" = true ]; then echo "[$TIMESTAMP] - Power Automate integration planned"; fi)
EOF

# Update README.md
echo -e "${BLUE}→ Updating memory-bank/README.md${NC}"
sed -i "s/\*\*Last Updated\*\*: .*/\*\*Last Updated\*\*: $ISO_DATE/" memory-bank/README.md 2>/dev/null || \
sed -i '' "s/\*\*Last Updated\*\*: .*/\*\*Last Updated\*\*: $ISO_DATE/" memory-bank/README.md

echo ""
echo -e "${GREEN}✓ Memory Bank initialized successfully!${NC}"
echo ""

# Summary
echo -e "${CYAN}╔══════════════════════════════════════════════════════════════╗${NC}"
echo -e "${CYAN}║                   Initialization Complete!                   ║${NC}"
echo -e "${CYAN}╚══════════════════════════════════════════════════════════════╝${NC}"
echo ""
echo -e "${BLUE}Project Summary:${NC}"
echo "  • Name: $PROJECT_NAME"
echo "  • Focus: $CURRENT_FOCUS"
echo "  • Tech Stack: $TECH_STACK"
echo "  • Power Automate: $(if [ "$USE_POWER_AUTOMATE" = true ]; then echo "Yes"; else echo "No"; fi)"
echo "  • Docker: $(if [ "$USE_DOCKER" = true ]; then echo "Yes"; else echo "No"; fi)"
echo ""
echo -e "${BLUE}Files Created:${NC}"
echo "  ✓ memory-bank/productContext.md"
echo "  ✓ memory-bank/activeContext.md"
echo "  ✓ memory-bank/systemPatterns.md"
echo "  ✓ memory-bank/decisionLog.md"
echo "  ✓ memory-bank/progress.md"
echo "  ✓ memory-bank/techContext.md"
echo ""
echo -e "${YELLOW}Next Steps:${NC}"
echo "  1. Review the Memory Bank files in memory-bank/"
echo "  2. Update .clinerules if needed for your specific workflow"
echo "  3. Start development using Roo Code with SPARC2 methodology"
echo "  4. Use 'UMB' command in Roo Code to update Memory Bank"
echo "  5. Keep GitHub Copilot synchronized with architectural decisions"
echo ""
echo -e "${GREEN}Happy coding with the Golden Template! 🚀${NC}"
echo ""
