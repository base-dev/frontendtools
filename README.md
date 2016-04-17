# Frontend Tools

Docker image with some development tools.

This image builds from `thgs/cli`, which builds from `debian:jessie`.

*Fair warning*: This image may not be available from docker hub in the future,
see [Building the image](#Building-the-image) for build instructions.

### Includes
- node 0.12
- npm@latest-2
- bower
- webpack
- gulp

## Usage

The tools runs in the `/data` directory, so just mount your project folder there.

```sh
$ docker run -v "${PWD}":/data tghs/npm [node|npm|bower|webpack|gulp]

# Explanation:
docker run                    # Run a docker container
-v "${PWD}":/data             # Use PWD as root directory for tools
tghs/npm                      # The docker image (subject to change)
[node|npm|bower|webpack|gulp] # The command to run

If you look at the image you'll see that we just run whatever command is passed
in, so you could issue an `ls` command if you wanted to.

Notice that we didn't specify the `-i`(interactive) or the
`-t`(pseudo-terminal) flags in the examples. This is because we almost never
need it, but for commands like `npm init` that wants to do interactive
querying, you would need to pass those flags.


```

## Building the image

You can build this image as any other docker image:

```
docker build .
```

Or optionally with a tag, like we do when we want to push it to i.e. docker hub:

```
docker build -t tghs/npm .
```
