# QMOOSA AgentPay ($QAGT)
[![CI/CD Pipeline](https://github.com/elon00/qmoosa-agentpay/actions/workflows/ci-cd-pipeline.yml/badge.svg)](https://github.com/elon00/qmoosa-agentpay/actions/workflows/ci-cd-pipeline.yml)
[![Reality Check](https://img.shields.io/badge/Reality%20Check-100%2F100%20GENUINE%20GREEN-emerald.svg)](tests/reality_check_harness.py)
[![Hackathon](https://img.shields.io/badge/Hackathon-TUM%20Blockchain%20Hackathon%20(Munich)-blue.svg)]()
[![PQC Standard](https://img.shields.io/badge/NIST-FIPS%20203%2F204-purple.svg)]()

> **Permissioned AI-agent commerce, verifiable payment policies, authenticated tool calls and auditable settlements.**

---

## 🏆 Hackathon Profile
- **Target Event:** TUM Blockchain Hackathon (Munich)
- **Track:** Permissioned Agentic Payments, Cardano, BSV & API3 Tracks
- **Deadline:** October 30-31, 2026
- **Prize Pool:** €12,000 cash tracks
- **Blockchain:** Multi-Adapter (API3 / Cardano / EVM L2)

---

## 🚀 Key Features
- **64-bit Conway State Engine:** Deterministic cellular automaton state machine running 10,000 cycles in zero-dependency Rust.
- **Native Smart Contract:** `AgentPayPolicy.sol` optimized for Multi-Adapter (API3 / Cardano / EVM L2).
- **Agentic Service & x402 Gateway:** Autonomous Python payment client in `src/agent_negotiator.py`.
- **Interactive QUX Launchpad:** Full-stack responsive HTML5 dashboard with Conway visualizer and Web4 QR generation in `index.html`.
- **Model Context Protocol (MCP):** 2 native tools exposed via `mcp.json`.

---

## 🧪 Testing & Verification
```bash
# Run 5-Gate Reality Check Test Harness
python tests/reality_check_harness.py

# Run Full Unit & Integrity Test Suite
python -m unittest tests/test_suite.py
```
