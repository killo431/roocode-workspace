# roocode-workspace

The roocode-workspace repository is a powerful and flexible workspace template designed specifically for developers using Roo Code. It provides an optimized environment to streamline project development through SPARC orchestration and AI-assisted workflows in Visual Studio Code (VS Code).

This repository introduces enhanced modes that make it easier to develop, manage, and maintain your projects efficiently. By leveraging persistent project context and fine-tuned mode interactions, it minimizes token consumption while maximizing productivity.

**In short, this repository combines RooFlow's memory bank + RooFlow's boomerang mode + SPARC Orchestration modes (including memory bank).**

---

## 🚀 Quick Start

**New to the Golden Template?** Get started in minutes with our interactive wizard!

```bash
./init-template.sh
```

This will guide you through project setup and initialize your Memory Bank with your specific information.

📖 **[Read the Complete Quick Start Guide](QUICKSTART.md)** for detailed instructions and best practices.

---

## Sources
- **RooFlow (0.3.6)**: https://github.com/GreatScottyMac/RooFlow
- **roocode-modes**: https://github.com/enescingoz/roocode-modes
- https://www.linkedin.com/pulse/boomerang-tasks-automating-code-development-roo-sparc-reuven-cohen-nr3zc

---

☕ Before exploring the quick installation steps, grab your coffee-and if you enjoy my work, don’t forget to buy me a coffee! 

<a href="https://buymeacoffee.com/enescingoz" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/default-orange.png" alt="Buy Me A Coffee" height="41" width="174"></a>


---

## Usage
### Requirements
- Vscode as an editor

### Instructions
1. **Create a Repository from Template**  
   Click the `Use this template` button located at the top-right of the [repository page](https://github.com/enescingoz/roocode-workspace). This will allow you to create a new repository based on the template. 
  
2. **Initialize Your Project Repository**  
   After selecting the template, click the `Create a new repository` button to generate your own repository for the project.

3. **Automatic Setup**  
   All RooCode SPARC modes, RooFlow's boomerang mode and memory bank configurations will be automatically added to your project.

4. **Clone and Open in VS Code**  
   Clone your newly created repository to your local machine and open it in Visual Studio Code.

5. **Select RooCode Mode**  
   In RooCode, navigate to the bottom-left corner and select your desired mode. For first-time use, choose *Architect Mode*.

6. **Initialize Memory Bank**  
   You have two options:
   
   **Option A: Interactive Wizard (Recommended)**  
   Run the initialization script in your terminal:
   ```bash
   ./init-template.sh
   ```
   This wizard will ask you questions about your project and automatically populate all Memory Bank files with your answers.
   
   **Option B: Manual Initialization**  
   In RooCode chat, enter the command `initialize memory bank`. This will create a folder named `memory_bank` in your repository with template files that you'll need to fill in manually.

7. **Continue Development**  
   Proceed with your project development as desired while using the implemented modes. The memory bank will automatically update to reflect changes in your project.

8. **Force Synchronization**  
   At any point, you can type `Update Memory Bank` or `UMB` in RooCode chat to manually synchronize the session’s information with the memory bank. This ensures continuity across sessions or before switching modes.

---

## Modes
### ⚡️ SPARC Orchestrator (including memory bank)
**Role:** Breaks down large objectives into delegated subtasks aligned to the SPARC methodology.  
**Focus:** Secure, modular, testable, and maintainable delivery using advanced reasoning models.

---

### 📋 Specification & Pseudocode (including memory bank)
**Role:** Captures the complete project context and produces a modular pseudocode blueprint with TDD anchors.  
**Focus:** Clear, modular design; externalizes configuration; splits complex logic across modules.

---

### 🏗️ Architect (including memory bank)
**Role:** Designs scalable, secure, and modular architectures based on requirements and pseudocode.  
**Focus:** Detailed system diagrams, data flows, API boundaries, and service segmentation.

---

### 🧠 Code (including memory bank)
**Role:** Implements robust, efficient code using externalized configurations.  
**Focus:** Clean, modular code split into files under 500 lines, with no hard-coded secrets.

---

### 🧪 TDD (including memory bank)
**Role:** Enforces Test-Driven Development by writing failing tests first and then minimal code followed by refactoring.  
**Focus:** Thorough test coverage, modular test files, and adherence to security practices.

---

### 🪲 Debug (including memory bank)
**Role:** Troubleshoots and resolves runtime issues using logging, tracing, and analysis tools.  
**Focus:** Isolates and fixes bugs while keeping fixes modular and secure.

---

### 🛡️ Security Reviewer (including memory bank)
**Role:** Audits code and architecture to identify vulnerabilities and enforce secure practices.  
**Focus:** Detects exposed secrets, oversized files, and non-modular code, recommending necessary mitigations.

---

### 📚 Documentation Writer (including memory bank)
**Role:** Produces clear, comprehensive Markdown documentation for usage, configuration, and integration.  
**Focus:** Modular documentation (files under 500 lines) that avoids exposing sensitive data.

---

### 🔗 Integrator (including memory bank)
**Role:** Merges outputs from all specialized modes into a cohesive final product.  
**Focus:** Seamless integration of components ensuring modularity and adherence to security standards.

---

### 📈 Post-Deployment Monitor (including memory bank)
**Role:** Monitors system performance post-deployment, collecting metrics, logs, and user feedback.  
**Focus:** Continuous monitoring with secure, modular configurations and prompt escalation of issues.

---

### 🧹 Optimizer (including memory bank)
**Role:** Continuously refines and optimizes the codebase for performance, modularity, and maintainability.  
**Focus:** Refactoring, splitting large files, and externalizing configurations to meet best practices.

---

### ❓ Ask (including memory bank)
**Role:** Guides users in formulating precise, modular requests to delegate tasks to the correct specialized modes.  
**Focus:** Providing task formulation and delegation strategies for effective inquiries.

---

### 🚀 DevOps (including memory bank)
**Role:** Manages deployments and infrastructure operations across cloud providers, edge platforms, and internal environments.  
**Focus:** Secure, traceable, and automated deployments using CI/CD pipelines and managed configuration with no hard-coded credentials.

---

### 📘 SPARC Tutorial (including memory bank)
**Role:** Guides new users through the SPARC development process using structured thinking models and clear task delegation with `new_task`.  
**Focus:** Educates on modular project setup, best practices (no hard-coded environment variables; files under 500 lines), and effective mode-to-mode handoffs with concise completions via `attempt_completion`.

---

### 🪃 Boomerang mode (including memory bank)
**Role:** A strategic workflow orchestrator who efficiently coordinates complex tasks by delegating them to specialized modes. Ensures seamless task breakdown, delegation, and synthesis of results using structured tools and memory tracking.

**Focus:** Facilitates modular workflows by leveraging mode-specific expertise and maintaining clarity in task delegation. Uses the memory bank to track progress, analyze outcomes, and optimize workflows for improved efficiency.

---

## 📚 Memory Bank Structure
The Memory Bank is a directory named `memory-bank` located in your project's root. It contains several Markdown files that store different aspects of your project's knowledge:

| File                 | Purpose                                                                                                                               |
| -------------------- | ------------------------------------------------------------------------------------------------------------------------------------- |
| `activeContext.md`   | Tracks the current session's context: recent changes, current goals, and open questions/issues.                                       |
| `decisionLog.md`     | Records architectural and implementation decisions, including the context, decision, rationale, and implementation details.        |
| `productContext.md`  | Provides a high-level overview of the project, including its goals, features, and overall architecture.                             |
| `progress.md`        | Tracks the progress of the project, including completed work, current tasks, and next steps.  Uses a task list format.               |
| `systemPatterns.md` | (Optional) Documents recurring patterns and standards used in the project (coding patterns, architectural patterns, testing patterns). |

roocode-workflow automatically manages these files. You generally don't need to edit them directly, although you can review them to understand the AI's knowledge.

---

## Credits
- **RooFlow (0.3.6)**: https://github.com/GreatScottyMac/RooFlow
- **roocode-modes**: https://github.com/enescingoz/roocode-modes
- https://www.linkedin.com/pulse/boomerang-tasks-automating-code-development-roo-sparc-reuven-cohen-nr3zc

---

## License
[Apache 2.0](https://github.com/enescingoz/roocode-workspace/blob/main/LICENSE)
