
# stock-ops

|                 | `master` | `production` |
| ------          | ------   | ------       |
| stock-collector | [![Build Status](https://travis-ci.org/peterbecich/stock-collector.svg?branch=master)](https://travis-ci.org/peterbecich/stock-collector) | [![Build Status](https://travis-ci.org/peterbecich/stock-collector.svg?branch=production)](https://travis-ci.org/peterbecich/stock-collector) |
| stock-servant | [![Build Status](https://travis-ci.org/peterbecich/stock-servant.svg?branch=master)](https://travis-ci.org/peterbecich/stock-servant) | [![Build Status](https://travis-ci.org/peterbecich/stock-servant.svg?branch=production)](https://travis-ci.org/peterbecich/stock-servant) |
| stock-stats | [![Build Status](https://travis-ci.org/peterbecich/stock-stats.svg?branch=master)](https://travis-ci.org/peterbecich/stock-stats) | [![Build Status](https://travis-ci.org/peterbecich/stock-stats.svg?branch=production)](https://travis-ci.org/peterbecich/stock-stats) |
| stock-common | [![Build Status](https://travis-ci.org/peterbecich/stock-common.svg?branch=master)](https://travis-ci.org/peterbecich/stock-common) | [![Build Status](https://travis-ci.org/peterbecich/stock-common.svg?branch=production)](https://travis-ci.org/peterbecich/stock-common) |
| stock-frontend | [![Build Status](https://travis-ci.org/peterbecich/stock-frontend.svg?branch=master)](https://travis-ci.org/peterbecich/stock-frontend) | [![Build Status](https://travis-ci.org/peterbecich/stock-frontend.svg?branch=production)](https://travis-ci.org/peterbecich/stock-frontend) |

Part of demo project for web service.  Data from [https://www.alphavantage.co/](https://www.alphavantage.co/)

Demo:
[http://www.peterbecich.me/index.html](http://www.peterbecich.me/index.html)


## Quick start with Docker Swarm

```
 docker stack deploy --compose-file docker-compose.yml stocks
```

```
docker service create --replicas 1 --name stock-common-load-stocks --network stocks_stock-network -e "POSTGRES_PASSWORD=${POSTGRES_PASSWORD}" peterbecich/stock-common-load-stocks
```

```
docker service create --replicas 1 --name stock-collector --network stocks_stock-network -e "POSTGRES_PASSWORD=${POSTGRES_PASSWORD}" -e "ALPHA_VANTAGE_KEY=${alpha_vantage_key}" peterbecich/stock-collector-stock-collector:latest

```


