# https://just.systems

cloudflared := "argocd/applications/cloudflared"
neguko := "argocd/applications/neguko"

seal:
    helm template --dry-run {{cloudflared}} -s templates/secret.yaml | kubeseal --cert kikuri1.pem -o yaml > {{cloudflared}}/templates/sealed.yaml
    helm template --dry-run {{neguko}} -s templates/secret.yaml | kubeseal --cert kikuri1.pem -o yaml > {{neguko}}/templates/sealed.yaml