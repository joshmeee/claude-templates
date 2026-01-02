# Claude Code Instructions - AI Agent Workflows & Automation

## 🤖 Advanced Agent Orchestration

This template provides patterns for leveraging Claude Code's agent system to create powerful automation workflows.

---

## 🎯 Understanding Claude Code Agents

### Available Agent Types

1. **general-purpose** - Complex multi-step tasks, code search, research
2. **Explore** - Fast codebase exploration, finding files and patterns
3. **Plan** - Software architecture and implementation planning
4. **claude-code-guide** - Claude Code and API documentation lookups

### When to Use Each Agent

**Use Explore Agent when:**
- Finding files by patterns (e.g., "src/components/**/*.tsx")
- Searching for keywords across codebase
- Answering questions about codebase structure
- Understanding how features are implemented

**Use Plan Agent when:**
- Designing implementation strategies
- Planning multi-file refactors
- Considering architectural trade-offs
- Breaking down complex features

**Use general-purpose Agent when:**
- Executing complex multi-step workflows
- Performing research that requires multiple tool calls
- Searching for code patterns that may take multiple tries

---

## 🛠️ Task Automation Patterns

### Pattern 1: Comprehensive Code Review

```markdown
## Automated Code Review Workflow

When I request a code review, Claude should:

1. **Use Explore agent** to understand the changed files
2. **Check for:**
   - TypeScript errors and type safety
   - Security vulnerabilities (OWASP top 10)
   - Performance issues
   - Missing tests
   - Code style violations
3. **Use TodoWrite** to track review findings
4. **Provide:**
   - Summary of issues by severity
   - Specific file/line references
   - Suggested fixes
   - Security concerns highlighted
```

### Pattern 2: Feature Implementation Pipeline

```markdown
## Feature Implementation Workflow

When implementing a new feature:

1. **Use Plan agent** to design the implementation
2. **Use TodoWrite** to break down tasks:
   - [ ] Research existing patterns
   - [ ] Create types/interfaces
   - [ ] Implement core logic
   - [ ] Add tests
   - [ ] Update documentation
   - [ ] Manual testing checklist
3. **Use Explore agent** to find similar implementations
4. **Execute** each task sequentially
5. **Mark complete** only when tests pass
```

### Pattern 3: Debugging Workflow

```markdown
## Systematic Debugging Process

When debugging an issue:

1. **Use Explore agent** to find relevant code
2. **Use TodoWrite** to track investigation:
   - [ ] Reproduce the issue
   - [ ] Identify root cause
   - [ ] Develop fix
   - [ ] Add regression test
   - [ ] Verify fix works
3. **Use LSP tools** to trace function calls
4. **Document** the issue and solution
```

### Pattern 4: Refactoring Workflow

```markdown
## Safe Refactoring Process

When refactoring code:

1. **Use Plan agent** to design refactoring strategy
2. **Use Explore agent** to find all affected files
3. **Use TodoWrite** to track changes:
   - [ ] Run tests before changes (baseline)
   - [ ] Extract/move code
   - [ ] Update imports
   - [ ] Update tests
   - [ ] Run tests after changes
   - [ ] Update documentation
4. **Use LSP findReferences** to ensure nothing is missed
5. **Verify** no functionality changes
```

---

## 🔄 Parallel Agent Execution

### When to Run Agents in Parallel

```markdown
## Parallel Task Execution

Claude should run agents in parallel when:
- Tasks are independent
- No data dependencies between tasks
- Want faster results

**Example: Multi-platform testing**
- Launch iOS test agent
- Launch Android test agent
- Launch web test agent
- Aggregate results when all complete

**Example: Code analysis**
- Launch security scan agent
- Launch performance analysis agent
- Launch code style check agent
- Report all findings together
```

---

## 🧠 Context Management Strategies

### Keeping Context Focused

```markdown
## Context Optimization

**Do:**
- Use targeted searches (Grep/Glob) for specific needs
- Read only relevant files
- Use Explore agent for broad questions
- Break large tasks into smaller chunks

**Don't:**
- Read entire codebase unnecessarily
- Keep unused context loaded
- Read files multiple times
- Use bash commands for file operations
```

### Progressive Context Building

```markdown
## Layered Understanding Approach

1. **High-level:** Use Explore agent for architecture
2. **Mid-level:** Read key files and interfaces
3. **Detail-level:** Read specific implementations
4. **Only when needed:** Read tests and docs
```

---

## 📊 Progress Tracking with TodoWrite

### Task Breakdown Best Practices

```markdown
## TodoWrite Usage Guidelines

**When to use TodoWrite:**
- Tasks with 3+ steps
- Complex multi-file changes
- User provides multiple requests
- Non-trivial implementations

**Task states:**
- `pending` - Not started
- `in_progress` - Currently working (ONLY ONE at a time)
- `completed` - Done successfully

**Task naming:**
- content: Imperative form ("Run tests")
- activeForm: Present continuous ("Running tests")

**Update frequency:**
- Mark in_progress BEFORE starting work
- Mark completed IMMEDIATELY after finishing
- Don't batch completions
```

### Example: Complex Feature Todo List

```markdown
[
  {"content": "Research existing authentication patterns", "status": "completed", "activeForm": "Researching authentication patterns"},
  {"content": "Design new auth flow architecture", "status": "completed", "activeForm": "Designing auth flow architecture"},
  {"content": "Implement auth service with Firebase", "status": "in_progress", "activeForm": "Implementing auth service"},
  {"content": "Add authentication UI components", "status": "pending", "activeForm": "Adding auth UI components"},
  {"content": "Write auth integration tests", "status": "pending", "activeForm": "Writing auth tests"},
  {"content": "Update security rules for authenticated users", "status": "pending", "activeForm": "Updating security rules"},
  {"content": "Test authentication flow end-to-end", "status": "pending", "activeForm": "Testing auth flow"}
]
```

---

## 🔍 Code Search Optimization

### Search Strategy Decision Tree

```markdown
## When to Use Which Search Tool

**Use Glob when:**
- Looking for files by name/pattern
- Need file paths, not content
- Example: "**/*.test.ts", "src/components/**/*.tsx"

**Use Grep when:**
- Searching for code content
- Finding function/class definitions
- Looking for specific patterns
- Example: "class.*Service", "export function"

**Use Explore agent when:**
- Open-ended search ("where is auth handled?")
- Understanding codebase structure
- Finding related implementations
- May need multiple search iterations

**Use LSP when:**
- Finding all references to a symbol
- Going to definition
- Finding implementations of interface
- Getting hover information/docs
```

---

## ⚙️ Custom Automation Workflows

### Creating Project-Specific Agents

```markdown
## Define Custom Workflows

### Pre-Commit Workflow

Before committing code, Claude should automatically:
1. Run linter and fix auto-fixable issues
2. Run type checker
3. Run tests
4. Check for console.log statements
5. Check for TODO comments
6. Generate/update documentation if needed
7. Only proceed if all checks pass

### PR Creation Workflow

When creating a pull request, Claude should:
1. Review all changed files
2. Generate PR description:
   - Summary of changes
   - Testing checklist
   - Breaking changes (if any)
   - Screenshots (if UI changes)
3. Run full test suite
4. Create PR with gh CLI
5. Request reviewers if specified

### Deployment Workflow

When deploying, Claude should:
1. Verify we're on correct branch
2. Check all tests pass
3. Build production bundle
4. Run deployment command
5. Verify deployment success
6. Create git tag for release
7. Update changelog
```

---

## 🚦 Error Handling & Recovery

### Failure Handling Patterns

```markdown
## When Things Go Wrong

### Test Failures
1. Don't mark task as completed
2. Create new todo for fixing the failure
3. Investigate root cause
4. Fix and re-run tests
5. Only mark complete when tests pass

### Build Failures
1. Read error messages carefully
2. Use Explore agent to find related code
3. Fix issues one at a time
4. Re-run build after each fix
5. Don't accumulate fixes

### Deployment Failures
1. Roll back if necessary
2. Investigate logs
3. Fix root cause
4. Test locally
5. Re-deploy with verification
```

---

## 🔒 Security-First Automation

### Security Checks Integration

```markdown
## Automated Security Review

On every significant code change:

1. **Check for secrets:**
   - API keys in code
   - Hardcoded passwords
   - Tokens in version control

2. **Validate input handling:**
   - SQL injection risks
   - XSS vulnerabilities
   - Command injection
   - Path traversal

3. **Review authentication:**
   - Proper auth checks
   - Authorization logic
   - Session management

4. **Check dependencies:**
   - Known vulnerabilities
   - Outdated packages
   - License compatibility
```

---

## 📦 Workflow Templates

### New Feature Template

```markdown
When I say "add feature: [FEATURE_NAME]", Claude should:

1. Use Plan agent to design the feature
2. Ask clarifying questions if needed
3. Create comprehensive todo list
4. Use Explore agent to find similar features
5. Implement following existing patterns
6. Write tests alongside code
7. Update relevant documentation
8. Create PR when complete
```

### Bug Fix Template

```markdown
When I report a bug, Claude should:

1. Use Explore agent to locate relevant code
2. Use LSP to trace execution path
3. Reproduce the issue locally if possible
4. Identify root cause
5. Propose fix with explanation
6. Implement fix
7. Add regression test
8. Verify fix works
9. Update any related documentation
```

### Performance Optimization Template

```markdown
When optimizing performance, Claude should:

1. Establish baseline metrics
2. Use Explore agent to find bottlenecks
3. Propose optimization strategies
4. Implement optimizations incrementally
5. Measure impact after each change
6. Ensure no functionality regression
7. Document performance improvements
```

---

## 📊 Metrics & Monitoring

### Track Automation Success

```markdown
## Success Metrics

**Task Completion Rate:**
- All subtasks marked completed
- Tests passing
- No errors or warnings

**Code Quality Metrics:**
- Test coverage maintained/improved
- No new TypeScript errors
- Linter warnings resolved
- No security vulnerabilities introduced

**Efficiency Metrics:**
- Time from request to completion
- Number of iterations needed
- Parallel tasks executed successfully
```

---

## 📝 Documentation Generation

### Auto-Documentation Workflows

```markdown
## Documentation Automation

**When code changes, update:**
- JSDoc/TSDoc comments
- README.md if public API changes
- CHANGELOG.md for significant changes
- Architecture docs if structure changes

**Generate documentation for:**
- New API endpoints
- New components
- New utilities/helpers
- Configuration changes
```

---

## 🎯 Best Practices Summary

### Do's
✅ Use TodoWrite for multi-step tasks
✅ Use appropriate agent for each task type
✅ Run agents in parallel when possible
✅ Keep context focused and relevant
✅ Mark tasks complete immediately
✅ Ask questions when unclear
✅ Run tests after significant changes
✅ Follow existing code patterns

### Don'ts
❌ Don't skip planning for complex tasks
❌ Don't mark tasks complete prematurely
❌ Don't read unnecessary files
❌ Don't use bash for file operations
❌ Don't proceed without clarification
❌ Don't ignore test failures
❌ Don't over-engineer solutions
❌ Don't introduce security vulnerabilities

---

**Last Updated:** 2026-01-02
