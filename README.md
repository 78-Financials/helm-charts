# helm-charts
Helm chart repository   
[![Release Charts](https://github.com/78-Financials/helm-charts/actions/workflows/release.yaml/badge.svg)](https://github.com/78-Financials/helm-charts/actions/workflows/release.yaml)

## Usage

[Helm](https://helm.sh) must be installed to use the charts.  Please refer to
Helm's [documentation](https://helm.sh/docs) to get started.

Once Helm has been set up correctly, add the repo as follows:
```bash
  helm repo add 78financials https://78-Financials.github.io/helm-charts
```

If you had already added this repo earlier, run `helm repo update` to retrieve
the latest versions of the packages.  You can then run `helm search repo
78financials` to see the charts.

### To install the 78financials chart:
```bash
  helm install 78financials 78financials/78financials
```
### To uninstall the chart:
```bash
  helm uninstall 78financials
```

### Local development

```bash
helm template 78financials charts/78financials/ --values charts/78financials/values.yaml
```

```bash
helm upgrade --install nginx charts/78financials/ --values charts/78financials/values.yaml
```

```bash
helm template payaza charts/payaza/ --values charts/payaza/values.yaml
```

```bash
helm upgrade --install nginx charts/payaza/ --values charts/payaza/values.yaml
```
