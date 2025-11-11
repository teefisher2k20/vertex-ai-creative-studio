#!/bin/bash
# Google Cloud Authentication Setup Script

echo "=== Google Cloud Authentication Setup ==="
echo ""
echo "You have two options:"
echo ""
echo "Option 1: Use Service Account Key (for automated/CI environments)"
echo "Option 2: Use gcloud CLI authentication (for interactive development)"
echo ""

# Check if gcloud is installed
if ! command -v gcloud &> /dev/null; then
    echo "⚠️  gcloud CLI is not installed."
    echo ""
    echo "To install gcloud CLI:"
    echo "  curl https://sdk.cloud.google.com | bash"
    echo "  exec -l \$SHELL"
    echo "  gcloud init"
    echo ""
fi

echo "=== Option 1: Service Account Key ==="
echo ""
echo "Steps:"
echo "1. Go to: https://console.cloud.google.com/iam-admin/serviceaccounts"
echo "2. Select your project: glass-radar-476711-a6"
echo "3. Click on your service account"
echo "4. Go to 'Keys' tab"
echo "5. Click 'Add Key' > 'Create new key' > 'JSON'"
echo "6. Download the JSON key file"
echo "7. Place it in this directory as 'service-account-key.json'"
echo ""
echo "Then run:"
echo "  export GOOGLE_APPLICATION_CREDENTIALS=\"\$PWD/service-account-key.json\""
echo "  echo 'GOOGLE_APPLICATION_CREDENTIALS=\"\$PWD/service-account-key.json\"' >> .env"
echo ""

echo "=== Option 2: gcloud CLI Authentication ==="
echo ""
echo "After installing gcloud CLI, run:"
echo "  gcloud auth application-default login"
echo "  gcloud config set project glass-radar-476711-a6"
echo ""

echo "=== Option 3: Continue with Mock Mode (Current) ==="
echo ""
echo "Your .env file has SKIP_FIREBASE_INIT=true"
echo "This allows local development without Google Cloud credentials."
echo "Some features requiring real GCP services won't work, but the app runs."
echo ""

# Check current .env settings
if [ -f ".env" ]; then
    echo "Current .env authentication settings:"
    grep -E "(GOOGLE|SKIP_FIREBASE)" .env || echo "  No authentication variables set"
    echo ""
fi

echo "Which option would you like to use?"
echo "1) Service Account Key"
echo "2) gcloud CLI (requires installation)"
echo "3) Continue with Mock Mode"
echo ""
read -p "Enter choice (1-3): " choice

case $choice in
    1)
        echo ""
        read -p "Enter path to your service account JSON key file: " keyfile
        if [ -f "$keyfile" ]; then
            export GOOGLE_APPLICATION_CREDENTIALS="$keyfile"
            echo "export GOOGLE_APPLICATION_CREDENTIALS=\"$keyfile\"" >> ~/.bashrc
            echo "GOOGLE_APPLICATION_CREDENTIALS=\"$keyfile\"" >> .env
            # Remove SKIP_FIREBASE_INIT from .env
            sed -i '/SKIP_FIREBASE_INIT/d' .env
            echo "✅ Authentication configured with service account key"
            echo "✅ Updated .env file"
            echo "🔄 Restart your application for changes to take effect"
        else
            echo "❌ File not found: $keyfile"
            exit 1
        fi
        ;;
    2)
        if command -v gcloud &> /dev/null; then
            echo "Running: gcloud auth application-default login"
            gcloud auth application-default login
            gcloud config set project glass-radar-476711-a6
            # Remove SKIP_FIREBASE_INIT from .env
            sed -i '/SKIP_FIREBASE_INIT/d' .env
            echo "✅ Authentication configured with gcloud CLI"
            echo "🔄 Restart your application for changes to take effect"
        else
            echo "❌ gcloud CLI not installed. Please install it first."
            exit 1
        fi
        ;;
    3)
        echo "✅ Continuing with mock mode"
        echo "Your app will run without real Google Cloud authentication"
        ;;
    *)
        echo "Invalid choice"
        exit 1
        ;;
esac
