# Automation Hooks Documentation

This document contains all potential automation triggers with full JSON schemas for Power Automate integration.

## Purpose

Document stateless hooks that can be triggered by Power Automate workflows to ensure proper integration between Roo Code development and automated processes.

## Automation Triggers

### Template

Each automation trigger should follow this format:

```json
{
  "hookName": "example_hook",
  "description": "Description of what this hook does",
  "trigger": "Event that triggers this automation",
  "inputSchema": {
    "type": "object",
    "properties": {
      "field1": {
        "type": "string",
        "description": "Description of field1"
      }
    },
    "required": ["field1"]
  },
  "outputSchema": {
    "type": "object",
    "properties": {
      "result": {
        "type": "string",
        "description": "Result of the operation"
      }
    }
  }
}
```

---

## Available Hooks

*Add your automation hooks below as they are defined*

<!-- Example:
### Memory Bank Update Hook

```json
{
  "hookName": "memory_bank_update",
  "description": "Triggers when Memory Bank files are updated",
  "trigger": "File change in memory-bank/ directory",
  "inputSchema": {
    "type": "object",
    "properties": {
      "filePath": {
        "type": "string",
        "description": "Path to the updated file"
      },
      "changeType": {
        "type": "string",
        "enum": ["created", "updated", "deleted"],
        "description": "Type of change"
      },
      "timestamp": {
        "type": "string",
        "format": "date-time",
        "description": "When the change occurred"
      }
    },
    "required": ["filePath", "changeType", "timestamp"]
  },
  "outputSchema": {
    "type": "object",
    "properties": {
      "processed": {
        "type": "boolean",
        "description": "Whether the update was processed successfully"
      },
      "message": {
        "type": "string",
        "description": "Status message"
      }
    }
  }
}
```
-->
