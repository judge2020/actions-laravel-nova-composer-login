
# Note: this was for the old HCL-based GitHub Actions. See [instructions for the YML syntax actions](https://github.com/judge2020/actions-laravel-nova-composer-login/issues/1#issuecomment-623671063).

---


This package allows you to have a GitHub action that authorizes/logs you in to allow downloading releases from nova.laravel.com. This matches [Authenticating Nova in Continuous Integration (CI) Environments](https://nova.laravel.com/docs/2.0/installation.html#authenticating-nova-in-continuous-integration-ci-environments) from the docs.

#### Usage

Add a action to your workflow that uses this repository, with the secrets `NOVA_USERNAME` and `NOVA_PASSWORD` set. `NOVA_PASSWORD` can be either your login password or [your API token](https://nova.laravel.com/settings#password).

```
action "composer-auth" {
  uses = "judge2020/actions-laravel-nova-composer-login@master"
  secrets = ["NOVA_USERNAME", "NOVA_PASSWORD"]
}
```

Then, you should have an action (that "needs" the first action) that runs the actual composer install. For example:

```
action "composer-install" {
  uses = "judge2020/php-docker-build@b810ae30f8d999c5c5391ca20521a952ac922f7a"
  args = "install --no-interaction --no-progress --no-ansi --no-dev"
  runs = "composer"
  needs = ["composer-auth"]
}
```

Composer should have no problem pulling from nova.laravel.com to get the "laravel/nova" package.

Note: the "uses" here is just an example. You can use [this target](https://github.com/judge2020/php-docker-build/blob/b810ae30f8d999c5c5391ca20521a952ac922f7a/Dockerfile) which has gettext + everything from chialab/php, `docker://chialab/php:7.2` without gettext, your existing php dockerfile (with all the extensions you need), or `docker://composer`.

