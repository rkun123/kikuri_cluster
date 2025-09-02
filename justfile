# https://just.systems

cloudflared := "argocd/applications/cloudflared"
neguko := "argocd/applications/neguko"
wave_exploder := "argocd/applications/wave_exploder"

seal:
    helm template --dry-run {{cloudflared}} -s templates/secret.yaml | kubeseal --cert kikuri1.pem -o yaml > {{cloudflared}}/templates/sealed.yaml
    helm template --dry-run {{neguko}} -s templates/secret.yaml | kubeseal --cert kikuri1.pem -o yaml > {{neguko}}/templates/sealed.yaml
    helm template --dry-run {{wave_exploder}} -s templates/secret.yaml | kubeseal --cert kikuri1.pem -o yaml > {{wave_exploder}}/templates/sealed.yaml