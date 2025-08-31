# https://just.systems

cloudflared := "./argocd/applications/cloudflared"

[working-directory: './argocd/applications/cloudflared']
seal:
    helm template --dry-run . -s templates/secret.yaml | kubeseal --cert ../../../kikuri1.pem -o yaml > ./templates/sealed.yaml