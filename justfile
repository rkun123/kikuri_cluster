# https://just.systems

cloudflared := "argocd/applications/cloudflared"

seal:
    helm template --dry-run {{cloudflared}} -s templates/secret.yaml | kubeseal --cert kikuri1.pem -o yaml > {{cloudflared}}/templates/sealed.yaml
