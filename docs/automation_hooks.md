# Automation Hooks Documentation

This document contains all potential automation triggers with full JSON schemas for Power Automate integration.

## Purpose

Document stateless hooks that can be triggered by Power Automate workflows to ensure proper integration between Roo Code development and automated processes. Every new API endpoint or database trigger **MUST** be documented here with a complete JSON schema.

## Power Automate Hook Rule (Mandatory)

⚠️ **CRITICAL REQUIREMENT**: Whenever you create:
- A new API endpoint
- A database trigger or stored procedure
- A webhook or event handler
- Any other automation trigger point

You **MUST** document it in this file following the template below. This enables seamless integration with Power Automate Premium.

## Automation Hook Template

Use this template for every new automation hook:

```json
{
  "hookName": "example_hook",
  "version": "1.0.0",
  "description": "Detailed description of what this hook does",
  "triggerType": "api_endpoint | database_trigger | webhook | scheduled_task",
  "trigger": "Event that triggers this automation",
  "endpoint": "/api/v1/example (if applicable)",
  "method": "POST | GET | PUT | DELETE (if applicable)",
  "authentication": "bearer_token | api_key | none",
  "inputSchema": {
    "type": "object",
    "properties": {
      "field1": {
        "type": "string",
        "description": "Description of field1",
        "required": true,
        "example": "example_value"
      },
      "field2": {
        "type": "integer",
        "description": "Description of field2",
        "required": false,
        "example": 123
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
      },
      "status": {
        "type": "string",
        "enum": ["success", "error", "pending"],
        "description": "Status of the operation"
      },
      "timestamp": {
        "type": "string",
        "format": "date-time",
        "description": "When the operation completed"
      }
    }
  },
  "errorCodes": [
    {
      "code": "ERR_001",
      "description": "Description of error",
      "httpStatus": 400
    }
  ],
  "rateLimits": {
    "requestsPerMinute": 60,
    "requestsPerHour": 1000
  },
  "notes": "Additional implementation notes or usage guidelines"
}
```

---

## Available Hooks

*Add your automation hooks below as they are defined. Each hook should follow the template above.*

### Example: Memory Bank Update Hook

```json
{
  "hookName": "memory_bank_update",
  "version": "1.0.0",
  "description": "Triggers when Memory Bank files are updated, enabling automated synchronization with external systems",
  "triggerType": "webhook",
  "trigger": "File change in memory-bank/ directory",
  "endpoint": "/api/v1/hooks/memory-bank-update",
  "method": "POST",
  "authentication": "bearer_token",
  "inputSchema": {
    "type": "object",
    "properties": {
      "filePath": {
        "type": "string",
        "description": "Path to the updated file relative to memory-bank/",
        "required": true,
        "example": "systemPatterns.md"
      },
      "changeType": {
        "type": "string",
        "enum": ["created", "updated", "deleted"],
        "description": "Type of change that occurred",
        "required": true,
        "example": "updated"
      },
      "timestamp": {
        "type": "string",
        "format": "date-time",
        "description": "When the change occurred (ISO 8601 format)",
        "required": true,
        "example": "2024-01-15T14:30:00Z"
      },
      "userId": {
        "type": "string",
        "description": "ID of the user who made the change",
        "required": false,
        "example": "user_123"
      },
      "changeDescription": {
        "type": "string",
        "description": "Brief description of what changed",
        "required": false,
        "example": "Added new authentication pattern"
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
        "description": "Status message or error details"
      },
      "syncedTo": {
        "type": "array",
        "items": {
          "type": "string"
        },
        "description": "List of systems that were synchronized"
      }
    }
  },
  "errorCodes": [
    {
      "code": "MBU_001",
      "description": "Invalid file path provided",
      "httpStatus": 400
    },
    {
      "code": "MBU_002",
      "description": "Unauthorized access to memory bank",
      "httpStatus": 401
    },
    {
      "code": "MBU_003",
      "description": "Synchronization failed",
      "httpStatus": 500
    }
  ],
  "rateLimits": {
    "requestsPerMinute": 30,
    "requestsPerHour": 500
  },
  "notes": "This hook is automatically triggered when any file in the memory-bank directory is modified. External systems can use this to stay synchronized with architectural decisions."
}
```

### Example: API Deployment Hook

```json
{
  "hookName": "api_deployment",
  "version": "1.0.0",
  "description": "Triggers when a new API version is deployed, enabling automated testing and notification workflows",
  "triggerType": "api_endpoint",
  "trigger": "Successful deployment completion",
  "endpoint": "/api/v1/hooks/deployment",
  "method": "POST",
  "authentication": "api_key",
  "inputSchema": {
    "type": "object",
    "properties": {
      "environment": {
        "type": "string",
        "enum": ["development", "staging", "production"],
        "description": "Target deployment environment",
        "required": true,
        "example": "production"
      },
      "version": {
        "type": "string",
        "description": "Semantic version number",
        "required": true,
        "example": "1.2.3"
      },
      "deploymentId": {
        "type": "string",
        "description": "Unique identifier for this deployment",
        "required": true,
        "example": "deploy_abc123"
      },
      "services": {
        "type": "array",
        "items": {
          "type": "string"
        },
        "description": "List of services included in this deployment",
        "required": true,
        "example": ["api-gateway", "auth-service", "user-service"]
      }
    },
    "required": ["environment", "version", "deploymentId", "services"]
  },
  "outputSchema": {
    "type": "object",
    "properties": {
      "status": {
        "type": "string",
        "enum": ["success", "error", "pending"],
        "description": "Status of the deployment processing"
      },
      "testsTriggered": {
        "type": "boolean",
        "description": "Whether automated tests were triggered"
      },
      "notificationsSent": {
        "type": "array",
        "items": {
          "type": "string"
        },
        "description": "List of notification channels that were alerted"
      },
      "timestamp": {
        "type": "string",
        "format": "date-time",
        "description": "When the hook was processed"
      }
    }
  },
  "errorCodes": [
    {
      "code": "DEPLOY_001",
      "description": "Invalid environment specified",
      "httpStatus": 400
    },
    {
      "code": "DEPLOY_002",
      "description": "Deployment ID not found",
      "httpStatus": 404
    }
  ],
  "rateLimits": {
    "requestsPerMinute": 10,
    "requestsPerHour": 100
  },
  "notes": "Use this hook to trigger post-deployment workflows such as smoke tests, rollback procedures, or team notifications."
}
```

---

## Best Practices

### When Creating New Hooks

1. **Be Descriptive**: Provide clear, comprehensive descriptions of what the hook does
2. **Version Control**: Always include a version number and update it when the schema changes
3. **Error Handling**: Document all possible error codes and their meanings
4. **Rate Limits**: Define realistic rate limits to prevent system overload
5. **Security**: Always specify authentication requirements
6. **Examples**: Include example values for all fields to aid implementation

### JSON Schema Guidelines

- Use standard JSON Schema format
- Mark required fields explicitly
- Use enums for fields with limited valid values
- Include format specifications for dates, emails, URLs, etc.
- Provide example values for clarity

### Power Automate Integration

- Test hooks with Power Automate Premium before production deployment
- Document any special configuration needed in Power Automate
- Include retry logic and error handling in your automation workflows
- Monitor hook usage and performance regularly

---

## Maintenance

This document should be updated whenever:
- A new API endpoint is created
- A database trigger is added
- A webhook or event handler is implemented
- An existing hook's schema changes (increment version number)
- A hook is deprecated or removed (mark as deprecated, don't delete)

**Last Updated:** [To be filled with current date when hooks are added]
**Maintained By:** Development Team
**Review Frequency:** Monthly or as needed

