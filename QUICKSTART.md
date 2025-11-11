# GenMedia Creative Studio - Quick Start Guide

## 🚀 Application Status
**Running:** ✅  
**URL:** http://localhost:8080  
**Mode:** Development (Mock/Local)

## 📋 Common Commands

### Start the Application
```bash
./devserver.sh
# OR
uv run python main.py
```

### Stop the Application
```bash
pkill -f "python main.py"
```

### View Logs
```bash
tail -f app.log
```

### Check Application Status
```bash
ps aux | grep "python main.py" | grep -v grep
curl -I http://localhost:8080/
```

### Run Tests
```bash
uv run pytest
```

### Format Code
```bash
uv run ruff format .
```

### Lint Code
```bash
uv run ruff check .
```

### Auto-fix Linting Issues
```bash
uv run ruff check --fix .
```

## 🔧 Configuration Files

- **`.env`** - Environment variables and configuration
- **`config/default.py`** - Application defaults and settings
- **`main.py`** - Application entry point

## 📁 Key Directories

- **`pages/`** - Application pages/routes
- **`components/`** - Reusable UI components
- **`models/`** - Business logic and model interactions
- **`state/`** - Application state management
- **`common/`** - Shared utilities (storage, metadata, etc.)
- **`config/`** - Configuration files

## ⚙️ Current Configuration

- **Project ID:** glass-radar-476711-a6
- **Service Account:** admin@xennials.tech
- **Environment:** local
- **Firebase:** Skipped (SKIP_FIREBASE_INIT=true)
- **Port:** 8080

## 🔐 Authentication

Currently running in **mock mode** without GCP credentials.

To enable full functionality:
1. Set up Google Cloud credentials
2. Remove or set `SKIP_FIREBASE_INIT=false` in `.env`
3. Ensure Firestore and GCS resources exist

## 📝 Features Available in Mock Mode

- ✅ UI and navigation
- ✅ Local model configuration
- ⚠️ Limited: Media storage (no GCS)
- ⚠️ Limited: Metadata persistence (no Firestore)
- ⚠️ Limited: Generative AI features (requires GCP auth)

## 🛠️ Troubleshooting

### Port Already in Use
```bash
# Find and kill the process
lsof -ti:8080 | xargs kill -9
# OR
pkill -f "python main.py"
```

### Module Not Found Errors
```bash
# Reinstall dependencies
uv sync
```

### Permission Issues
```bash
chmod +x devserver.sh
```

## 📚 Documentation

- **README.md** - Full project documentation
- **AGENTS.md** - Guidelines for AI agents/developers
- **developers_guide.md** - Developer guide
- **tutorial.md** - Tutorial for getting started

## 🔗 Useful Links

- [Mesop Documentation](https://mesop-dev.github.io/mesop/)
- [Google Cloud Vertex AI](https://cloud.google.com/vertex-ai)
- [Project Repository](https://github.com/GoogleCloudPlatform/vertex-ai-creative-studio)

---
**Built with:** Python 3.12, Mesop, FastAPI, Google Cloud AI Platform
