# =============================================================================
#  Dockerfile — changedetection.io for Railway
#  Pinned to upstream v0.55.7
#  Source: https://github.com/dgtlmoon/changedetection.io
#  Image: https://github.com/dgtlmoon/changedetection.io/pkgs/container/changedetection.io
# =============================================================================

FROM ghcr.io/dgtlmoon/changedetection.io:0.55.7

# Railway assigns a dynamic PORT at runtime.
# changedetection.io reads PORT from the environment natively — no wrapper needed.
EXPOSE 5000

# Health check — hits the main page to confirm the Flask app is responding
HEALTHCHECK --interval=30s --timeout=10s --start-period=15s --retries=3 \
    CMD python -c "import urllib.request, os; urllib.request.urlopen(f'http://localhost:{os.getenv(\"PORT\", \"5000\")}/')" || exit 1
