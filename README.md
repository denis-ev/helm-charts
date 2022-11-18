# denis-ev's Helm Chart Repo

This repository contains Denis Evers' hoard of Helm Charts.

**Note: The Charts in this repository are not intended for direct use in production. Please fork and customize to your liking!**

## TL;DR

```bash
$ helm repo add denis-ev https://denis-ev.github.io/helm-charts
$ helm search repo denis-ev
$ helm install my-release denis-ev/<chart>
```

## Customization and contributions

While contributions are welcome in this repository, these Charts are in oriented towards the needs of the author in the context of their own personal use. Changes that increase the complexity of the Charts may best happen in a fork.

## Kubernetes and Helm compatibility

The Helm Charts in this repository support only the two most recent stable versions of Kubernetes. If you need to retrofit support for older versions of Kubernetes, please fork and customize as you see fit.

Only Helm 3.x is supported. The maintainer of these Charts tends to run the latest stable release. 

## Support and stability guarantees

None offered! Please fork and/or vendor any Charts in here to avoid surprises.
