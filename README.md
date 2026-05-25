# Libre Parasite Miner

Mine Bitcoin to the Parasite Pool using your Libre node on Umbrel.

## Features

- **Stratum Mining Proxy** - Connect your Bitaxe or other ASIC miners
- **Libre RPC Integration** - Auto-discovers Libre node on same Umbrel
- **Parasite Pool** - Hardcoded connection to `parasite.wtf:42069`
- **Real-time Monitoring** - Dashboard with hashrate, shares, and worker stats

## Quick Start

1. Install on Umbrel (Community Store → Add Parasite Libre BTC)
2. Set your BTC payout wallet address in Settings
3. Point your miners to: `stratum+tcp://<umbrel-ip>:42070`
4. Monitor stats on the dashboard (port 42071)

## Port Layout

- **42070** - Miner connection (Stratum proxy listen port)
- **42071** - Web UI/Dashboard
- **8332** - Libre RPC (internal only, auto-discovered)

## Configuration

### Environment Variables

- `POOL_WALLET` - Your BTC payout address (required)
- `LIBRE_RPC_HOST` - Libre node host (default: `libre-app`)
- `LIBRE_RPC_PORT` - Libre RPC port (default: `8332`)
- `LIBRE_RPC_USER` - Libre auth username (optional)
- `LIBRE_RPC_PASS` - Libre auth password (optional)

## Architecture

```
Bitaxe/ASIC Miner
       ↓
  Port 42070 (Stratum)
       ↓
  Stratum Proxy Container
       ↓ (connects to)
  Parasite Pool (parasite.wtf:42069)
  + Libre RPC (libre-app:8332)
       ↓
  Web Dashboard (port 42071)
```

## License

MIT
