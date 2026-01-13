# Quick Start - Example Session

This document shows an example session of using the `init-template.sh` wizard.

## Running the Wizard

```bash
$ ./init-template.sh
```

## Example Session Output

```
╔══════════════════════════════════════════════════════════════╗
║                                                              ║
║     Golden Template Initialization                          ║
║     Memory Bank + SPARC2 Quick Start                        ║
║                                                              ║
╚══════════════════════════════════════════════════════════════╝

Welcome to the Golden Template Quick Start!
This wizard will help you initialize your project with:
  • Memory Bank framework (6-file knowledge system)
  • SPARC2 workflow integration
  • Power Automate hooks setup

Let's get started...

═══════════════════════════════════════
  Section 1: Project Information
═══════════════════════════════════════

Project Name [My Awesome Project]: TaskFlow Pro
Project Description [A new project using the Golden Template]: A modern task management system with real-time collaboration
Technology Stack (comma-separated) [Node.js, TypeScript, React]: TypeScript, React, Node.js, PostgreSQL, Redis
Target Audience [End users, Developers]: Product managers, Development teams, Project coordinators

═══════════════════════════════════════
  Section 2: Project Goals
═══════════════════════════════════════

Enter your project goals (one per line, enter a blank line when done):
  • Build a scalable task management platform
  • Enable real-time team collaboration
  • Integrate with existing tools via API
  • 

═══════════════════════════════════════
  Section 3: Core Features
═══════════════════════════════════════

Enter your core features (one per line, enter a blank line when done):
  • Task creation and assignment
  • Real-time notifications
  • Team collaboration spaces
  • Calendar integration
  • Analytics dashboard
  • 

═══════════════════════════════════════
  Section 4: Development Setup
═══════════════════════════════════════

Will you use Power Automate integration? [Y/n]: y
Will you use Docker? [Y/n]: y
Primary Programming Language [JavaScript]: TypeScript

═══════════════════════════════════════
  Section 5: Current Focus
═══════════════════════════════════════

What is your immediate focus? [Initial project setup]: Architecture design and API specification
Sprint/Iteration name (if applicable) [Sprint 1]: Sprint 1 - Foundation

═══════════════════════════════════════
  Initializing Memory Bank...
═══════════════════════════════════════

→ Creating productContext.md
→ Creating activeContext.md
→ Creating systemPatterns.md
→ Creating decisionLog.md
→ Creating progress.md
→ Creating techContext.md
→ Updating memory-bank/README.md

✓ Memory Bank initialized successfully!

╔══════════════════════════════════════════════════════════════╗
║                   Initialization Complete!                   ║
╚══════════════════════════════════════════════════════════════╝

Project Summary:
  • Name: TaskFlow Pro
  • Focus: Architecture design and API specification
  • Tech Stack: TypeScript, React, Node.js, PostgreSQL, Redis
  • Power Automate: Yes
  • Docker: Yes

Files Created:
  ✓ memory-bank/productContext.md
  ✓ memory-bank/activeContext.md
  ✓ memory-bank/systemPatterns.md
  ✓ memory-bank/decisionLog.md
  ✓ memory-bank/progress.md
  ✓ memory-bank/techContext.md

Next Steps:
  1. Review the Memory Bank files in memory-bank/
  2. Update .clinerules if needed for your specific workflow
  3. Start development using Roo Code with SPARC2 methodology
  4. Use 'UMB' command in Roo Code to update Memory Bank
  5. Keep GitHub Copilot synchronized with architectural decisions

Happy coding with the Golden Template! 🚀
```

## What Gets Created

After running the wizard, your `memory-bank/` directory will contain:

### productContext.md
```markdown
# Product Context

## Overview
This file contains the high-level project description, goals, features, and overall architecture.

## Project Description
A modern task management system with real-time collaboration

**Target Audience:** Product managers, Development teams, Project coordinators

## Goals

- Build a scalable task management platform
- Enable real-time team collaboration
- Integrate with existing tools via API

## Core Features

- Task creation and assignment
- Real-time notifications
- Team collaboration spaces
- Calendar integration
- Analytics dashboard

## Technology Stack

- TypeScript
- React
- Node.js
- PostgreSQL
- Redis

...
```

### activeContext.md
```markdown
# Active Context

## Current Focus
Architecture design and API specification

### Active Tasks
- [x] Initialize Golden Template
- [ ] Set up development environment
- [ ] Define initial architecture

### Current Sprint/Iteration Goals
**Sprint:** Sprint 1 - Foundation
**Start Date:** 2026-01-13
**Goal:** Initialize project and establish foundation

...
```

### And 4 More Files
- `systemPatterns.md` - Coding standards and patterns
- `decisionLog.md` - Architectural decision records
- `progress.md` - Task tracking and milestones
- `techContext.md` - Technical setup details

## Verifying the Setup

After initialization, you can verify everything is set up correctly:

```bash
# Check Memory Bank structure
ls -l memory-bank/

# View your project context
cat memory-bank/productContext.md

# See current focus
cat memory-bank/activeContext.md

# Review initial decisions
cat memory-bank/decisionLog.md
```

## Next Steps

1. **Review Generated Files**: Open each Memory Bank file to review
2. **Customize Further**: Edit any files if you need to refine the details
3. **Start Coding**: Open Roo Code and select a mode (e.g., `architect`)
4. **Follow SPARC2**: Use the workflow defined in `.clinerules`

Enjoy your journey with the Golden Template! 🎉
