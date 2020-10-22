# demonstrator
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/1100f7236ecb405f8063b2533a6924eb)](https://app.codacy.com/gh/SCRATCh-ITEA3/demonstrator?utm_source=github.com&utm_medium=referral&utm_content=SCRATCh-ITEA3/demonstrator&utm_campaign=Badge_Grade_Dashboard)
[![Build Status](https://cloud.drone.io/api/badges/SCRATCh-ITEA3/demonstrator/status.svg)](https://cloud.drone.io/SCRATCh-ITEA3/demonstrator) [![Documentation Status](https://readthedocs.org/projects/scratch-itea3-demonstrator/badge/?version=latest)](https://scratch-itea3-demonstrator.readthedocs.io/en/latest/?badge=latest) [![](https://images.microbadger.com/badges/image/scratchitea3/demonstrator.svg)](https://microbadger.com/images/scratchitea3/demonstrator "Get your own image badge on microbadger.com")

[![SCRATCh - funded by BMBF](https://img.shields.io/badge/part%20of-SCRATCh-yellow)](https://scratch-itea3.eu/)
![SCRATCh - funded by BMBF](https://img.shields.io/badge/funded%20by-BMBF-blue)
[![ITEA3](https://img.shields.io/badge/supported%20by-ITEA3-orange)](https://www.itea3.org)


This repository: <https://github.com/SCRATCh-ITEA3/demonstrator>

Build pipeline: <https://cloud.drone.io/SCRATCh-ITEA3/demonstrator>

The docker hub registry: <https://hub.docker.com/repository/docker/scratchitea3/demonstrator>

Read the docs documentation: <https://scratch-itea3-demonstrator.readthedocs.io/en/latest/>

## Run the demonstrator from the docker hub

On x86 platform run

```shell
docker pull scratchitea3/demonstrator:latest
docker run scratchitea3/demonstrator:latest
```

On arm platform run

```shell
docker pull scratchitea3/demonstrator:arm-latest
docker run scratchitea3/demonstrator:arm-latest
```

## Build it locally
As docker hub sometimes delays the build, its adviced to test the software locally.

```shell
docker-compose build
docker-compose up
```
