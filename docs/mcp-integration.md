# MCP Server Integration Guide

## 🔌 Model Context Protocol (MCP) Overview

MCP enables Claude Code to interact with external services, databases, APIs, and file systems through standardized server implementations.

---

## 🎯 Available MCP Servers

### Official MCP Servers

#### Filesystem Server
**Purpose:** Secure file operations with configurable access
**Use Cases:**
- Browse local/remote directories
- Read and write files safely
- Sync files across machines

**Installation:**
```bash
npm install -g @modelcontextprotocol/server-filesystem
```

**Configuration:**
```json
{
  "mcpServers": {
    "filesystem": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-filesystem", "/path/to/allowed/directory"]
    }
  }
}
```

#### Git Server
**Purpose:** Git operations as tools
**Use Cases:**
- Inspect branches, diffs, logs
- Read repository files
- Automated git workflows

**Installation:**
```bash
npm install -g @modelcontextprotocol/server-git
```

#### GitHub Server
**Purpose:** GitHub API integration
**Use Cases:**
- Create/manage issues and PRs
- Repository operations
- Code search across GitHub

**Already configured in your setup!**

### Database MCP Servers

#### PostgreSQL
**Servers:**
- `FreePeak/db-mcp-server` - High-performance multi-database
- Direct PostgreSQL MCP implementations

**Use Cases:**
- Schema inspection and queries
- Database migrations
- Data analysis

#### MySQL
**Servers:**
- `designcomputer/mysql_mcp_server` - Configurable access controls
- `f4ww4z/mcp-mysql-server` - Secure interaction

#### Firebase
**Server:** Firebase MCP (if available)
**Use Cases:**
- Firestore queries
- Auth management
- Storage operations

#### Supabase
**Server:** Supabase MCP
**Use Cases:**
- Database, auth, edge functions
- Real-time subscriptions

### Cloud Storage MCP Servers

#### Cloudflare
**Services:** Workers, KV, R2, D1
**Use Cases:**
- Edge computing
- Key-value storage
- Object storage
- Serverless SQL

#### Qiniu Cloud
**Server:** `qiniu/qiniu-mcp-server`
**Use Cases:**
- Cloud storage access
- Media processing

#### DuckDB
**Server:** `mustafahasankhan/duckdb-mcp-server`
**Use Cases:**
- Advanced data analysis
- Multi-source data integration
- Cloud storage queries

### Specialized MCP Servers

#### Memory Server
**Purpose:** Knowledge-graph-based persistent memory
**Use Cases:**
- Remember context across sessions
- Build knowledge graphs
- Long-term project memory

#### Sequential Thinking Server
**Purpose:** Structured reasoning
**Use Cases:**
- Complex problem solving
- Multi-step planning
- Decision making

#### Fetch Server
**Purpose:** Web content retrieval
**Use Cases:**
- Documentation fetching
- API testing
- Web scraping

---

## 🛠️ Setting Up MCP Servers

### Configuration File Location

**User-level:** `~/.claude/config.json`
**Project-level:** `./.claude/config.json`

### Example Configuration

```json
{
  "mcpServers": {
    "github": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-github"],
      "env": {
        "GITHUB_TOKEN": "your_token_here"
      }
    },
    "filesystem": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-filesystem", "~/projects"]
    },
    "postgres": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-postgres"],
      "env": {
        "DATABASE_URL": "postgresql://user:pass@localhost:5432/db"
      }
    }
  }
}
```

---

## 🚀 Use Cases & Workflows

### Workflow 1: Multi-Repo Code Search

**Setup:**
```json
{
  "filesystem": {
    "args": ["-y", "@modelcontextprotocol/server-filesystem", "~/projects"]
  }
}
```

**Usage:**
```markdown
Claude can now search across all projects in ~/projects
- Find code patterns across repos
- Identify shared utilities
- Standardize implementations
```

### Workflow 2: Database-Driven Development

**Setup:**
```json
{
  "postgres": {
    "env": {"DATABASE_URL": "..."}
  }
}
```

**Usage:**
```markdown
Claude can:
- Inspect database schema
- Generate TypeScript types from schema
- Write queries and test them
- Create migrations
```

### Workflow 3: Cross-Platform File Sync

**Setup filesystem MCP on multiple machines**

**Usage:**
```markdown
Claude can:
- Access files from any configured machine
- Sync templates across computers
- Read cloud-synced directories
```

### Workflow 4: Persistent Project Memory

**Setup:**
```json
{
  "memory": {
    "command": "npx",
    "args": ["-y", "@modelcontextprotocol/server-memory"]
  }
}
```

**Usage:**
```markdown
Claude can:
- Remember project decisions
- Store architecture notes
- Track refactoring plans
- Build project knowledge graph
```

---

## 🔒 Security Considerations

### Environment Variables

**DO:**
- Use environment variables for secrets
- Store in `.env` files (gitignored)
- Use different tokens for dev/prod

**DON'T:**
- Hardcode tokens in config files
- Commit secrets to version control
- Share production credentials

### Access Controls

**Filesystem MCP:**
- Limit to specific directories
- Use read-only when possible
- Avoid root directory access

**Database MCP:**
- Use read-only user for queries
- Separate credentials for migrations
- Validate queries before execution

---

## 📚 Resources

**Official MCP Documentation:**
- https://modelcontextprotocol.io/
- https://github.com/modelcontextprotocol/servers

**Awesome MCP Lists:**
- https://github.com/wong2/awesome-mcp-servers
- https://github.com/punkpeye/awesome-mcp-servers
- https://github.com/appcypher/awesome-mcp-servers
- https://mcpservers.org/

**DevOps-Focused:**
- https://github.com/rohitg00/awesome-devops-mcp-servers

---

## 🔧 Troubleshooting

### Server Won't Start

```bash
# Check if package is installed
npx @modelcontextprotocol/server-[name] --version

# Check config syntax
cat ~/.claude/config.json | jq

# Check logs
tail -f ~/.claude/logs/mcp-server-[name].log
```

### Authentication Errors

```bash
# Verify environment variables
echo $GITHUB_TOKEN
echo $DATABASE_URL

# Test credentials manually
gh auth status  # For GitHub
psql $DATABASE_URL -c "SELECT 1"  # For PostgreSQL
```

### Permission Denied

```bash
# Check directory permissions
ls -la /path/to/directory

# Verify user has access
id
groups
```

---

**Last Updated:** 2026-01-02
