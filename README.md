# [floppy/readarr](https://github.com/floppy/docker-readarr)

This is a Docker image for [Readarr](https://github.com/Readarr/Readarr), forked from
the [Sonarr image from Linuxserver.io](https://github.com/linuxserver/docker-sonarr).
If you've used their images before, you'll be OK here.

## Architectures

| Architecture | Tag |
| :----: | --- |
| x86-64 | amd64-unstable |
| arm64 | arm64-unstable |
| armhf | armhf-unstable |

`armhf` is tested, the others aren't, but are built consistently so should work?

### docker

```
docker create \
  --name=readarr \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Europe/London \
  -e UMASK_SET=022 `#optional` \
  -p 8787:8787 \
  -v /path/to/data:/config \
  -v /path/to/books:/books \
  -v /path/to/downloadclient-downloads:/downloads \
  --restart unless-stopped \
  floppy/readarr
```

## Parameters

| Parameter | Function |
| :----: | --- |
| `-p 8787` | The port for the Readarr webinterface |
| `-e PUID=1000` | for UserID - see below for explanation |
| `-e PGID=1000` | for GroupID - see below for explanation |
| `-e TZ=Europe/London` | Specify a timezone to use EG Europe/London, this is required for Sonarr |
| `-e UMASK_SET=022` | control permissions of files and directories created by Sonarr |
| `-v /config` | Database and sonarr configs |
| `-v /books` | Location of library on disk (See note in Application setup) |
| `-v /downloads` | Location of download managers output directory (See note in Application setup) |

## User / Group Identifiers

When using volumes (`-v` flags) permissions issues can arise between the host OS and the container, we avoid this issue by allowing you to specify the user `PUID` and group `PGID`.

Ensure any volume directories on the host are owned by the same user you specify and any permissions issues will vanish like magic.

In this instance `PUID=1000` and `PGID=1000`, to find yours use `id user` as below:

```
  $ id username
    uid=1000(dockeruser) gid=1000(dockergroup) groups=1000(dockergroup)
```
