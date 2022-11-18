# tailscale-subnet-router

![Version: 1.1.0](https://img.shields.io/badge/Version-1.0.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.26.2](https://img.shields.io/badge/AppVersion-latest-informational?style=flat-square)

Deploy Tailscale as a subnet router on Kubernetes

**Homepage:** <https://github.com/denis-ev/helm-charts/charts/tailscale-subnet-router>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Denis Evers | <github.a8umu@simplelogin.com> | <https://evers.sh> |

## Source Code

* <https://github.com/denis-ev/helm-charts/charts/tailscale-subnet-router>

## Prerequesites

Before installing this Chart, you'll need the following:

1. Create Tailscale Account
2. Create reusable [auth key](https://tailscale.com/kb/1085/auth-keys/)
3. Create Kubernetes Secret 
4. Checkout Tailscale Docs for more information what this Chart is based on. [Subnet + Kubernetes](https://github.com/tailscale/tailscale/tree/main/docs/k8s#subnet-router)

## A note on secrets

This Chart does not expose a value to pass your Tailscale auth keys in, as the author populates these via other means (the Vault CSI driver).

Whether you manually create it or sync it in via other means (Vault, Sealed Secrets, etc), a Secret will need to exist in your target namespace before installing the Chart.

Unless overridden, the Chart will assume that you have a Secret named `tailscale-subnet-router-secrets` whose `AUTH_KEY` key contains your router's Tailscale auth key.

## Installing the Chart

To install the chart with the release name `my-release`:

```console
$ helm repo add denis-ev https://denis-ev.github.io/helm-charts
$ helm install tailscale-subnet-router denis-ev/tailscale-subnet-router
```

If all goes well, you should see a new Subnet router in your Tailscale admin page.

**Note: To access the subnet open the tailscale admin page, enable the route(s) and disable key expiry.**

## Uninstalling the Chart

To uninstall/delete the `tailscale-subnet-router` deployment:

```console
$ helm delete tailscale-subnet-router
```

The command removes the chart and deletes the release.

**Tip: Limit the Tailscale Key to only afew days and revoke it after successful deployment or when deleting the Chart**

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | [Affinity](https://kubernetes.io/docs/concepts/configuration/assign-pod-node/#affinity-and-anti-affinity) for pod assignment |
| fullnameOverride | string | `""` | Optional override for app fullname |
| image.pullPolicy | string | `"Always"` |  |
| image.repository | string | `"ghcr.io/tailscale/tailscale:latest"` | **Build your own image and override this!** |
| image.tag | string | `"latest"` |  |
| imagePullSecrets | list | `[]` | List the secrets containing the Docker creds for images in this Chart |
| nameOverride | string | `""` | Optional override for app name |
| nodeSelector | object | `{}` | Node labels for [pod assignment](https://kubernetes.io/docs/user-guide/node-selection/) |
| podAnnotations | object | `{}` | Additional annotations for the pods |
| podSecurityContext | object | `{}` |  |
| replicas | int | `1` | Do not change! Only `1` is currently supported. |
| resources | object | `{}` | Resources to allocate to the pods |
| securityContext.runAsGroup | int | `1000` | The GID of the user to run the router as |
| securityContext.runAsUser | int | `1000` | The UID of the user to run the router as |
| serviceAccount | object | `{"annotations":{},"create":true,"name":""}` | The service account to create or attach |
| tailscale.auth.secretKey | string | `"AUTH_KEY"` | The key within the above Secret that contains a Tailscale auth key |
| tailscale.auth.secretName | string | `"tailscale-subnet-router-secrets"` | The name of the secret containing a Tailscale auth key |
| tailscale.routes | list | `["10.96.0.0/12","10.244.0.0/16"]` | Routes for the subnet router to publish |
| tailscale.state.secretName | string | `"tailscale-subnet-router-state"` | The secret that the subnet router will store its state in |
| tailscale.extraEnv | list(object) | `[]` | Additional environment variables to include in the StatefulSet |
| tolerations | list | `[]` | [Tolerations](https://kubernetes.io/docs/concepts/configuration/taint-and-toleration/) for pod assignment |
| volumeMounts | list | `[]` | Additional volumes to add to mount to the primary container |
| volumes | list | `[]` | Additional volumes to add to the pod |

