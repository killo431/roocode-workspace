# Memory Bank Directory

## Overview

The **Memory Bank** is the central knowledge repository for this project. It implements the Enes Cingoz Memory Bank framework combined with SPARC2 methodology to provide persistent context across development sessions.

## Purpose

The Memory Bank serves as:
- **Source of Truth**: All architectural decisions, patterns, and project context
- **Context Persistence**: Maintains knowledge between sessions and AI assistant interactions
- **SPARC2 Integration**: Aligns with the SPARC2 workflow phases
- **Team Communication**: Documents decisions and rationale for all team members

## Directory Structure

This directory contains 6 essential files:

### 1. `productContext.md`
**Purpose**: High-level project overview
- Project description and goals
- Core features and functionality
- Target audience
- Technology stack
- Overall architecture

**When to Update**: When project goals, features, or overall architecture change significantly

### 2. `activeContext.md`
**Purpose**: Current development focus
- Active tasks and sprint goals
- Recent changes
- Open questions and issues
- Dependencies and blockers
- Power Automate workflow status

**When to Update**: When focus changes, significant progress is made, or new issues arise

### 3. `systemPatterns.md`
**Purpose**: Architectural and coding standards
- Architectural patterns
- Coding conventions
- Security patterns
- Testing patterns
- Data and API design patterns

**When to Update**: When new patterns are introduced or existing ones are modified

### 4. `decisionLog.md`
**Purpose**: Architectural decision records (ADRs)
- Context for decisions
- Decisions made
- Rationale and alternatives considered
- Consequences and implementation details

**When to Update**: When significant architectural or technical decisions are made

### 5. `progress.md`
**Purpose**: Task tracking and milestones
- Completed tasks
- In-progress work
- Planned tasks
- Blocked items
- Milestones and metrics

**When to Update**: When tasks are started, completed, or status changes

### 6. `techContext.md` (Optional)
**Purpose**: Additional technical details
- Development environment setup
- Third-party services and APIs
- Build and deployment processes
- Performance considerations
- Monitoring and logging

**When to Update**: When technical infrastructure or tools change

## Integration with SPARC2

The Memory Bank integrates directly with the SPARC2 workflow:

1. **S (Specification)**: Consult `productContext.md` to verify goals
2. **P (Pseudocode)**: Reference `systemPatterns.md` for conventions
3. **A (Architecture)**: Check `systemPatterns.md` for consistency
4. **R (Refinement)**: Update `activeContext.md` with plans
5. **C (Completion)**: Update `progress.md` with completed work

## Usage Guidelines

### For Developers

1. **Before Starting Work**: Read relevant Memory Bank files to understand current context
2. **During Development**: Update `activeContext.md` to track your focus
3. **After Major Decisions**: Document in `decisionLog.md`
4. **After Completing Work**: Update `progress.md`

### For AI Assistants (Roo Code)

1. **Session Start**: Read all Memory Bank files if they exist
2. **During Work**: Reference Memory Bank for architectural decisions
3. **Significant Changes**: Update relevant files with timestamps
4. **Session End**: Use `UMB` (Update Memory Bank) command to synchronize

### For GitHub Copilot

- Always reference Memory Bank as source of truth
- Follow patterns documented in `systemPatterns.md`
- Defer to Roo Code for strategic updates
- Suggest updates when observing significant changes

## Synchronization

### Manual Update
Use the `UMB` (Update Memory Bank) command in Roo Code to force synchronization of session information.

### Automatic Updates
Memory Bank files are automatically updated by Roo Code when:
- Architectural decisions are made
- Patterns are introduced or modified
- Focus areas change
- Tasks are completed or status changes

## Best Practices

1. **Be Concise**: Keep entries clear and to the point
2. **Use Timestamps**: Always include timestamps in format `[YYYY-MM-DD HH:MM:SS]`
3. **Don't Duplicate**: Avoid repeating information across files
4. **Link Context**: Reference other files when needed
5. **Review Regularly**: Periodically review and clean up outdated information
6. **Version Control**: Commit Memory Bank updates to source control

## File Format

All Memory Bank files use Markdown format with consistent structure:
- Clear headers and sections
- Timestamp format: `[YYYY-MM-DD HH:MM:SS]`
- Templates provided in each file
- Change history logged at the bottom

## Maintenance

- **Review Frequency**: Monthly or as needed
- **Ownership**: Development team and AI assistants
- **Updates**: Continuous throughout development
- **Cleanup**: Remove outdated entries during reviews

---

## Quick Reference

| Need to... | Update File... |
|------------|---------------|
| Add a new goal or feature | `productContext.md` |
| Change current focus | `activeContext.md` |
| Document a decision | `decisionLog.md` |
| Add a coding pattern | `systemPatterns.md` |
| Mark task complete | `progress.md` |
| Update tech stack | `techContext.md` |

## Getting Started

1. If you're new to the project, start by reading `productContext.md`
2. Check `activeContext.md` to see what's currently happening
3. Review `systemPatterns.md` to understand coding conventions
4. Look at `progress.md` to see what's been done and what's next
5. Read `decisionLog.md` to understand why certain choices were made

---

**Last Updated**: [To be filled]
**Framework**: Enes Cingoz Memory Bank + SPARC2
**Maintained By**: Development Team + Roo Code AI
