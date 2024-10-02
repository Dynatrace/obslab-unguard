# Getting Started

!!! tip "Larger Images"
    To enlarge images, right click and open in new tab.

## Dynatrace Environment

You must have access to a Dynatrace SaaS environment. [Sign up here](https://dt-url.net/trial){target="_blank"}

Save the Dynatrace environment ID and environment

* The ID is the first portion of the URL. (eg. `acb12345` from `https://abc12345.live.dynatrace.com`)
* Your environment is probably `live` but could also be `sprint` or `dev`

## Create API Token

In Dynatrace:

* Press `ctrl + k`. Search for `access tokens`.
* Create a new access token with the following permissions:
    * `entities.read`
    * `settings.read`
    * `settings.write`
    * `DataExport`
    * `InstallerDownload`
    * `activeGateTokenManagement.create`
    * `metrics.ingest`

These permissions are required to install the OneAgent in `applicationMode` + an ActiveGate on a Kubernetes cluster.

## Start Demo

You've done the hard work! It is time to spin up the demo environment.

Click this button to open the demo environment. This will open in a new tab.

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/dynatrace/obslab-unguard){target="_blank"}

* Fill in the form with the details you've already gathered.
* Click `Create codespace`
* Proceed to the next documentation step with the link below.

![codespace form](images/codespace-form.png)


<div class="grid cards" markdown>
- [Click Here to Continue :octicons-arrow-right-24:](installation-explained.md)
</div>