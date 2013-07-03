# Ninja build

This npm package downloads and builds [Ninja](http://martine.github.io/ninja/),
a small build system that is lean and fast. The npm package itself is just
a wrapper, typically allowing the easy use of Ninja inside a Node.js project.

To use in your project, you may run:

```sh
$ npm install ninja-build --save-dev
```

Then you can access the Ninja binary:

```sh
$ node_modules/ninja-build/bin/ninja
```

You can install the package globally as well; in this case `ninja` will be
available on the command line everywhere. This is not recommended, because
the ninja version can conflict between different projects.

Right now, the installed version of Ninja is 1.3.4. It won't work on Windows
because the bootstrap is written for `bash` (should be migrated to Python or
best, JS). Feel free to open a pull request for any possible improvements,
including potential future Ninja version increase.
