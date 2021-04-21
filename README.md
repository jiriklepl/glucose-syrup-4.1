# Directory overview:


mtl/            Minisat Template Library
core/           A core version of the solver glucose (no main here)
simp/           An extended solver with simplification capabilities
parallel/       A multicore version of glucose
DEBIAN/         package meta directory
README.md
README
LICENSE
Changelog

## To build the debian package:

```sh
./build.sh
```

## To install the debian package:

```sh
dpkg -i glucose-4.1.deb
```

## Usage:

- for the extended solver with simplification capabilities:

    ```sh
    glucose --help
    ```

- for the multicore version of glucose:

    ```sh
    glucose-syrup --help
    ```
