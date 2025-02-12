## Access The Demo User Interface

--8<-- "snippets/bizevent-access-user-interface.js"

Expose the user interface on port 8080 by port-forwarding:

```
kubectl -n unguard port-forward svc/unguard-envoy-proxy 8080:8080
```

Leave this command running. It will appear to hang. That's OK.

Go to the `Ports` tab, right click the port `8080` and choose `Open in Browser`.

!!! bug "Bug: Appended port :8080"

    ![unguard page not found](images/unguard-page-not-found.png)

    You will get a "page cannot be found" error.

    Notice the URL looks like this:

    ```
    https://codespace-name-ID-8080.app.github.dev:8080/ui
    ```

!!! success "The fix"
    Remove `:8080` and refresh.

    ```
    https://codespace-name-ID-8080.app.github.dev/ui
    ```

    If you see an "Unauthorized" page, it's working!

![unguard unauthorized](images/unguard-unauthorized.png)

## Register an Account

To use Unguard, first register an account.

* Click the `Login/Register` link
* Enter any username + password you want
* Click `Sign up`

![unguard sign up form](images/unguard-sign-up-form.png)

You will be taken back to the sign in form. Now log in.

You should now see your timeline with a prepopulated feed.

![unguard timeline](images/unguard-timeline.png)

<div class="grid cards" markdown>
- [Click Here to Continue :octicons-arrow-right-24:](view-observability-data.md)
</div>