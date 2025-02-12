## Hurry up and wait

--8<-- "snippets/bizevent-installation-explained.js"

!!! warning "Grab a Coffee"
    Everything is installing. This can take a while.

    While you wait, the section below will explain what you've just configured and how it works.

The following components will be installed:

* Dynatrace Operator
* Dynatrace OneAgent
* Dynatrace ActiveGate
* Unguard application

The Dynatrace details you provided during startup will be encrypted, stored in GitHub secrets and made available as environment variables.

!!! tip
    Type `printenv` to see all environment variables
    set by GitHub.

## Wait for System

The system may still be loading.

Wait until the `Running postCreate command` loading spinner disappears.

!!! bug "TODO"
    Update image

![codespace loading](images/codespace-loading.png)

Wait here until the terminal prompt looks like this (your username will differ).

!!! bug "TODO"
    Update Image

![codespace interactive](images/codespace-interactive.png)

## Wait for Application

The Kubernetes cluster is available and the application is starting.

Wait for all pods to be Ready (can take up to 10mins)

```
kubectl -n dynatrace wait --for condition=Ready pod --timeout=10m --all
kubectl -n unguard wait --for condition=Ready pod --timeout=10m --all
```

The command will appear to hang until all pods are available.

When all pods are running, the output will look like this:

```
pod/dynatrace-oneagent-csi-driver-****** condition met
pod/dynatrace-operator-******-*** condition met
pod/dynatrace-webhook-******-*** condition met
pod/dynatrace-webhook-******-*** condition met
pod/unguard-activegate-0 condition met
pod/unguard-ad-service-******-*** condition met
pod/unguard-envoy-proxy-******-*** condition met
pod/unguard-frontend-******-*** condition met
pod/unguard-like-service-******-*** condition met
pod/unguard-mariadb-0 condition met
pod/unguard-membership-service-******-*** condition met
pod/unguard-microblog-service-******-*** condition met
pod/unguard-payment-service-******-*** condition met
pod/unguard-profile-service-******-*** condition met
pod/unguard-proxy-service-******-*** condition met
pod/unguard-redis-******-*** condition met
pod/unguard-status-service-******-*** condition met
pod/unguard-user-auth-service-******-*** condition met
pod/unguard-user-simulator-******-*** condition met
```

<div class="grid cards" markdown>
- [Click Here to Continue :octicons-arrow-right-24:](access-ui.md)
</div>