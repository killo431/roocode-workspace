# Quick Start Guide

Welcome to the **Golden Template**! This guide will help you get started quickly with the Memory Bank + SPARC2 framework.

## 🚀 Two Ways to Get Started

### Option 1: Interactive CLI Wizard (Recommended)

The fastest way to initialize your project is using our interactive CLI tool.

#### Prerequisites
- Bash shell (Linux, macOS, or Git Bash on Windows)
- Git repository initialized

#### Run the Wizard

```bash
./init-template.sh
```

The wizard will guide you through:
1. **Project Information** - Name, description, tech stack
2. **Project Goals** - What you want to achieve
3. **Core Features** - Key functionality
4. **Development Setup** - Docker, Power Automate integration
5. **Current Focus** - Your immediate priorities

After completion, all Memory Bank files will be populated with your answers!

#### What Gets Created

The wizard initializes these files with your specific information:
- ✅ `memory-bank/productContext.md` - Your project overview
- ✅ `memory-bank/activeContext.md` - Your current focus
- ✅ `memory-bank/systemPatterns.md` - Patterns and standards
- ✅ `memory-bank/decisionLog.md` - Initial decisions documented
- ✅ `memory-bank/progress.md` - Task tracking initialized
- ✅ `memory-bank/techContext.md` - Technical setup details

### Option 2: Manual Setup

If you prefer manual control, follow these steps:

#### Step 1: Review the Template Files

All Memory Bank files are in the `memory-bank/` directory with placeholder content:

```bash
cd memory-bank/
ls -l
```

#### Step 2: Edit Each File

Open each file and replace the placeholder text:

1. **productContext.md** - Add your project description, goals, and features
2. **activeContext.md** - Set your current focus and sprint goals
3. **systemPatterns.md** - Define your coding standards and patterns
4. **decisionLog.md** - Document your initial architectural decisions
5. **progress.md** - Set up your task list and milestones
6. **techContext.md** - Document your technical stack and setup

#### Step 3: Review Configuration Files

- `.clinerules` - SPARC2 + Memory Bank workflow rules
- `.github/copilot-instructions.md` - GitHub Copilot configuration
- `docs/automation_hooks.md` - Power Automate integration

---

## 📚 Understanding the Framework

### What is the Golden Template?

The Golden Template combines three powerful frameworks:

1. **Memory Bank** (Enes Cingoz Framework)
   - 6-file knowledge system
   - Persistent project context
   - Team collaboration support

2. **SPARC2 Methodology**
   - S: Specification
   - P: Pseudocode
   - A: Architecture
   - R: Refinement
   - C: Completion

3. **Power Automate Integration**
   - Automation hooks documentation
   - JSON schema templates
   - Workflow integration

### How It Works

```
┌─────────────────────────────────────────────────┐
│  Developer/AI (Roo Code)                        │
│  ↓                                              │
│  1. Reads Memory Bank for context              │
│  2. Follows SPARC2 workflow                    │
│  3. Updates Memory Bank with changes           │
│  4. Syncs with GitHub Copilot                  │
└─────────────────────────────────────────────────┘
         ↓                                ↓
┌──────────────────┐              ┌──────────────┐
│  Memory Bank     │              │  Copilot     │
│  (Source of      │ ←─────────→  │  (Junior     │
│   Truth)         │              │   Assistant) │
└──────────────────┘              └──────────────┘
```

---

## 🎯 Using the Template

### Starting a New Development Session

1. **Open Roo Code** in VS Code
2. **Select a mode** from the bottom-left corner:
   - `architect` - Design and planning
   - `code` - Implementation
   - `tdd` - Test-driven development
   - `integration` - Power Automate setup

3. **Roo Code automatically reads Memory Bank** for context

### Following the SPARC2 Workflow

Before writing any code, follow these steps:

#### S - Specification
```bash
# In Roo Code, read:
memory-bank/productContext.md
```
Verify your goal aligns with project objectives.

#### P - Pseudocode
```bash
# In your code file, write:
// TODO: Implement user authentication
// 1. Validate credentials
// 2. Generate JWT token
// 3. Return user session
```

#### A - Architecture
```bash
# In Roo Code, check:
memory-bank/systemPatterns.md
```
Ensure consistency with established patterns.

#### R - Refinement
```bash
# In Roo Code, update:
memory-bank/activeContext.md
```
Document your plan and current focus.

#### C - Completion
```bash
# After coding, update:
memory-bank/progress.md
```
Mark tasks complete and update status.

### Updating the Memory Bank

#### Automatic Updates
Roo Code updates Memory Bank automatically when:
- Architectural decisions are made
- Patterns are introduced
- Focus areas change
- Tasks complete

#### Manual Sync
Force synchronization anytime:
```
Type in Roo Code chat: UMB
or: Update Memory Bank
```

---

## 🔧 Common Workflows

### Workflow 1: Adding a New Feature

1. **Architect Mode** - Design the feature
   - Update `systemPatterns.md` if new patterns needed
   - Document decision in `decisionLog.md`

2. **Code Mode** - Implement the feature
   - Follow SPARC2 workflow
   - Update `activeContext.md` with progress

3. **TDD Mode** - Write and run tests
   - Update `progress.md` when tests pass

4. **Integration Mode** - If API/webhook needed
   - Document in `docs/automation_hooks.md`

### Workflow 2: Onboarding a New Team Member

1. They read `memory-bank/README.md`
2. Review `productContext.md` for project overview
3. Check `activeContext.md` for current focus
4. Read `systemPatterns.md` for coding standards
5. Review `decisionLog.md` for past decisions

### Workflow 3: Power Automate Integration

1. **Design the hook** in Integration Mode
2. **Document in** `docs/automation_hooks.md`:
   ```json
   {
     "hookName": "user_created",
     "endpoint": "/api/hooks/user-created",
     "method": "POST",
     "inputSchema": { ... },
     "outputSchema": { ... }
   }
   ```
3. **Implement the endpoint** in Code Mode
4. **Test the integration** with Power Automate

---

## 📖 File Reference

### Memory Bank Files

| File | Purpose | Update When |
|------|---------|-------------|
| `productContext.md` | Project overview, goals, features | Goals or architecture change |
| `activeContext.md` | Current focus, recent changes | Focus shifts or progress made |
| `systemPatterns.md` | Coding standards, patterns | New patterns introduced |
| `decisionLog.md` | Decision records (ADRs) | Significant decisions made |
| `progress.md` | Task tracking, milestones | Tasks start/complete |
| `techContext.md` | Technical details, environment | Tech stack or tools change |

### Configuration Files

| File | Purpose | Modify When |
|------|---------|-------------|
| `.clinerules` | SPARC2 workflow rules | Workflow process changes |
| `.github/copilot-instructions.md` | Copilot behavior | Want to change Copilot guidance |
| `docs/automation_hooks.md` | Power Automate schemas | New hooks/APIs added |

---

## 💡 Best Practices

### DO ✅

- **Keep Memory Bank updated** - Use `UMB` regularly
- **Follow SPARC2** - Don't skip steps
- **Document decisions** - Future you will thank you
- **Use timestamps** - Format: `[YYYY-MM-DD HH:MM:SS]`
- **Keep files modular** - Max 500 lines per file
- **Externalize config** - Never hardcode secrets

### DON'T ❌

- **Don't skip Memory Bank** - It's your source of truth
- **Don't hardcode values** - Use environment variables
- **Don't ignore patterns** - Follow `systemPatterns.md`
- **Don't forget to commit** - Version control Memory Bank files
- **Don't duplicate info** - Each file has a specific purpose

---

## 🆘 Troubleshooting

### Problem: "Memory Bank feels overwhelming"

**Solution**: Start with just 3 files:
1. `productContext.md` - What is your project?
2. `activeContext.md` - What are you working on now?
3. `progress.md` - What's done and what's next?

Add others as needed.

### Problem: "Forgot to update Memory Bank"

**Solution**: 
```
In Roo Code: UMB
```
This forces a sync of current session.

### Problem: "Copilot suggesting wrong patterns"

**Solution**:
1. Update `memory-bank/systemPatterns.md` with correct pattern
2. Update `.github/copilot-instructions.md` if needed
3. Restart VS Code to refresh Copilot

### Problem: "Team not following SPARC2"

**Solution**:
1. Share this QUICKSTART guide
2. Review `.clinerules` in team meeting
3. Make SPARC2 part of code review checklist

---

## 🎓 Learning Resources

### Understanding SPARC2

- **Specification**: Define what you're building
- **Pseudocode**: Plan how to build it
- **Architecture**: Ensure it fits the system
- **Refinement**: Document your approach
- **Completion**: Implement and track progress

### Understanding Memory Bank

Think of it as your project's "brain":
- Remembers decisions (decisionLog.md)
- Knows current state (activeContext.md)
- Understands the big picture (productContext.md)
- Follows consistent patterns (systemPatterns.md)

### Roo Code Modes

- `ask` - Task formulation guide
- `architect` - Design and architecture
- `code` - Implementation
- `tdd` - Test-driven development
- `debug` - Troubleshooting
- `security-review` - Security audit
- `docs-writer` - Documentation
- `integration` - Power Automate specialist
- `sparc` - Complex workflow orchestrator
- `boomerang` - Task delegation coordinator

---

## 📞 Next Steps

1. ✅ **Run the initialization wizard**: `./init-template.sh`
2. ✅ **Review your Memory Bank files**: `cd memory-bank && ls`
3. ✅ **Open Roo Code** and select a mode
4. ✅ **Start coding** following SPARC2
5. ✅ **Keep Memory Bank updated** with `UMB`

---

## 🤝 Contributing

Found an issue or want to improve the template?
- Update the relevant files
- Document your changes in `memory-bank/decisionLog.md`
- Share with the team

---

**Happy coding with the Golden Template! 🚀**

*For detailed information about each component, see:*
- `memory-bank/README.md` - Memory Bank documentation
- `.clinerules` - SPARC2 workflow rules
- `docs/automation_hooks.md` - Power Automate integration
