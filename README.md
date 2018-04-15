Ethereum Social Network Stats
============
[![Build Status][travis-image]][travis-url] [![dependency status][dep-image]][dep-url]

This is a visual interface for tracking ethereum social network status. It uses WebSockets to receive stats from running nodes and output them through an angular interface. It is the front-end implementation for [etsc-net-intelligence-api](https://github.com/ethereumsocial/etsc-net-intelligence-api).

![Screenshot](https://raw.githubusercontent.com/cubedro/eth-netstats/master/src/images/screenshot.jpg?v=0.0.6 "Screenshot")

## How to list my nodes on [stats.ethereumsocial.kr](https://stats.ethereumsocial.kr) ?

You can use [multi-geth](https://github.com/ethereumsocial/multi-geth) or [etsc-net-intelligence-api](https://github.com/ethereumsocial/etsc-net-intelligence-api) for connecting to netstats server.

Using multi-geth

Add --ethstats option behind the start command

example)

```bash
geth --social --ethstats "<your-nickname>:NewEthereumSocial@stats.ethereumsocial.kr"
```

## Prerequisite

* node
* npm

## Installation

Make sure you have node.js and npm installed.

Clone the repository and install the dependencies

```bash
git clone https://github.com/ethereumsocial/etsc-netstats
cd etsc-netstats
npm install
sudo npm install -g grunt-cli
```

## Build the resources

NetStats features two versions: the full version and the lite version. In order to build the static files you have to run grunt tasks which will generate dist or dist-lite directories containing the js and css files, fonts and images.


To build the full version run
```bash
grunt
```

To build the lite version run
```bash
grunt lite
```

If you want to build both versions run
```bash
grunt all
```

## Run

```bash
npm start
```

## Run in PM2 - daemon mode.

* Install PM2:
```bash
sudo npm install -g pm2
```

* Create an app.json file in the local directory of etsc-netstats:
```json[
  {
    "name"        : "etsc-netstats",
    "cwd"         : "<folder-path-to-etsc-netstats-e.g. /home/gethadmin/etsc-netstats/>",
    "script"      : "app.js",
    "log_date_format"   : "YYYY-MM-DD HH:mm Z",
    "merge_logs"    : false,
    "watch"       : false,
    "exec_interpreter"  : "node",
    "exec_mode"     : "fork_mode",
    "env":
    {
      "NODE_ENV"    : "development",
      "PORT"           : <port>,
      "WS_SECRET"     : "<password>"
    }
  }
]
```

* Run etsc-netstats as PM2 service and persist the service for reboot
```bash
pm2 start ./app.json
pm2 save
```

see the interface at http://localhost:3000

[travis-image]: https://travis-ci.org/ethereumsocial/etsc-netstats.svg
[travis-url]: https://travis-ci.org/ethereumsocial/etsc-netstats
[dep-image]: https://david-dm.org/ethereumsocial/etsc-netstats.svg
[dep-url]: https://david-dm.org/ethereumsocial/etsc-netstats
