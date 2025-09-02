# https://just.systems

cloudflared := "argocd/applications/cloudflared"
neguko := "argocd/applications/neguko"
wave-exploder := "argocd/applications/wave-exploder"

seal:
    helm template --dry-run {{cloudflared}} -s templates/secret.yaml | kubeseal --cert kikuri1.pem -o yaml > {{cloudflared}}/templates/sealed.yaml
    helm template --dry-run {{neguko}} -s templates/secret.yaml | kubeseal --cert kikuri1.pem -o yaml > {{neguko}}/templates/sealed.yaml
    helm template --dry-run {{wave-exploder}} -s templates/secret.yaml | kubeseal --cert kikuri1.pem -o yaml > {{wave-exploder}}/templates/sealed.yaml