# crafttp
A version of [$http](https://docs.angularjs.org/api/ng/service/$http) that does not trigger updates of the [$rootScope](https://docs.angularjs.org/api/ng/type/$rootScope.Scope)

It behaves as `$http` does, with all of its interceptors and so forth. However it does not trigger a digest of the `$rootScope`. You can cause a targeted digest by passing `scope` as an option.

## Usage

    crafttp({
      method: 'GET',
      scope: scope,
      url: '/foo/bar'
    }).then(function (result) { /** ... */ });
